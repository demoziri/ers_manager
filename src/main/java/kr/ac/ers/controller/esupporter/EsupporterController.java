package kr.ac.ers.controller.esupporter;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchReportVO;
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
	@RequestMapping("/ers/esupporter/emergency")
	public String emergency(Model model, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		String wId = loginUser.getWid();
		
		int esupporterState = esupporterService.getEsupporterStateChange(wId);
		
		String message = "";
		
		if(esupporterState != 0) {
			EmergencyVO emergency = esupporterService.getEmergencyDispatchNotification(wId);
			String pacemaker = emergency.getPacemaker();
			if(pacemaker.equals("Y")) {
				message = "심장질환과 기계부착여부로 인해 CPR기기 사용시 주의바랍니다.";
			}
			String outConfirm = emergency.getOutConfirm();
			if(outConfirm.equals("Y")) {
				message = "외출시간 넘김 대상자를 찾아주시기 바랍니다.";
			}
			
		}
		
		 // 데이터를 준비
	    String ajaxContent = "<script>"
	    		+"function showNotification(message) {\r\n"
	    		+ "		var notification = document.getElementById('notification');\r\n"
	    		+ "		notification.innerText = message;\r\n"
	    		+ "		notification.style.display = 'block';\r\n"
	    		+ "	}\r\n"
	    		+ "\r\n"
	    		+ "	// 알림 숨기는 함수\r\n"
	    		+ "	function hideNotification() {\r\n"
	    		+ "		var notification = document.getElementById('notification');\r\n"
	    		+ "		notification.innerText = '';\r\n"
	    		+ "		notification.style.display = 'none';\r\n"
	    		+ "	}\r\n"
	    		+ "\r\n"
	    		+ "	// 알림을 주는 엔티티에서 호출\r\n"
	    		+ "	showNotification('알림 메시지');\r\n"
	    		+ "\r\n"
	    		+ "	// 일정 시간이 지나면 알림 숨김\r\n"
	    		+ "	setTimeout(hideNotification, 5000); // 5초 후에 숨김\r\n"
	    		+ "	\r\n"
	    		+ "	function executeQuery() {\r\n"
	    		+ "		// AJAX 요청 생성\r\n"
	    		+ "		var xhr = new XMLHttpRequest();\r\n"
	    		+ "		\r\n"
	    		+ "		xhr.onreadystatechange = function() {\r\n"
	    		+ "			if (xhr.readyState === 4 && xhr.status === 200) {\r\n"
	    		+ "		    	// AJAX 요청이 완료되고 응답이 성공인 경우 처리할 작업\r\n"
	    		+ "		    	var response = xhr.responseText;\r\n"
	    		+ "		    	\r\n"
	    		+ "		    	// 결과값 확인 후 알림 표시\r\n"
	    		+ "		    	if (response === '1') {\r\n"
	    		+ "					showNotification('알림 메시지');\r\n"
	    		+ "				} else {\r\n"
	    		+ "			    	hideNotification();\r\n"
	    		+ "				}\r\n"
	    		+ "			}\r\n"
	    		+ "		};\r\n"
	    		+ "\r\n"
	    		+ "		// AJAX 요청 설정\r\n"
	    		+ "		xhr.open('GET', 'emergency', true);\r\n"
	    		+ "		xhr.send();\r\n"
	    		+ "	}\r\n"
	    		+ "	\r\n"
	    		+ "	// 페이지 로드 시 쿼리문 실행\r\n"
	    		+ "	window.onload = function() {\r\n"
	    		+ "		executeQuery();\r\n"
	    		+ "	};"
	    		+ "</script>";

	    // 모델에 데이터를 추가
	    model.addAttribute("ajaxContent", ajaxContent);
	    model.addAttribute("message", message);
		
		return "common/esupporter/head";
		
	}
	
	@GetMapping("/ers/esupporter/dispatchList")
	public String dispatchList(String searchType,String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
		
		String url = "esupporter/dispatchList";
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		String wid = loginUser.getWid();
		
		SearchCriteria cri = new SearchCriteria();
		if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
		if(page == null || page.isEmpty())page="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		List<DispatchReportVO> dispatchReortList = esupporterService.getEmergencyReportYNList(cri, wid);
		
		List<DispatchVO> dispatchList = esupporterService.getEmergencyList(cri, wid);
		
		DispatchReportVO dispatchReport = esupporterService.getEmergencyReportYNDetail();
		int rNo = dispatchReport.getRNo();
		
		model.addAttribute("dispatchReortList", dispatchReortList);
		model.addAttribute("dispatchList", dispatchList);
		model.addAttribute("rNo", rNo);
		
		return url;
		
	}
	
	@GetMapping("/ers/esupporter/dispatchDetail")
	public String dispatchDetail(Model model) {
		
		String url = "esupporter/dispatchDetail";
		
		DispatchVO dispatch = esupporterService.getEmergencyDetail();
		
		DispatchReportVO dispatchReport = esupporterService.getEmergencyReportYNDetail();
		
		model.addAttribute("dispatchReport", dispatchReport);
		model.addAttribute("dispatch", dispatch);
		
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
		
		return "esupporter/emergencyList";
		
	}
	
	@GetMapping("/ers/esupporter/emergencyDetail")
	public String emergencyDetail(Model model, int rNo) {
		
		EmergencyReportVO emergencyReport = esupporterService.getEmergencyReportDetail(rNo);
		
		model.addAttribute("emergencyReport", emergencyReport);
		
		return "esupporter/emergencyDetail";
		
	}
	
	@GetMapping("/ers/esupporter/equipmentList")
	public String equipmentList() {
		return "esupporter/equipmentList";
	}
	
	@GetMapping("/ers/esupporter/equipmentDetail")
	public String equipmentDetail() {
		return "esupporter/equipmentDetail";
	}
	
	@GetMapping("/ers/esupporter/reportForm")
	public String reportForm(Model model, HttpSession session, HttpServletRequest request /*int afterUrl, int sCode*/) {
		
		String url = "esupporter/reportForm";
		
		session = request.getSession();			
		EsupporterVO loginUser = (EsupporterVO)session.getAttribute("loginUser");
		
		int wCode = loginUser.getWCode();
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("wCode", wCode);
		/*
		 * model.addAttribute("afterUrl", afterUrl); model.addAttribute("sCode", sCode);
		 */
		
		return url;
	}
	
	@PostMapping("/ers/esupporter/report")
	public String report(EquipmentReportVO equipmentReport, EmergencyReportVO emergencyReport, int afterUrl /*int sCode*/) {
		
		String url = "";
		
		String retype = emergencyReport.getReType();
		
		if(retype.equals("1")) {
			esupporterService.insertEmergencyReport(emergencyReport);
		}else {
			esupporterService.insertEquipmentReport(equipmentReport);
		}
			
		
		
		/* 어디서 왔냐에 따라다르다. 
		 * 예
		 * 1. 출동상세
		 * 2. 응급상황 리스트
		 * 3. 장비점검 리스트
		 * 위 3개의 곳으로 각각 보내줘야 한다.
		 */
		
		switch (afterUrl) {
		case 1: 
			return url = "redirect:/ers/esupporter/dispatchDetail?scode"/*+sCode*/;
		case 2:
			return url = "redirect:/ers/esupporter/emergencyList";
		case 3:
			return url = "redirect:/ers/esupporter/equipmentList";
		}
		
		return url;
		
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
	
	@GetMapping("/ers/esupporter/main")
	public String main() {
		return "esupporter/main";
	}
	
	@GetMapping("/ers/esupporter/loginForm")
	public String loginForm() {
		return "esupporter/loginForm";
	}
	
	@PostMapping("/ers/esupporter/login")
	public String login(String wid, String pwd, HttpSession session) throws Exception {
		
		String url = "redirect:/ers/esupporter/main";
		
		String message;
		
		int result = esupporterService.login(wid, pwd);
		switch(result) {
		case 0: //로그인 성공
			EsupporterVO loginUser = esupporterService.getEsupporter(wid);
			session.setAttribute("loginUser", loginUser);
//			session.setMaxInactiveInterval(600 * 30);
			return url;
		case 1: // 아이디 불일치
			 url="redirect:/ers/esupporter/loginForm";
	         message="아이디를 잘못입력하셨습니다.";
	         return message;
		case 2: // 비밀번호 불일치
			url="redirect:/ers/lsupporter/loginForm";
	    	message="패스워드를 잘못입력하셨습니다.";
	    	return message;
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
