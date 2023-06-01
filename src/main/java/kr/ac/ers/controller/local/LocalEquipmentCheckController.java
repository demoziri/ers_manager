package kr.ac.ers.controller.local;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterEquipmentReportVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.CenterEquipmentCheckService;

@Controller
@RequestMapping("/ers/local/equipmentCheck")
public class LocalEquipmentCheckController {

	@Autowired
	private CenterEquipmentCheckService centerEquipmentCheckService;
	
	@GetMapping("/list")
	public void list(Model model, HttpSession session, String startDate, String endDate, SearchCriteria cri) {
		if(cri.getPage()<1) cri.setPage(1);
		cri.setPerPageNum(8);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		if(startDate == null || startDate.equals("")) {
			startDate = simpleDate.format(date);
			endDate = simpleDate.format(date);
		}
		
		ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
		
		paramMap.put("depart", manager.getDepart());
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		
		Map<String, Object> dataMap = centerEquipmentCheckService.getEquipmentReportListByDepart(paramMap, cri);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
	}
	

	@GetMapping("/detail")
	@ResponseBody
	public CenterEquipmentReportVO detail(@RequestParam String rno) {
		
		CenterEquipmentReportVO report = centerEquipmentCheckService.getEquipmentReportByRno(rno.substring(7));
		
		return report;
	}
}
