package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.CenterPersonVO;

@Mapper
public interface CenterObjectPersonMapper {

	int selectActiveCountByDepart(String depart);

	int selectGoOutCountByDepart(String depart);

	int selectUnconnectCountByDepart(String depart);

	int selectAbsenceCountByDepart(String depart);

	List<CenterPersonVO> selectPersonActiveListByDepart(String depart);

	List<CenterPersonVO> selectPersonGoOutListByDepart(String depart);

	int selectEmergencyNextVal();
	
	void insertEmergencySituation(int scode, String wid, int paramGubun, String mid);

	void updateMemberEid(String wid, String mid);




}
