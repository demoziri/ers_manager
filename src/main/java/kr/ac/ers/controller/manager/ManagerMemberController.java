package kr.ac.ers.controller.manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.EcallModifyCommand;
import kr.ac.ers.command.EcallRegistCommand;
import kr.ac.ers.command.ManagerReportSearchCriteria;
import kr.ac.ers.command.MemberModifyCommand;
import kr.ac.ers.command.MemberRegistCommand;
import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.AddressVO;
import kr.ac.ers.dto.ApplyFileVO;
import kr.ac.ers.dto.EcallVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.dto.ReportVO;
import kr.ac.ers.service.AddressService;
import kr.ac.ers.service.EcallService;
import kr.ac.ers.service.LsupporterService;
import kr.ac.ers.service.ManagerReportSerivce;
import kr.ac.ers.service.MemberService;
import kr.ac.ers.utils.MakeFileName;
import kr.ac.ers.view.FileDownloadView;

@Controller
@RequestMapping("ers/manager/member")
public class ManagerMemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private EcallService ecallService;

	@Autowired
	private AddressService addressService;

	@Autowired
	private ManagerReportSerivce managerReportSerivce;

	@Autowired
	private LsupporterService lsupporterSerivce;

	@GetMapping("/main")
	public ModelAndView memberMain(MemberSearchCriteria cri, ModelAndView mnv) {
		String url = "manager/member/main";

		if (cri.getPage() < 1)
			cri.setPage(1);
		if (cri.getPerPageNum() < 1)
			cri.setPerPageNum(5);

		Map<String, Object> dataMap = memberService.getMemberList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@ResponseBody
	@PostMapping("/repSearch")
	public List<ReportVO> repSearchList(ManagerReportSearchCriteria reCri) {
		System.out.println(reCri);

		List<ReportVO> reportList = managerReportSerivce.getReportListToMemberMain(reCri);

		return reportList;
	}

	@GetMapping("/detail")
	public ModelAndView memberDetail(String id, ModelAndView mnv) {

		String url = "manager/member/detail";

		MemberVO member = memberService.getMemberById(id);
		member.setApplyfile(memberService.getApplyFile(id));

		int machineCount = memberService.countMachineCheck(id);
		member.setMachineCk(machineCount);

		String wName = memberService.selectLsupporterName(id);
		member.setW_Name(wName);

		int ecallCount = ecallService.getEcallCount(id);
		member.setE_count(ecallCount);

		ManagerReportSearchCriteria reCri = new ManagerReportSearchCriteria();
		reCri.setId(id);
		List<ReportVO> reportList = managerReportSerivce.getReportListToMemberMain(reCri);

		mnv.addObject("reportList", reportList);

		mnv.addObject("member", member);
		mnv.addObject("id", id);
		mnv.setViewName(url);

		return mnv;

	}

	@ResponseBody
	@GetMapping("/ecall")
	public List<EcallVO> ecallList(String id) {
		List<EcallVO> ecallList = ecallService.getEcallList(id);

		return ecallList;
	}

	@ResponseBody
	@PostMapping("/modifyEcall")
	public void modifyEcall(EcallModifyCommand eModifyReq) {
		EcallVO ecall = eModifyReq.toEcallVO();

		ecallService.modifyEcall(ecall);
		System.out.println(ecall);
	}

	@ResponseBody
	@GetMapping("/regLsupp")
	public List<LsupporterStatusVO> lsuppList(String id) {
		List<LsupporterStatusVO> lsuppList = memberService.getLsuppList(id);
		return lsuppList;
	}

	@ResponseBody
	@RequestMapping("/regLsupporter")
	public void regLsupporter(String id, String wid) {
		MemberVO member = memberService.getMemberById(id);
		member.setWid(wid);
		member.setStatus("1");
		memberService.registLsupporter(wid, id);
	}

	@ResponseBody
	@RequestMapping("/lsuppName")
	public String lsuppName(String id) {
		String lsuppName = memberService.selectLsupporterName(id);

		return lsuppName;

	}

	@ResponseBody
	@GetMapping("/dongList")
	public List<AddressVO> dongList(String gu) {

		List<AddressVO> dongList = addressService.getDongList(gu);

		return dongList;
	}

	@GetMapping("/regist")
	public ModelAndView memberRegistForm(ModelAndView mnv) {
		String id = memberService.nextId();
		String url = "manager/member/regist";
		mnv.addObject("id", id);
		mnv.setViewName(url);

		return mnv;
	}

	
	@ResponseBody
	@PostMapping("/doRegist")
	public String memberRegist(MemberRegistCommand registReq, EcallRegistCommand eRegistReq) throws Exception {

		MultipartFile multiFiles = registReq.getUploadfile();
		String savePath = this.fileUploadPath;
		ApplyFileVO applyFile = saveFileToApply(multiFiles, savePath);
		
		applyFile.setId(registReq.getId());
		applyFile.setManid(registReq.getManid());

		MemberVO newMember = registReq.toMemberVO();
		newMember.setApplyfile(applyFile);

		MemberVO checkMember = memberService.getMemberById(registReq.getId());
		if (checkMember == null) {
			memberService.regist(newMember);
			EcallVO ecall = eRegistReq.toEcallVO();
			ecallService.registEcall(ecall);

		} else {
			EcallVO ecall = eRegistReq.toEcallVO();
			ecallService.registEcall(ecall);

		}

		return newMember.getId();
	}

	private ApplyFileVO saveFileToApply(MultipartFile multiFiles, String savePath) throws Exception {
		ApplyFileVO applyFile = new ApplyFileVO();
		// 저장 -> attachVO -> list.add
		if (multiFiles != null) {

			String fileName = MakeFileName.toUUIDFileName(multiFiles.getOriginalFilename(), "$$");
			File target = new File(savePath, fileName);
			target.mkdirs();
			multiFiles.transferTo(target);

			applyFile.setUploadpath(savePath);
			applyFile.setFilename(fileName);
			applyFile.setFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
		}

		return applyFile;
	}
	
	
	@Value("${fileUploadPath}")
	private String fileUploadPath;


	@GetMapping("/getFile")
	public ModelAndView getFile(String id, Model model) throws Exception {
		ModelAndView modelAndView = new ModelAndView(new FileDownloadView());
		ApplyFileVO applyFile = memberService.getApplyFile(id);

		model.addAttribute("savedPath", applyFile.getUploadpath());
		model.addAttribute("fileName", applyFile.getFilename());

		return modelAndView;
	}
	
	

	@Value("${picturePath}")
	private String picturePath;

	@Value("${lsuppPicturePath}")
	private String lsuppPicturePath;

	@PostMapping(value = "/picture", produces = "text/plain;charset=utf-8")
	@ResponseBody // String을 직접 내보내고자 할 때
	public String pictureUpload(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception {

		// file명
		String result = "";

		/* 파일 저장 확인 */
		result = savePicture(oldPicture, multi);

		return result;
	}

	public String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = "";

		/* 파일저장폴더설정 */
		String uploadPath = this.picturePath;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)) {
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			// local HDD 에 저장
			multi.transferTo(storeFile);
		}

		// 기존파일 삭제
		if (oldPicture != null && !oldPicture.isEmpty()) {
			File oldFile = new File(uploadPath, oldPicture);
			if (oldFile.exists()) {
				oldFile.delete();
			}
		}
		return fileName;
	}

	@GetMapping("/getPicture")
	@ResponseBody
	public byte[] getPicture(String id) throws Exception {
		MemberVO member = memberService.getMemberById(id);
		if (member == null)
			return null;

		String picture = member.getPicture();
		String imgPath = this.picturePath;

		InputStream in = new FileInputStream(new File(imgPath, picture));

		return IOUtils.toByteArray(in);
	}

	@GetMapping("/getLsuppPicture")
	@ResponseBody
	public byte[] getLsuppPicture(String wid) throws Exception {
		LsupporterStatusVO lsupporter = lsupporterSerivce.selectlsupporterStatus(wid);
		if (lsupporter == null)
			return null;

		String picture = lsupporter.getPicture();
		String imgPath = this.lsuppPicturePath;

		InputStream in = new FileInputStream(new File(imgPath, picture));

		return IOUtils.toByteArray(in);
	}

	@GetMapping("/modify")
	public String modifyForm(String id, Model model) {
		MemberVO member = memberService.getMemberById(id);
		int ecallCount = ecallService.getEcallCount(id);
		member.setE_count(ecallCount);

		model.addAttribute("member", member);

		return "manager/member/modify";
	}

	@ResponseBody
	@PostMapping("/doModify")
	public MemberVO memberModify(MemberModifyCommand modifyReq) {

		MemberVO member = modifyReq.toMemberVO();
		// 기존 사진
		String oldPicture = memberService.getMemberById(modifyReq.getId()).getPicture();

		if (modifyReq.getPicture() != null && modifyReq.getPicture().getSize() > 0) {
			String fileName;
			try {
				fileName = savePicture(oldPicture, modifyReq.getPicture());
				member.setPicture(fileName);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			member.setPicture(oldPicture);
		}

		memberService.modifyMember(member);

		// System.out.println(member.getName());
		MemberVO modifiedMember = memberService.getMemberById(modifyReq.getId());
		return modifiedMember;
	}

	@GetMapping("/reDetail")
	public ModelAndView reportDetail(int rno, ModelAndView mnv) {
		String url = "manager/member/memReport";
		ReportVO report = managerReportSerivce.getReportByRno(Integer.toString(rno));
		report.setReportfile(managerReportSerivce.getReportFileByRno(rno));
		
		
		
		mnv.addObject("report", report);
		mnv.setViewName(url);
		return mnv;
	}

}