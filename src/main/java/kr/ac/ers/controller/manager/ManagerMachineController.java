package kr.ac.ers.controller.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		List<ManagerMachineVO> asList = managerMachineService.getASPerWeek();
		
		mnv.addObject("asList",asList);
		
		ManagerMachineVO totalCount = managerMachineService.getTotalCount();
		
		mnv.addObject("totalCount",totalCount);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@GetMapping("/asDetail")
	@ResponseBody
	public List<ManagerMachineVO> asDetail(String week_start, String week_end, String cnum) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date startDate = null;
	    Date endDate = null;
	    
		startDate = sdf.parse(week_start);
		endDate = sdf.parse(week_end);
	   
	    
	    List<ManagerMachineVO> asDetailList = managerMachineService.getASListPerWeek(startDate, endDate, cnum);
	    
	    return asDetailList;
	}
	
	
	@GetMapping("/machineList")
	@ResponseBody
	public List<ManagerMachineVO> machineList(String mcode){
		 List<ManagerMachineVO>  machineList = managerMachineService.getMachineListByMcode(mcode);
		 return machineList;
	}
	
	
}
