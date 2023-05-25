package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.command.PageMaker;
import kr.ac.ers.dto.ApplyFileVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.repository.ApplyFileMapper;
import kr.ac.ers.repository.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private ApplyFileMapper applyFileMapper;
	
	public Map<String,Object> getMemberList(MemberSearchCriteria cri) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberVO> memberList = memberMapper.selectMemberList(cri,rowbounds);
		
		for(MemberVO member : memberList) {
			String id = member.getId();
			int count = memberMapper.countMachineCk(id);
			
			member.setMachineCk(count);
		}
		
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
	
	public List<LsupporterStatusVO> getLsuppList(String id){
		return memberMapper.selectAssignableLsupporter(id);
	}
	
	
	public void regist(MemberVO member) {
		String id = memberMapper.selectMemberSequenceNextValue();
		memberMapper.insertMember(member);
		
	}
	
	public String nextId() {
		String id = memberMapper.selectMemberSequenceNextValue();
		return id;
	}
	
	
	public void registLsupporter(String wid, String id) {
		memberMapper.updateLsupporter(id, wid);
	}
	
	public int countMachineCheck(String id) {
		return memberMapper.countMachineCk(id);
	}


	public String selectLsupporterName(String id) {
		return memberMapper.selectLsupporterName(id);
	}


	public String getMaxId() {
		return memberMapper.selectMaxId();
	}
	
	
	public void modifyMember(MemberVO member) {
		memberMapper.updateMember(member);
	}
	
	public ApplyFileVO getApplyFile(int afNo) {
		return applyFileMapper.selectApplyFileByAfNo(afNo);
	}
	
	
}
