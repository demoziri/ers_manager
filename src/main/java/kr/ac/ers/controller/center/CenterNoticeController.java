package kr.ac.ers.controller.center;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.service.CenterNoticeService;

@Controller
@RequestMapping("/ers/center/notice")
public class CenterNoticeController {
	
	@Autowired 
	private CenterNoticeService centerNoticeService;
	
	@GetMapping("/list")
	public void list(Model model, SearchCriteria cri) {
		
		
		if(cri.getPage()<1) cri.setPage(1);
		if(cri.getPerPageNum()<1)cri.setPerPageNum(10);
		
		Map<String, Object> dataMap = centerNoticeService.getNoticeList(cri);
		
		model.addAttribute("dataMap", dataMap);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public NoticeVO detail(@RequestParam String nno) {
		System.out.println("nno" + nno);
		NoticeVO notice = centerNoticeService.getNoticeByNno(nno);
		
		return notice;
	}
}
