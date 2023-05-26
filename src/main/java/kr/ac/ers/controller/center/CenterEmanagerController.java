package kr.ac.ers.controller.center;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.AddressVO;
import kr.ac.ers.dto.CenterEmanagerVO;
import kr.ac.ers.service.AddressService;
import kr.ac.ers.service.CenterEmanagerService;

@Controller
@RequestMapping("/ers/center/emanager")
public class CenterEmanagerController {

	@Autowired
	private CenterEmanagerService centerEmanagerService;
	@Autowired
	private AddressService addressService;
	
	@GetMapping("/list")
	public void list(Model model, SearchCriteria cri, String gu, String dong, String status) {
		if(cri.getPage()<1) cri.setPage(１);
		if(cri.getPerPageNum()<1) cri.setPerPageNum(10);
		Map<String, Object> returnMap = new HashMap<>();
		if(gu==null || gu.equals("")) {
			dong = "";
		}
		returnMap.put("gu", gu);
		returnMap.put("dong", dong);
		returnMap.put("status", status);
		returnMap.put("cri", cri);
		
		Map<String, Object> dataMap = centerEmanagerService.getEmanagerList(cri,returnMap);
		
		List<AddressVO> dongList = null;
		if(gu!=null && !gu.isEmpty()) {
			 dongList = addressService.getDongList(gu);
		}
		
		model.addAttribute("dongList",dongList);
		model.addAttribute("dataMap", dataMap);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public CenterEmanagerVO detail(@RequestParam int wcode) {
		CenterEmanagerVO emanager = centerEmanagerService.getEmanagerByWcode(wcode);
		
		return emanager;
	}
	
}
