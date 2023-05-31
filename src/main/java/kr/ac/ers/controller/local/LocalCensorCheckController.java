package kr.ac.ers.controller.local;

import java.util.ArrayList;
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
import kr.ac.ers.dto.CenterPersonVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.CenterEmanagerService;
import kr.ac.ers.service.CenterEquipmentService;
import kr.ac.ers.service.CenterObjectPersonService;

@Controller
@RequestMapping("/ers/local/censorCheck")
public class LocalCensorCheckController {

	@Autowired
	private CenterObjectPersonService centerObjectPersonService;
	@Autowired
	private CenterEquipmentService centerEquipmentService;
	@Autowired
	private CenterEmanagerService centerEmanagerService;
	
	@GetMapping("/list")
	public void list(String gubunVal, HttpSession session, Model model) {
		ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
		if(gubunVal == null || gubunVal.equals("")) gubunVal = "active";
		List<CenterPersonVO> personList = new ArrayList<>();
		
		if(gubunVal.equals("active")) {
			personList = centerObjectPersonService.getPersonActiveList(manager.getDepart());
		}else {
			personList = centerObjectPersonService.getPersonGoOutList(manager.getDepart());
		}
		System.out.println(personList);
		model.addAttribute("personList", personList);
	}
	
	@GetMapping("/centerList")
	@ResponseBody
	public Map<String, Object> centerList(Model model, HttpServletRequest request, String address) {
		Map<String, Object> dataMap = new HashMap<>();
		
		HttpSession session = request.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginManager");
		
		String[] dongname = address.split(" ");
		
		List<CenterCenterVO> centerList =  centerEquipmentService.getCenterListInByLname(manager.getDepart(), null);
		if(centerList != null && centerList.size() > 0)
			for(CenterCenterVO center : centerList) {
				List<CenterEmanagerVO> emanagerList =  centerEmanagerService.getEmanagerListByCnum(center.getCnum());
				if(emanagerList != null && emanagerList.size() > 0) {
					center.setBg_color(true);
				}
				if(center.getC_name().contains(dongname[2])) {
					center.setChecked(true);
					dataMap.put("center_cnum", center.getCnum());
					dataMap.put("center_cname", center.getC_name());
				}
			}
		dataMap.put("centerList", centerList);
		return dataMap;
	}
	
	@GetMapping("/emanagerList")
	@ResponseBody
	public List<CenterEmanagerVO> emanagerList(Model model, int cnum) {
		
		List<CenterEmanagerVO> emanagerList =  centerEmanagerService.getEmanagerListByCnum(cnum);
		
		return emanagerList;
	}
	
	@GetMapping("/commandEmanager")
	@ResponseBody
	public void commandEmanager (Model model, String wcode, String personGubun, String mid) {
		centerObjectPersonService.modifyCommandEmanager(wcode, personGubun, mid);
	}
}
