package kr.ac.ers.controller.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.MachineSearchCriteria;
import kr.ac.ers.dto.ManagerMachineVO;
import kr.ac.ers.service.ManagerMachineService;

@Controller
@RequestMapping("ers/manager/machine")
public class ManagerMachineController {
	
	@Autowired
	private ManagerMachineService managerMachineService;
	
	
	@GetMapping("/main")
	public ModelAndView machineMain(ModelAndView mnv, MachineSearchCriteria cri) {
		String url = "manager/machine/main";
		
		if (cri.getPage() < 1) cri.setPage(1);
		if (cri.getPerPageNum() < 1) cri.setPerPageNum(3);
		
		Map<String,Object> dataMap = managerMachineService.getEquipmentList(cri);
		
		mnv.addObject("dataMap",dataMap);
		
		List<ManagerMachineVO> asList = managerMachineService.getASListPerWeek();
		
		mnv.addObject("asList",asList);
		
		mnv.setViewName(url);
		
		return mnv;
		
		
	}
	
	
}
