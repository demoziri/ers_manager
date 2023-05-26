package kr.ac.ers.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ers/manager/staff")
public class ManagerStaffController {
	@RequestMapping("/main")
	public String staffMain() {
		return "/manager/staff/main";
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
