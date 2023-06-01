package kr.ac.ers.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.ManagerReportSearchCriteria;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.dto.ReportVO;
import kr.ac.ers.service.ManagerReportSerivce;

@Controller
@RequestMapping("/ers/manager/report")
public class ManagerReportController {

	@Autowired
	private ManagerReportSerivce managerReportService;
	
	@GetMapping("/main")
	public ModelAndView reportMain(ManagerReportSearchCriteria cri, ModelAndView mnv, String viewcheck) {
		
		String url =  "manager/report/main";
		int memberReportCount =  managerReportService.getMemberReportCount();
		int machineReportCount =  managerReportService.getMachineReportCount();
		
		List<ReportVO> reportList = managerReportService.getReportListToReportMain(cri,viewcheck);
		
		mnv.addObject("reportList",reportList);
		mnv.addObject("memberReportCount",memberReportCount);
		mnv.addObject("machineReportCount",machineReportCount);
		mnv.setViewName(url);
		
		
		return mnv;
	}
	
	@GetMapping("/searchReport")
	public ModelAndView searchReport(ManagerReportSearchCriteria cri, ModelAndView mnv, String viewcheck) {
		
		String url = "manager/report/searchReport";
		List<ReportVO> reportList = managerReportService.getReportListToReportMain(cri,viewcheck);
		mnv.addObject("reportList",reportList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/detail")
	public ModelAndView reportDetail(int rno, ModelAndView mnv) {
		
		ReportVO report = managerReportService.getReportByRno(Integer.toString(rno));
		report.setReportfile(managerReportService.getReportFileByRno(rno));
		
		
		String url = "manager/report/detail";
		mnv.addObject("report",report);
	
		mnv.setViewName(url);
		return mnv;
	}
}
