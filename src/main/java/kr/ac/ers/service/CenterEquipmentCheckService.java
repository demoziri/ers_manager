package kr.ac.ers.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterEmanagerVO;
import kr.ac.ers.dto.CenterEquipmentCheckVO;
import kr.ac.ers.dto.CenterEquipmentReportVO;
import kr.ac.ers.dto.CenterMachineCommandVO;
import kr.ac.ers.repository.CenterEmanagerMapper;
import kr.ac.ers.repository.CenterEmergencyMapper;
import kr.ac.ers.repository.CenterEquipmentCheckMapper;
import kr.ac.ers.repository.CenterObjectPersonMapper;

@Service
public class CenterEquipmentCheckService {

	@Autowired
	private CenterEquipmentCheckMapper centerEquipmentCheckMapper;
	@Autowired
	private CenterObjectPersonMapper centerObjectPersonMapper;
	@Autowired
	private CenterEmanagerMapper centerEmanagerMapper;
	@Autowired
	private CenterEmergencyMapper centerEmergencyMapper;
	
	public List<CenterEquipmentCheckVO> getHouseholdList(String lname) {
		
		List<CenterEquipmentCheckVO> householdList = new ArrayList<>();
		
		List<CenterEquipmentCheckVO> list1 = centerEquipmentCheckMapper.selectUnconnectList(lname);
		if(list1 !=null && list1.size()>0) 
			for(CenterEquipmentCheckVO household : list1) {
				householdList.add(household);
			}
		List<CenterEquipmentCheckVO> list2 = centerEquipmentCheckMapper.selectUnconnectCancelList(lname);
		if(list2 !=null && list2.size()>0) 
			for(CenterEquipmentCheckVO household : list2) {
				household.setMa_name("전체");
				household.setMstatus("연결차단 해제");
				householdList.add(household);
			}
		List<CenterEquipmentCheckVO> list3 = centerEquipmentCheckMapper.selectMachineReturnList(lname);
		if(list3 !=null && list3.size()>0) 
			for(CenterEquipmentCheckVO household : list3) {
				household.setMa_name("전체");
				household.setMstatus("장비회수");
				householdList.add(household);
			}
		List<CenterEquipmentCheckVO> list4 = centerEquipmentCheckMapper.selectNewMemberList(lname);
		if(list4 !=null && list4.size()>0) 
			for(CenterEquipmentCheckVO household : list4) {
				household.setMa_name("전체");
				household.setMstatus("신규가입자");
				householdList.add(household);
			}
		
		return householdList;
	}

	public List<CenterEquipmentCheckVO> getHouseholdListToMain(String depart) {
		List<CenterEquipmentCheckVO> list = getHouseholdList(depart);
		List<CenterEquipmentCheckVO> equipmentCkList = new ArrayList<>();
		if(list != null && list.size()>0) {
			for(int i = 0; i < list.size(); i++) {
				if(i==4)break;
				equipmentCkList.add(list.get(i));
			}
		}
		return equipmentCkList;
	}

	public void modifyEquipmentCheck(String wcode, String mem_id, String m_name, String mstatus) {
		String occurType = "";
		switch (m_name) {
		case "게이트웨이": 
			occurType = "6";
			break;
		case "활동감지기":
			occurType = "7";
			break;
		case "출입문감지기":
			occurType = "8";
			break;
		case "화재감지기":
			occurType = "9";
			break;
		case "전체":
			switch (mstatus) {
			case "연결차단 해제": 
				occurType = "10";
				break;
			case "장비회수": 
				occurType = "11";
				break;
			case "신규가입자": 
				occurType = "10";
				break;
			}
			break;
		}
		System.out.println("wcode : " + wcode +"mem_id : "+ mem_id +"m_name : "+ m_name + "mstatus" + mstatus);
		System.out.println("dd" + occurType);
		CenterEmanagerVO emanager = centerEmanagerMapper.selectEmanagerByWcode(Integer.parseInt(wcode));
		int scode = centerObjectPersonMapper.selectEmergencyNextVal();
		System.out.println(scode);
		centerEquipmentCheckMapper.insertEmergencyByMtype(scode, occurType, mem_id, emanager.getWid());
		centerEmergencyMapper.updateEmanagerChangeStatus(emanager.getWid());
		centerObjectPersonMapper.updateMemberEid(emanager.getWid(), mem_id);
	}

	public Map<String, Object> getEquipmentReportListByDepart(Map<String, Object> paramMap, SearchCriteria cri) {
		Map<String,Object> returnMap = new HashMap<>();
		
		RowBounds rowBounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<CenterEquipmentReportVO> reportList = centerEquipmentCheckMapper.selectEquipmentReportListByDepart(paramMap, rowBounds);
		int count = centerEquipmentCheckMapper.selectEquipmentReportListCountByDepart(paramMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		returnMap.put("reportList", reportList);
		returnMap.put("pageMaker", pageMaker);
		
		return returnMap;
	}

	public CenterEquipmentReportVO getEquipmentReportByRno(String rno) {
		
		CenterEquipmentReportVO report =  centerEquipmentCheckMapper.selectEquipmentReportByRno(rno);
				
		if(report!=null) {
			List<CenterMachineCommandVO> machineList = centerEquipmentCheckMapper.selectMachineListByRno(rno);
			report.setMachineList(machineList);
		}
			
				
		return report;
	}
	
}
