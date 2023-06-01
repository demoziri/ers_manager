package kr.ac.ers.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.ManagerStaffService;

@Controller
@RequestMapping("/ers/manager/staff")
public class ManagerStaffController {
	
	@Autowired
	private ManagerStaffService managerStaffService;
	
	
	@RequestMapping("/main")
	public ModelAndView staffMain(ModelAndView mnv, String depart) {
		
		String url = "/manager/staff/main";
		
		List<ManagerVO> managerList = managerStaffService.getManagerNeedApproval(depart);
		
		mnv.addObject("managerList",managerList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/detail")
	public String staffDetail() {
		return "manager/staff/detail2";
	}
	
	@GetMapping("/regist")
	public String staffRegist() {
		return "manager/staff/regist2";
	}
}
