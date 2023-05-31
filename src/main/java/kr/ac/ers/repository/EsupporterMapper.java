package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchVO;
import kr.ac.ers.dto.EmergencyReportVO;
import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.dto.EquipmentReportVO;
import kr.ac.ers.dto.EsupporterVO;
import kr.ac.ers.dto.MemberNameSearchVO;

@Mapper
public interface EsupporterMapper {
	
	int esupporterStateChange(String wId);
	
	EmergencyVO emergencyDispatchNotification(String wId);
	
	void checkEmergencyDispatchNotification(int sCode, String reportCheck);
	
	void afterReportEmergencyDispatchNotification(EmergencyVO mergency);
	
	EsupporterVO selectEsupportByWId(String wId);
	
	List<DispatchVO> selectDispatchList(SearchCriteria cri, String wId);
	
	DispatchVO selectDispatchDetail(int sCode);
	
	int selectFireCount(String wId);
	
	int selectEmergencyCount(String wId);
	
	int selectDispatchCount(String wId);
	
	int selectGatewayStockCount(int cNum);
	
	int selectActivityDetectorStockCount(int cNum);
	
	int selectDoorDetectorsStockCount(int cNum);
	
	int selectFireDetectorStockCount(int cNum);
	
	List<EmergencyReportVO> selectEmergencyReportList(Map<String, Object> returnMap, RowBounds rowBounds);
	
	int selectEmergencyReportCount(Map<String, Object> returnMap);
	
	EmergencyReportVO selectEmergencyReportDetail(int rno);
	
	List<EquipmentReportVO> selectEquipmentReportList(Map<String, Object> returnMap, RowBounds rowBounds);
	
	int selectEquipmentReportCount(Map<String, Object> returnMap);
	
	List<MemberNameSearchVO> selectMemberNameSearch(Map<String, Object> returnMap, RowBounds rowBounds);
	
	int selectMemberNameSearchCount(Map<String, Object> returnMap);

	EquipmentReportVO selectEquipmentReport(int rno);
	
	int selectReportSequenceNextValue();
	
	void insertEquipmentReport(EquipmentReportVO equipmentReport);
	
	void insertEmergencyReport(EmergencyReportVO emergencyReport);
	
	void updateEsupporterStatus(int wCode);
	
	void updateMemberEId(String id);
	
}
