package kr.ac.ers.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.ac.ers.dto.ManagerVO;

@Mapper
public interface ManagerMapper {

	ManagerVO getManagerByLoginId(@Param("id") String id);

	ManagerVO selectManagerById(@Param("id") String id);
	
	void insertManager(ManagerVO manager);

	int overlappedID(ManagerVO manager);

	String manager_FindId(@Param("name") String name, @Param("phone")String phone);
	
	String manager_FindPw(@Param("manid") String manid, @Param("phone")String phone);
	
	String manager_resetPw(@Param("manid") String manid, @Param("pwd")String pwd);
	
		
}