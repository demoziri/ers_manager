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
import kr.ac.ers.command.MemberModifyCommand;
import kr.ac.ers.command.MemberRegistCommand;
import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.AddressVO;
import kr.ac.ers.dto.EcallVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.service.AddressService;
import kr.ac.ers.service.EcallService;
import kr.ac.ers.service.MemberService;
import kr.ac.ers.utils.MakeFileName;


@Controller
@RequestMapping("ers/manager/member")
public class ManagerMemberController {
	
	@Autowired private MemberService memberService;
	
	@Autowired private EcallService ecallService;
	 
	@Autowired private AddressService addressService;
	 
	
	@GetMapping("/main")
	public ModelAndView memberMain(MemberSearchCriteria cri, ModelAndView mnv) {
		String url = "manager/member/main";
		
		if (cri.getPage() < 1) cri.setPage(1);
		if (cri.getPerPageNum() < 1) cri.setPerPageNum(5);
		
		Map<String,Object> dataMap = memberService.getMemberList(cri);
		
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	
	@GetMapping("/detail")
	public ModelAndView memberDetail(String id, ModelAndView mnv) {
		
		String url = "manager/member/detail2";
		
		MemberVO member = memberService.getMemberById(id);
		
		int machineCount = memberService.countMachineCheck(id);
		member.setMachineCk(machineCount);
		
		String wName = memberService.selectLsupporterName(id);
		member.setW_Name(wName);
		
		int ecallCount = ecallService.getEcallCount(id);
		member.setE_count(ecallCount);
		
		mnv.addObject("member", member);
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
	public List<LsupporterStatusVO> lsuppList(String id){
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
		String url = "manager/member/regist2";
		mnv.addObject("id",id);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@ResponseBody
	@PostMapping("/doRegist")
	public String memberRegist(MemberRegistCommand registReq, EcallRegistCommand eRegistReq) {
		
		MemberVO member = registReq.toMemberVO();
		
		
		MemberVO checkMember = memberService.getMemberById(eRegistReq.getId());
		if(checkMember == null ) {
			memberService.regist(member);
			EcallVO ecall = eRegistReq.toEcallVO();
			ecallService.registEcall(ecall);
			
		}else {
			EcallVO ecall = eRegistReq.toEcallVO();
			ecallService.registEcall(ecall);
		}
		
		return member.getId();
	}
	
	@Value("${picturePath}")
	private String picturePath;
	
	@PostMapping(value = "/picture", produces = "text/plain;charset=utf-8")
	@ResponseBody //String을 직접 내보내고자 할 때
	public String pictureUpload(@RequestParam("pictureFile") MultipartFile multi,
								String oldPicture)throws Exception{
		
		//file명
		String result = "";
		
		/* 파일 저장 확인 */
		result = savePicture(oldPicture, multi);
		
		
		return result;
	}
	
	
	public String savePicture(String oldPicture, MultipartFile multi) throws Exception{
		String fileName = "";
		
		/* 파일저장폴더설정 */
		String uploadPath = this.picturePath;
		
		/* 파일유무확인 */
		if(!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)) {
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(),"$$");
			File storeFile = new File(uploadPath, fileName);
			
			/*
			 * // 파일 경로 생성 storeFile.mkdirs();
			 */
			
			// local HDD 에 저장
			multi.transferTo(storeFile);
		}
		
		//기존파일 삭제
		if(oldPicture != null && !oldPicture.isEmpty()) {
			File oldFile = new File(uploadPath, oldPicture);
			if(oldFile.exists()) {
				oldFile.delete();
			}
		}
		return fileName;
	}
	
	
	@GetMapping("/getPicture")
	@ResponseBody
	public byte[] getPicture(String id) throws Exception {
		MemberVO member = memberService.getMemberById(id);
		if(member == null) return null;
		
		String picture = member.getPicture();
		String imgPath = this.picturePath;
		
		InputStream in = new FileInputStream(new File(imgPath, picture));
		
		return IOUtils.toByteArray(in);
	}
	

	
	
	@GetMapping("/modify")
	public String modifyForm(String id, Model model) {
		MemberVO member = memberService.getMemberById(id);
		int ecallCount = ecallService.getEcallCount(id);
		member.setE_count(ecallCount);
		
		
		 
		 
		model.addAttribute("member",member);
		
		return "manager/member/modify";
	}
	
	
	 @ResponseBody
	 @PostMapping("/doModify") 
	 public MemberVO memberModify(MemberModifyCommand modifyReq) throws Exception {

		 MemberVO member = modifyReq.toMemberVO();
		 //기존 사진
		 String oldPicture = memberService.getMemberById(modifyReq.getId()).getPicture();
		
			if(modifyReq.getPicture()!=null && modifyReq.getPicture().getSize() > 0) {
				String fileName = savePicture(oldPicture, modifyReq.getPicture());
				member.setPicture(fileName);
			}else {
				member.setPicture(oldPicture);
			}
		
		 memberService.modifyMember(member);
		 
		 //System.out.println(member.getName());
		 MemberVO modifiedMember = memberService.getMemberById(modifyReq.getId());
		 return modifiedMember;
	 }
	 
	
	@GetMapping("/reDetail")
	public String reportDetail() {
		return "manager/member/memReport";
	}
	
	
	
	
	
}