package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.command.PageMaker;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.repository.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;

	
	public Map<String,Object> getMemberList(MemberSearchCriteria cri) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberVO> memberList = memberMapper.selectMemberList(cri,rowbounds);
		dataMap.put("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.selectSearchMemberListCount(cri));
		
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	public Map<String,Object> getMemberById(String id) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<LsupporterStatusVO> supporterList = memberMapper.selectAssignableLsupporter(id);
		MemberVO member = memberMapper.selectMemberById(id);
		
		dataMap.put("member", member);
		dataMap.put("supporterList", supporterList);
		
		return dataMap;
	}
	
	public MemberVO regist(MemberVO member) {
		String id = memberMapper.selectMemberSequenceNextValue();
		member.setId(id);
		
		
		
		return memberMapper.insertMember(member);
	}
	
	
}
