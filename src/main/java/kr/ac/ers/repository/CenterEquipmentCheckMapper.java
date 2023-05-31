package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.dto.CenterEquipmentCheckVO;
import kr.ac.ers.dto.CenterEquipmentReportVO;

@Mapper
public interface CenterEquipmentCheckMapper {

	List<CenterEquipmentCheckVO> selectUnconnectList(String lname);

	List<CenterEquipmentCheckVO> selectUnconnectCancelList(String lname);

	List<CenterEquipmentCheckVO> selectMachineReturnList(String lname);

	List<CenterEquipmentCheckVO> selectNewMemberList(String lname);

	void insertEmergencyByMtype(int scode, String occurType, String mem_id, String wid);

	List<CenterEquipmentReportVO> selectEquipmentReportListByDepart(Map<String, Object> paramMap, RowBounds rowBounds);

}
