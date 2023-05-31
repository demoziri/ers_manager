package kr.ac.ers.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.ers.dto.EmergencyVO;

@Mapper
public interface EmergencyMapper {
	
	void insertEmergency(@Param("scode")int scode, @Param("stype")String stype, @Param("id")String id);
	
	int emergency_seq();
	
	EmergencyVO selectNewEmergency(@Param("id") String id);
	
	
}
