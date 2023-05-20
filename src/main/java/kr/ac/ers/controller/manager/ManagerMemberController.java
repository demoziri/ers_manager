package kr.ac.ers.controller.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.AddressVO;
import kr.ac.ers.dto.EcallVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.service.AddressService;
import kr.ac.ers.service.EcallService;
import kr.ac.ers.service.MemberService;


@Controller
@RequestMapping("ers/manager/member")
public class ManagerMemberController {
	
	@Autowired
	private MemberService memberService;
	
	
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
	public String memberRegist() {
		return "manager/member/regist2";
	}
	
	
	@GetMapping("/modify")
	public String modifyForm(String id, Model model) {
		MemberVO member = memberService.getMemberById(id);
		
		model.addAttribute("member",member);
		
		return "manager/member/modify";
	}
	
	@GetMapping("/reDetail")
	public String reportDetail() {
		return "manager/member/memReport";
	}
	
	
	
	
	
}
