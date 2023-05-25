package kr.ac.ers.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ers/manager/machine")
public class ManagerMachineController {

	@GetMapping("/main")
	public String memberMain() {
		String url = "manager/machine/main";
		
		
		
		return url;
	}
	
	
}
