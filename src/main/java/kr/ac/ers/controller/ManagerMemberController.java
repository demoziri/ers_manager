package kr.ac.ers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ers/manager/member")
public class ManagerMemberController {
	
	@GetMapping("ers/manager/main")
	public String main() {
		return "manager/main";
	}
	
	@GetMapping("/main")
	public String memberMain() {
		return "manager/member/main";
	}
	
	@GetMapping("/detail")
	public String memberDetail() {
		return "manager/member/detail2";
	}
	
	@GetMapping("/regist")
	public String memberRegist() {
		return "manager/member/regist2";
	}
	
	@GetMapping("/modify")
	public String modifyForm() {
		return "manager/member/modify";
	}
	
	@GetMapping("/reDetail")
	public String reportDetail() {
		return "manager/member/memReport";
	}
	
	
	
	
	
}
