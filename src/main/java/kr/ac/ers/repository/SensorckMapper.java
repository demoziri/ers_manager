package kr.ac.ers.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.ers.dto.SensorckVO;

@Mapper
public interface SensorckMapper {
	
	public String selectOutconfirm(@Param("id") String  id);

	void updateMemberStatusToY(@Param("id") String id);

	void updateMemberStatusToN(@Param("id") String id);
	
	void updateActivetime(@Param("id") String id);

	SensorckVO getSensorck(@Param("id") String id);

}
