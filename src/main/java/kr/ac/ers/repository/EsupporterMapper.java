package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchReportVO;
import kr.ac.ers.dto.DispatchVO;
import kr.ac.ers.dto.EmergencyReportVO;
import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.dto.EquipmentReportVO;
import kr.ac.ers.dto.EsupporterVO;

@Mapper
public interface EsupporterMapper {
	
	int esupporterStateChange(String wId);
	
	EmergencyVO emergencyDispatchNotification(String wId);
	
	void checkEmergencyDispatchNotification(EmergencyVO mergency);
	
	void afterReportEmergencyDispatchNotification(EmergencyVO mergency);
	
	EsupporterVO selectEsupportByWId(String wId);
	
	List<DispatchVO> selectEmergencyList(SearchCriteria cri, String wId);
	
	DispatchVO selectEmergencyDetail();
	
	List<DispatchReportVO> selectEmergencyReportYNList(SearchCriteria cri, String wId);
	
	DispatchReportVO selectEmergencyReportYNDetail();
	
	List<EmergencyReportVO> selectEmergencyReportList(Map<String, Object> returnMap, RowBounds rowBounds);
	
	int selectEmergencyReportCount(Map<String, Object> returnMap);
	
	EmergencyReportVO selectEmergencyReportDetail(int rno);
	
	List<EquipmentReportVO> selectEquipmentReportList(SearchCriteria cri, int wcode);
	
	EquipmentReportVO selectEquipmentReport(int rno);
	
	int selectReportSequenceNextValue();
	
	void insertEquipmentReport(EquipmentReportVO equipmentReport);
	
	void insertEmergencyReport(EmergencyReportVO emergencyReport);
	
}
