package kr.ac.ers.controller.center;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterEmergencyReportVO;
import kr.ac.ers.service.CenterEmergencyReportService;

@Controller
@RequestMapping("/ers/center/emergencyReport")
public class CenterEmergencyReportController {

	@Autowired
	private CenterEmergencyReportService centerEmergencyReportService;
	
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
		
		paramMap.put("depart", "");
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		
		Map<String, Object> dataMap = centerEmergencyReportService.getEmergencyReportListByDepart(paramMap, cri);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public CenterEmergencyReportVO detail(String rno) {
		return centerEmergencyReportService.getEmergencyReportByRno(rno);
	}
	
	@Value("${picturePath}")
	private String picturePath;
	
	@GetMapping("/getPicture")
	   @ResponseBody
	   public byte[] getPicture(String rno) throws Exception {
		CenterEmergencyReportVO member = centerEmergencyReportService.getEmergencyReportByRno(rno);
	      if(member == null) return null;
	      
	      String picture = member.getPicture();
	      String imgPath = this.picturePath;
	      
	      InputStream in = new FileInputStream(new File(imgPath, picture));
	      
	      return IOUtils.toByteArray(in);
	   }
}
