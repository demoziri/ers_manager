package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterCenterVO;
import kr.ac.ers.dto.CenterEquipmentUserListVO;
import kr.ac.ers.dto.CenterEquipmentVO;
import kr.ac.ers.dto.LocalVO;
import kr.ac.ers.repository.CenterEquipmentMapper;

@Service
public class CenterEquipmentService {

	@Autowired
	private CenterEquipmentMapper centerEquipmentMapper;
	
	public List<CenterEquipmentVO> getEquipmentListWithCount(String lname) {
		List<CenterEquipmentVO> equimentList = centerEquipmentMapper.selectEquipmentListWithCount(lname);
		return equimentList;
	}

	public List<LocalVO> getLocalListInEquipmentList() {
		List<LocalVO> localList = centerEquipmentMapper.selectLocalList();
		
		if(localList != null)
			for(LocalVO local : localList) {
				
				List<CenterEquipmentVO> equimentList = centerEquipmentMapper.selectEquipmentListWithCountByLnum(local.getLnum());
				
				local.setEquipmentList(equimentList);
			}
		
		return localList;
	}

	public List<CenterCenterVO> getCenterListInByLname(String lname, String center_name) {
		List<CenterCenterVO> centerList = centerEquipmentMapper.selectCenterListByLname(lname,center_name);
		
		if(centerList!=null && centerList.size()>0)
			for(CenterCenterVO center : centerList) {
				List<CenterEquipmentVO> equipmentList = centerEquipmentMapper.selectEquipmentListByLnameCenterName(center.getC_name());
				center.setEquipmentList(equipmentList);
			}
		return centerList;
	}

	public Map<String, Object> getUserListByInfo(Map<String, Object> dataMap, SearchCriteria cri) {
		Map<String, Object> returnMap = new HashMap<>();
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		System.out.println(dataMap);
		List<CenterEquipmentUserListVO> userList = centerEquipmentMapper.selecUserListByInfo(dataMap, rowbounds);
		int totalCount = centerEquipmentMapper.selectUserListCount(dataMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		returnMap.put("userList", userList);
		returnMap.put("pageMaker", pageMaker);
		return returnMap;
	}



}
