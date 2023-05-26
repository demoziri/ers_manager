package kr.ac.ers.controller.local;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.dto.CenterEmanagerVO;
import kr.ac.ers.dto.CenterEquipmentCheckVO;
import kr.ac.ers.dto.CenterEquipmentVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.service.CenterEmanagerService;
import kr.ac.ers.service.CenterEmergencyService;
import kr.ac.ers.service.CenterEquipmentCheckService;
import kr.ac.ers.service.CenterEquipmentService;
import kr.ac.ers.service.CenterNoticeService;

@Controller
@RequestMapping("/ers/local")
public class LocalMainController {

	@Autowired
	private CenterEquipmentService centerEquipmentService;
	@Autowired
	private CenterEmanagerService centerEmanagerService;
	@Autowired
	private CenterNoticeService centerNoticeService;
	@Autowired
	private CenterEquipmentCheckService centerEquipmentCheckService;
	@Autowired
	private CenterEmergencyService centerEmergencyService;
	
	@GetMapping("/main")
	public void main(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginManager");
		
		
		List<CenterEquipmentVO> equipmentList = centerEquipmentService.getEquipmentListWithCount(manager.getDepart());
		List<CenterEmanagerVO> emanagerList = centerEmanagerService.getEmanagerListToLocalMain(manager.getDepart());
		List<NoticeVO> noticeList = centerNoticeService.getNoticeListToMain();
		List<CenterEquipmentCheckVO> householdList = centerEquipmentCheckService.getHouseholdListToMain(manager.getDepart());
		
		int totalCount = 0;
		if(emanagerList!= null && emanagerList.size()>0)
			for(CenterEmanagerVO emanagerVO : emanagerList) {
				totalCount+=emanagerVO.getTotalCount();
			}
		
		
		model.addAttribute("householdList", householdList);
		model.addAttribute("emanager_totalCount",totalCount);
		model.addAttribute("equipmentList", equipmentList);
		model.addAttribute("emanagerList", emanagerList);
		model.addAttribute("noticeList", noticeList);
	}
	
	@GetMapping("/checkEmergency")
	@ResponseBody
	public int checkEmergenct(String depart) {
		int count = centerEmergencyService.getEmergencyCountByDepart(depart);
		return count;
	}
	
	@GetMapping("/emergencyUpdate")
	@ResponseBody
	public void emergencyUpdate(String depart) {
		centerEmergencyService.modifyEmergency(depart);
	}
}
