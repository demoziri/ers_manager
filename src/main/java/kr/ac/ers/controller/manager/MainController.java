package kr.ac.ers.controller.manager;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("ers/manager/main")
	public ModelAndView root(ModelAndView mnv, MemberSearchCriteria cri) {
		String url = "manager/index";
		
		if (cri.getPage() < 1) cri.setPage(1);
		if (cri.getPerPageNum() < 1) cri.setPerPageNum(5);
		
		Map<String,Object> dataMap = memberService.getMemberList(cri);
		
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
}
