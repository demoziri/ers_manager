package kr.ac.ers.controller.center;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterCenterVO;
import kr.ac.ers.dto.LocalVO;
import kr.ac.ers.service.CenterEquipmentService;

@Controller
@RequestMapping("/ers/center/equipment")
public class CenterEquipmentController {

	@Autowired
	private CenterEquipmentService centerEquipmentService;
	
	@GetMapping("/list")
	public void list(Model model) {
		List<LocalVO> localList = centerEquipmentService.getLocalListInEquipmentList();
		
		model.addAttribute("localList", localList);
	}
	
	@GetMapping("/localList")
	public void localList(Model model, String lname, String center_name) {
		List<CenterCenterVO> centerList = centerEquipmentService.getCenterListInByLname(lname, center_name);
		
		model.addAttribute("centerList", centerList);

		model.addAttribute("center_name", center_name);
	}
	
	@GetMapping("/userList")
	public void userList(Model model, String m_name, String mstatus, String lname, String center_name, String page) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("m_name", m_name);
		paramMap.put("mstatus", mstatus);
		paramMap.put("lname", lname);
		paramMap.put("center_name", center_name);
	
		SearchCriteria cri = new SearchCriteria();
		
		if(page == null || page.equals("")) cri.setPage(1);
		else cri.setPage(page);
		
		cri.setPerPageNum(10);
		Map<String, Object> dataMap = centerEquipmentService.getUserListByInfo(paramMap,cri);
		model.addAttribute("dataMap", dataMap);
	}
}
