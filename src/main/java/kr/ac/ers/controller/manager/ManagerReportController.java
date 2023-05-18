package kr.ac.ers.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ers/manager/report")
public class ManagerReportController {

	@GetMapping("/main")
	public String reportMain() {
		return "manager/report/main";
	}
	
	
	@GetMapping("/detail")
	public String reportDetail() {
		return "manager/report/detail";
	}
}
