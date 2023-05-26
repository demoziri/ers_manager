package kr.ac.ers.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.CenterEquipmentCheckVO;
import kr.ac.ers.repository.CenterEquipmentCheckMapper;

@Service
public class CenterEquipmentCheckService {

	@Autowired
	private CenterEquipmentCheckMapper centerEquipmentCheckMapper;

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
	         for(int i = 0; i < 4; i++) {
	            equipmentCkList.add(list.get(i));
	         }
	      }
	      return equipmentCkList;
	   }
	
	
}
