package kr.ac.ers.controller.center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ers.dto.CenterEmanagerVO;
import kr.ac.ers.dto.CenterEquipmentVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.service.CenterEmanagerService;
import kr.ac.ers.service.CenterEquipmentService;
import kr.ac.ers.service.CenterNoticeService;

@Controller
@RequestMapping("/ers/center")
public class CenterMainController {
	
	@Autowired
	private CenterEquipmentService centerEquipmentService;
	@Autowired
	private CenterNoticeService centerNoticeService;
	@Autowired
	private CenterEmanagerService centerEmanagerService;
	
	@GetMapping("/main")
	public void main(Model model) {
		List<CenterEquipmentVO> equipmentList = centerEquipmentService.getEquipmentListWithCount(null);
		List<NoticeVO> noticeList = centerNoticeService.getNoticeListToMain();
		List<CenterEmanagerVO> emanagerList = centerEmanagerService.getEmanagerListToMain();
		
		int totalCount = 0;
		if(emanagerList!= null && emanagerList.size()>0)
			for(CenterEmanagerVO emanagerVO : emanagerList) {
				totalCount+=emanagerVO.getTotalCount();
			}
		model.addAttribute("emanager_totalCount",totalCount);
		model.addAttribute("equipmentList", equipmentList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("emanagerList", emanagerList);
	}
	
	
}
