package kr.ac.ers.controller.local;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.dto.CenterCenterVO;
import kr.ac.ers.dto.CenterEmanagerVO;
import kr.ac.ers.dto.CenterEquipmentCheckVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.CenterEmanagerService;
import kr.ac.ers.service.CenterEquipmentCheckService;
import kr.ac.ers.service.CenterEquipmentService;

@Controller
@RequestMapping("/ers/local/householdCheck")
public class LocalHouseholdController {

	@Autowired
	private CenterEquipmentCheckService centerEquipmentCheckService;
	@Autowired
	private CenterEmanagerService centerEmanagerService;
	@Autowired
	private CenterEquipmentService centerEquipmentService;
	
	@GetMapping("/list")
	public void list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginManager");
		
		List<CenterEquipmentCheckVO> householdList = centerEquipmentCheckService.getHouseholdList(manager.getDepart());
		
		model.addAttribute("householdList", householdList);
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public Map<String, Object> detail(Model model, HttpServletRequest request, int indexNum) {
		Map<String, Object> dataMap = new HashMap<>();
		
		HttpSession session = request.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginManager");
		
		List<CenterEquipmentCheckVO> householdList = centerEquipmentCheckService.getHouseholdList(manager.getDepart());
		
		List<CenterCenterVO> centerList =  centerEquipmentService.getCenterListInByLname(manager.getDepart(), null);
		
		CenterEquipmentCheckVO household = householdList.get(indexNum);
		String[] dongname = household.getAddress().split(" ");

		if(centerList != null && centerList.size()>0)
			for(CenterCenterVO center : centerList) {
				List<CenterEmanagerVO> emanagerList =  centerEmanagerService.getEmanagerListByCnum(center.getCnum());
				if(emanagerList != null && emanagerList.size() > 0) {
					center.setBg_color(true);
				}
				if(center.getC_name().contains(dongname[2])) {
					dataMap.put("center_value", center.getC_name());
					dataMap.put("center_cnum", center.getCnum());
				}
			}
		dataMap.put("household", household);
		dataMap.put("centerList", centerList);
		return dataMap;
	}
	
	@GetMapping("/emanagerList")
	@ResponseBody
	public List<CenterEmanagerVO> emanagerList(Model model, int cnum) {
		
		List<CenterEmanagerVO> emanagerList =  centerEmanagerService.getEmanagerListByCnum(cnum);
		
		return emanagerList;
	}
}
