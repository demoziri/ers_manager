package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.ers.command.ManagerReportSearchCriteria;
import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.repository.ManagerReportMapper;

public class ManagerReportSerivce {
	
	@Autowired
	private ManagerReportMapper managerReportMapper;
	
	
	
	/*
	 * public Map<String,Object> getReportList(ManagerReportSearchCriteria cri,) {
	 * Map<String,Object> dataMap = new HashMap<String,Object>();
	 * 
	 * RowBounds rowbounds = new
	 * RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
	 * 
	 * List<ReportVO> reportList = managerReportMapper.selectReportByMemId(id,
	 * cri,rowbounds);
	 * 
	 * for(MemberVO member : memberList) { String id = member.getId(); int count =
	 * memberMapper.countMachineCk(id);
	 * 
	 * member.setMachineCk(count); }
	 * 
	 * dataMap.put("memberList", memberList);
	 * 
	 * }
	 */
}
	
	