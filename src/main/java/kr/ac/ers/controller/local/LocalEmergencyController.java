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
import kr.ac.ers.dto.CenterEmergencyVO;
import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.service.CenterEmanagerService;
import kr.ac.ers.service.CenterEmergencyService;
import kr.ac.ers.service.CenterEquipmentService;

@Controller
@RequestMapping("/ers/local/emergency")
public class LocalEmergencyController {

   @Autowired
   private CenterEmergencyService centerEmergencyService;
   @Autowired
   private CenterEquipmentService centerEquipmentService;
   @Autowired
   private CenterEmanagerService centerEmanagerService;
   
   @GetMapping("/list")
   public void list(Model model, HttpSession session) {
      ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
      List<CenterEmergencyVO> emergencyList = centerEmergencyService.getEmergencyList(manager.getDepart());
      
      model.addAttribute("emergencyList", emergencyList);
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
   
}