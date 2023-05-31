package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.dto.CenterEmergencyReportVO;

@Mapper
public interface CenterEmergencyReportMapper {

	int selectEmergenctCount(String depart);

	int selectAmbulanceCount(String depart);

	int selectFireCount(String depart);

	List<CenterEmergencyReportVO> selectEmergencyReportListByDepart(Map<String, Object> dataMap, RowBounds rowBounds);

	int selectEmergencyReportListCountByDepart(Map<String, Object> dataMap);

	CenterEmergencyReportVO selectEmergencyReportByRno(String rno);

}
