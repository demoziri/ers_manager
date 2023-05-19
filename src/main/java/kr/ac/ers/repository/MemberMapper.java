package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.MemberSearchCriteria;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.MemberVO;

@Mapper
public interface MemberMapper {
	
	MemberVO selectMemberById(String id);
	
	int selectSearchMemberListCount(MemberSearchCriteria cri);

	List<MemberVO> selectMemberList(MemberSearchCriteria cri, RowBounds rowbounds);
	
	String selectMemberSequenceNextValue();
	
	MemberVO insertMember(MemberVO member);
	
	List<LsupporterStatusVO> selectAssignableLsupporter(String id);
}
