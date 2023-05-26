package kr.ac.ers.controller.local;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterCenterVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.CenterEquipmentService;

@Controller
@RequestMapping("/ers/local/equipment")
public class LocalEquipmentController {

	@Autowired
	private CenterEquipmentService centerEquipmentService;
	
	@GetMapping("/localList")
	public void localList(Model model, HttpSession session, String center_name) {
		ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
		
		List<CenterCenterVO> centerList = centerEquipmentService.getCenterListInByLname(manager.getDepart(), center_name);
		
		model.addAttribute("centerList", centerList);

		model.addAttribute("center_name", center_name);
	}
	
	@GetMapping("/userList")
	public void userList(Model model, HttpSession session, String m_name, String mstatus, String lname, String center_name, String page) {
		ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
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
