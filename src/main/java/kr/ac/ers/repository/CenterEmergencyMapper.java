package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.CenterEmergencyVO;
import kr.ac.ers.dto.LocalVO;

@Mapper
public interface CenterEmergencyMapper {


	int selectEmergencyCountByDepart(String depart);

	void updateEmergencyCheckOut(String depart);

	List<CenterEmergencyVO> selectEmergencyListByDepart(String depart);

	List<CenterEmergencyVO> selectEmergencyListByDepartForScode(String depart);

	String selectWidByWcode(String wcode);

	void updateEmergencyInsertWid(String scode, String wid);

	void updateEmanagerChangeStatus(String wid);

	List<LocalVO> selectLocalList();

	
}
