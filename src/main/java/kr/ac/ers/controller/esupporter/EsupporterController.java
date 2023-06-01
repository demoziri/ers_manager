package kr.ac.ers.controller.esupporter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchVO;
import kr.ac.ers.dto.EmergencyReportVO;
import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.dto.EquipmentReportVO;
import kr.ac.ers.dto.EsupporterVO;
import kr.ac.ers.service.EsupporterService;

@Controller
public class EsupporterController {
	
	@Autowired
	EsupporterService esupporterService;
	
	public EsupporterController(EsupporterService esupporterService) {
		this.esupporterService = esupporterService;
	}
	@RequestMapping("/ers/esupporter/checkEmergency")
	@ResponseBody
	public Map<String, Object> checkEmergency(String depart) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int esupporterState = esupporterService.getEsupporterStateChange(depart);
		
		String title = "";
		String message = "";
		String notice = "";
		int sCode = 0;
		String sType ="";
		
		if(esupporterState != 0) {
			EmergencyVO emergency = esupporterService.getEmergencyDispatchNotification(depart);
			String pacemaker = emergency.getPacemaker();
			
			sType = emergency.getSType();
			if(sType.equals("2")) {
				title = "119 응급상황 발생!";
				message = "119 응급상황입니다. 출동바랍니다.";
				if(pacemaker.equals("N")) {
					notice = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
				}
			}else if(sType.equals("3")) {
				title = "화재 상황 발생!";
				message = "연락후 대상자 상태를 확인 바랍니다.";
				if(pacemaker.equals("N")) {
					notice = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
				}
			}else if(sType.equals("4")) {
				title = "활동미감지 발생!";
				message = "활동이 미감지 되었습니다. 연락후 방문바랍니다.";
				if(pacemaker.equals("N")) {
					notice = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
				}
			}else if(sType.equals("5")) {
				title = "장기외출";
				message = "외출시간이 초과되었습니다. 연락후 방문바랍니다.";
				if(pacemaker.equals("N")) {
					notice = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
				}
			}else if(sType.equals("6")) {
				title = "장비 게이트웨이";
				message = "장비가 미수신이 되었습니다. 연락후 방문바랍니다.";
			}else if(sType.equals("7")) {
				title = "장비 활동감지기";
				message = "장비가 미수신이 되었습니다. 연락후 방문바랍니다.";
			}else if(sType.equals("8")) {
				title = "장비 출입문감지기";
				message = "장비가 미수신이 되었습니다. 연락후 방문바랍니다.";
			}else if(sType.equals("9")) {
				title = "장비 화재감지기";
				message = "장비가 미수신이 되었습니다. 연락후 방문바랍니다.";
			}else if(sType.equals("10")) {
				title = "장비 연결차단 해제";
				message = "연결차단이 해제 되었습니다. 연락후 방문바랍니다.";
			}else if(sType.equals("11")) {
				title = "장비 회수";
				message = "연락후 장비 회수를 하시기 바랍니다.";
			}else if(sType.equals("12")) {
				title = "신규가입 ";
				message = "신규가입이 되었습니다. 연락후 방문바랍니다.";
			}else {
				title = "응급상황 발생!";
				message = "응급상황입니다. 출동바랍니다.";
				if(pacemaker.equals("N")) {
					notice = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
				}
			}
			
			sCode = emergency.getSCode();
		}
		
		dataMap.put(title, title);
	    dataMap.put("message", message);
	    dataMap.put("sCode", sCode);
	    dataMap.put("sType", sType);
		
		return dataMap;
		
	}
	
	@RequestMapping("/ers/esupporter/statusChange")
	@ResponseBody
	public Map<String, Object> statusChange(String depart){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		EsupporterVO esupporter = esupporterService.getEsupporter(depart);
		
		dataMap.put("eStatus", esupporter.getStatus());
		
		return dataMap;
		
	}
	
	@GetMapping("ers/esupporter/emergencyUpdate")
	@ResponseBody
	public void emergencyUpdate(int sCode, String reportCheck) {
		esupporterService.getCheckEmergency(sCode, reportCheck);
	}
	
	@GetMapping("/ers/esupporter/dispatchList")
	public String dispatchList(String searchType,String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
		
		String url = "esupporter/dispatchList";
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		List<DispatchVO> dispatchList = esupporterService.getDispatchList(cri, loginUser.getWid());
		
		model.addAttribute("dispatchList", dispatchList);
		model.addAttribute("eStatus", loginUser.getStatus());
		
		return url;
		
	}
	
	@GetMapping("/ers/esupporter/dispatchDetail")
	public String dispatchDetail(int sCode, Model model, HttpSession session, HttpServletRequest request) {
		
		String url = "esupporter/dispatchDetail";
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		DispatchVO dispatch = esupporterService.getDispatchDetail(sCode);
		
		model.addAttribute("dispatch", dispatch);
		model.addAttribute("eStatus", loginUser.getStatus());
		
		return url;
		
	}
	
	@GetMapping("/ers/esupporter/emergencyList")
	public String emergencyList(String searchType,String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		Map<String, Object> dataMap = esupporterService.getEmergencyReportList(cri, wCode);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("eStatus", loginUser.getStatus());
		
		return "esupporter/emergencyList";
		
	}
	
	@GetMapping("/ers/esupporter/emergencyDetail")
	public String emergencyDetail(Model model, int rNo, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		EmergencyReportVO emergencyReport = esupporterService.getEmergencyReportDetail(rNo);
		
		model.addAttribute("emergencyReport", emergencyReport);
		model.addAttribute("eStatus", loginUser.getStatus());
		
		return "esupporter/emergencyDetail";
		
	}
	
	@GetMapping("/ers/esupporter/equipmentList")
	public String equipmentList(String searchType,String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		Map<String, Object> dataMap = esupporterService.getEquipmentReportList(cri, wCode);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("eStatus", loginUser.getStatus());
		
		return "esupporter/equipmentList";
		
	}
	
	@GetMapping("/ers/esupporter/equipmentDetail")
	public String equipmentDetail() {
		return "esupporter/equipmentDetail";
	}
	
	@GetMapping("/ers/esupporter/reportForm")
	public String reportForm(String searchType, String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request, /* int rNo, */ String id, String name, String sType) {
		
		String url = "esupporter/reportForm";
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		int wCode = loginUser.getWCode();
		String wId = loginUser.getWid();
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		Map<String, Object> dataMap = esupporterService.getMemberNameSearch(cri, wId);
		dataMap.put("wCode", wCode);
		
		model.addAttribute("id",id);
		model.addAttribute("name", name);
		model.addAttribute("eStatus", loginUser.getStatus());
		model.addAttribute("sType",sType);
		model.addAttribute("dataMap", dataMap);
		
		return url;
		
	}
	
	@GetMapping("/ers/esupporter/memberSearch")
	@ResponseBody
	public Map<String, Object> memberSearch(String searchType,String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		String wId = loginUser.getWid();
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		Map<String, Object> dataMap = esupporterService.getMemberNameSearch(cri, wId);
		
		return dataMap;
		
	}
	
	@PostMapping("/ers/esupporter/report")
	public String report(EquipmentReportVO equipmentReport, EmergencyReportVO emergencyReport) {
		
		String url = "";
		
		String retype = emergencyReport.getReType();
		
		if(retype.equals("1")) {
			esupporterService.insertEmergencyReport(emergencyReport);
			return url = "redirect:/ers/esupporter/emergencyList";
		}else {
			esupporterService.insertEquipmentReport(equipmentReport);
				return url = "redirect:/ers/esupporter/equipmentList";
		}
		
	}
	
	@GetMapping("/ers/esupporter/myPageMain")
	public String myPageMain() {
		return "esupporter/myPageMain";
	}
	
	@GetMapping("/ers/esupporter/myPage")
	public String myPage() {
		return "esupporter/myPage";
	}
	
	@GetMapping("/ers/esupporter/dayReportHistory")
	public String dayReportHistory() {
		
		
		
		return "esupporter/dayReportHistory";
		
	}
	
	@GetMapping("/ers/esupporter/noticeList")
	public String noticeList() {
		return "esupporter/noticeList";
	}
	
	@GetMapping("/ers/esupporter/noticeDetail")
	public String noticeDetail() {
		return "esupporter/noticeDetail";
	}
	
	@GetMapping("/ers/esupporter/memberInformation")
	public String memberInformation(String id) {
		
		
		
		return "/esupporter/memberInformation";
		
	}
	
	@GetMapping("/ers/esupporter/main")
	public String main(Model model, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		int fireCount = esupporterService.getFireCount(loginUser.getWid());
		int emergencyCount = esupporterService.getEmergencyCount(loginUser.getWid());
		int dispatchCount = esupporterService.getDispatchCount(loginUser.getWid());
		int gatewayStockCount = esupporterService.getGatewayStockCount(loginUser.getCNum());
		int activityDetectorStockCount = esupporterService.getActivityDetectorStockCount(loginUser.getCNum());
		int doorDetectorsStockCount = esupporterService.getDoorDetectorsStockCount(loginUser.getCNum());
		int fireDetectorStockCount = esupporterService.getFireDetectorStockCount(loginUser.getCNum());
		
		model.addAttribute("fireCount", fireCount);
		model.addAttribute("emergencyCount", emergencyCount);
		model.addAttribute("dispatchCount", dispatchCount);
		model.addAttribute("gatewayStockCount", gatewayStockCount);
		model.addAttribute("activityDetectorStockCount", activityDetectorStockCount);
		model.addAttribute("doorDetectorsStockCount", doorDetectorsStockCount);
		model.addAttribute("fireDetectorStockCount", fireDetectorStockCount);
		
		return "esupporter/main";
		
	}
	
	@GetMapping("/ers/esupporter/loginForm")
	public String loginForm(@RequestParam(value = "error", required = false) String error, Model model) {
	    if (error != null) {
	        // 에러 메세지에 따른 처리 로직
	        if (error.equals("1")) {
	            model.addAttribute("message", "아이디를 잘못 입력하셨습니다.");
	        } else if (error.equals("2")) {
	            model.addAttribute("message", "패스워드를 잘못 입력하셨습니다.");
	        }
	    }

	    return "esupporter/loginForm";
	}
	
	@PostMapping("/ers/esupporter/login")
	public String login(String wid, String pwd, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		
		String url = "redirect:/ers/esupporter/main";

		int result = esupporterService.login(wid, pwd);
		switch(result) {
		    case 0: // 로그인 성공
		        EsupporterVO loginUser = esupporterService.getEsupporter(wid);
		        session.setAttribute("loginUser", loginUser);
		        // session.setMaxInactiveInterval(600 * 30);
		        return url;
		    case 1: // 아이디 불일치
		        redirectAttributes.addFlashAttribute("error", "1");
		        return "redirect:/ers/esupporter/loginForm";
		    case 2: // 비밀번호 불일치
		        redirectAttributes.addFlashAttribute("error", "2");
		        return "redirect:/ers/esupporter/loginForm";
		}
		
		return url;
		
	}
	
   @GetMapping("/ers/esupporter/logout")
   public String logout(HttpSession session) throws Exception {
      String url = "redirect:/ers/esupporter/loginForm";

      session.invalidate();

      return url;
   }

}
