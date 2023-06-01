package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.ManagerVO;

@Mapper
public interface ManagerStaffMapper {
	
	List<ManagerVO> selectManagerNeedApproval(String depart);
	
}
