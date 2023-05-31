package kr.ac.ers.controller.manager;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.dto.ReportVO;
import kr.ac.ers.service.ManagerReportSerivce;
import kr.ac.ers.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private ManagerReportSerivce managerReportService;

	
	@GetMapping("ers/manager/main")
	public ModelAndView root(ModelAndView mnv, MemberSearchCriteria cri) {
		String url = "manager/index";
		
		List<NoticeVO> noticeList = memberService.getNoticeListToMangerMain();
		List<MemberVO> memberList = memberService.getMemberListToMain();
		List<ReportVO> reportList = managerReportService.getReportListToManagerMain();
		
		mnv.addObject("reportList",reportList);
		mnv.addObject("memberList",memberList);
		mnv.addObject("noticeList",noticeList);
		
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
}
