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
import kr.ac.ers.repository.CenterEmanagerMapper;

@Service
public class CenterEmanagerService {

	@Autowired
	private CenterEmanagerMapper centerEmanagerMapper;
	
	
	public Map<String, Object> getEmanagerList(SearchCriteria cri, Map<String, Object> returnMap) {
		Map<String, Object> dataMap = new HashMap<>();
		
		RowBounds rowBounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		returnMap.put("cri", cri);
		
		List<CenterEmanagerVO> emanagerList = centerEmanagerMapper.selectEmanagerList(returnMap,rowBounds);
				
		int totalCount = centerEmanagerMapper.selectEmanagerListCount(returnMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("emanagerList", emanagerList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	public CenterEmanagerVO getEmanagerByWcode(int wcode) {
		return centerEmanagerMapper.selectEmanagerByWcode(wcode);
	}

	public List<CenterEmanagerVO> getEmanagerListToMain() {
		List<CenterEmanagerVO> emanagerList = centerEmanagerMapper.selectEmanagerListToMain();
		return emanagerList;
	}

	public List<CenterEmanagerVO> getEmanagerListToLocalMain(String lname) {
		List<CenterEmanagerVO> emanagerList = new ArrayList<>();
		int count1 = centerEmanagerMapper.selectEmanagerListByLnameStatus(lname, "출동중");
		CenterEmanagerVO emanager1 = new CenterEmanagerVO("출동중", count1);
		emanagerList.add(emanager1);
		int count2 = centerEmanagerMapper.selectEmanagerListByLnameStatus(lname, "대기중");
		CenterEmanagerVO emanager2 = new CenterEmanagerVO("대기중", count2);
		emanagerList.add(emanager2);
		int count3 = centerEmanagerMapper.selectEmanagerListByLnameStatus(lname, "퇴근");
		CenterEmanagerVO emanager3 = new CenterEmanagerVO("퇴근", count3);
		emanagerList.add(emanager3);
		
		return emanagerList;
	}

	public List<CenterEmanagerVO> getEmanagerListByCnum(int cnum) {
		return centerEmanagerMapper.selectEmanagerListByCnum(cnum);
	}
	
}
