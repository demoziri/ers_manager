package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.CenterEmergencyVO;

@Mapper
public interface CenterEmergencyMapper {


	int selectEmergencyCountByDepart(String depart);

	void updateEmergencyCheckOut(String depart);

	List<CenterEmergencyVO> selectEmergencyListByDepart(String depart);

	List<CenterEmergencyVO> selectEmergencyListByDepartForScode(String depart);

	
}
