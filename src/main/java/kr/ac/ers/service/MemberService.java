package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.command.PageMaker;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.repository.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	
	public Map<String,Object> getMemberList(MemberSearchCriteria cri) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		System.out.println("start : " + cri.getStartRowNum());
		System.out.println("per : " + cri.getPerPageNum());
		List<MemberVO> memberList = memberMapper.selectMemberList(cri,rowbounds);
		dataMap.put("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.selectSearchMemberListCount(cri));
		
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	public MemberVO getMemberById(String id) {
		return memberMapper.selectMemberById(id);
	}
}
