package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchVO;
import kr.ac.ers.dto.EmergencyReportVO;
import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.dto.EquipmentReportVO;
import kr.ac.ers.dto.EsupporterVO;
import kr.ac.ers.dto.MemberNameSearchVO;
import kr.ac.ers.repository.EsupporterMapper;

@Service
public class EsupporterService {
	
	@Autowired
	EsupporterMapper esupporterMapper;
	
	public EsupporterService(EsupporterMapper esupporterMapper) {
		this.esupporterMapper = esupporterMapper;
	}
	
	// 로그인
	public int login(String wId, String pwd) {
		int result = 0;
		try {
			EsupporterVO esupport = esupporterMapper.selectEsupportByWId(wId);
			if (esupport != null) {
				if (!esupport.getPwd().equals(pwd)) {// 패스워드 불일치
					result = 2;
				}
			} else {// 아이디 불일치
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getEsupporterStateChange(String wId) {
		int eStatus = esupporterMapper.esupporterStateChange(wId);
		return eStatus;
	}
	
	public EmergencyVO getEmergencyDispatchNotification(String wId) {
		EmergencyVO emergency = esupporterMapper.emergencyDispatchNotification(wId);
		return emergency;
	}
	
	public void getCheckEmergency(int sCode, String reportCheck) {
		esupporterMapper.checkEmergencyDispatchNotification(sCode, reportCheck);
	}
	
	public EsupporterVO getEsupporter(String wId) {
		return esupporterMapper.selectEsupportByWId(wId);
	}
	
	public List<DispatchVO> getDispatchList(SearchCriteria cri, String wId){
		List<DispatchVO> emergencyList = esupporterMapper.selectDispatchList(cri, wId);
		return emergencyList;
	}
	
	public DispatchVO getDispatchDetail(int sCode) {
		DispatchVO dispatch = esupporterMapper.selectDispatchDetail(sCode);
		return dispatch;
	}
	
	public int getFireCount(String wId) {
		int fireCount = esupporterMapper.selectFireCount(wId);
		return fireCount;
	}
	
	public int getEmergencyCount(String wid) {
		int emergencyCount = esupporterMapper.selectEmergencyCount(wid);
		return emergencyCount;
	}
	
	public int getDispatchCount(String wId) {
		int dispatchCount = esupporterMapper.selectDispatchCount(wId);
		return dispatchCount;
	}
	
	public int getGatewayStockCount(int cNum) {
		int gatewayStockCount = esupporterMapper.selectGatewayStockCount(cNum);
		return gatewayStockCount;
	}
	
	public int getActivityDetectorStockCount(int cNum) {
		int activityDetectorStockCount = esupporterMapper.selectActivityDetectorStockCount(cNum);
		return activityDetectorStockCount;
	}
	
	public int getDoorDetectorsStockCount(int cNum) {
		int doorDetectorsStockCount = esupporterMapper.selectDoorDetectorsStockCount(cNum);
		return doorDetectorsStockCount;
	}
	
	public int getFireDetectorStockCount(int cNum) {
		int fireDetectorStockCount = esupporterMapper.selectFireDetectorStockCount(cNum);
		return fireDetectorStockCount;
	}
	
	public Map<String, Object> getEmergencyReportList(SearchCriteria cri, int wCode){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wCode", wCode);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<EmergencyReportVO> emergencyReportList = esupporterMapper.selectEmergencyReportList(returnMap, rowbounds);
		dataMap.put("emergencyReportList", emergencyReportList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(esupporterMapper.selectEmergencyReportCount(returnMap));
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	public EmergencyReportVO getEmergencyReportDetail(int rNo) {
		EmergencyReportVO emergencyReport = esupporterMapper.selectEmergencyReportDetail(rNo);
		return emergencyReport;
	}
	
	public Map<String, Object> getEquipmentReportList(SearchCriteria cri, int wCode){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wCode", wCode);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<EquipmentReportVO> equipmentReportList = esupporterMapper.selectEquipmentReportList(returnMap, rowbounds);
		dataMap.put("equipmentReportList", equipmentReportList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(esupporterMapper.selectEquipmentReportCount(returnMap));
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}
	
	public Map<String, Object> getMemberNameSearch(SearchCriteria cri, String wId){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wId", wId);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<MemberNameSearchVO> memberNameSearchList = esupporterMapper.selectMemberNameSearch(returnMap, rowbounds);
		dataMap.put("memberNameSearchList", memberNameSearchList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(esupporterMapper.selectMemberNameSearchCount(returnMap));
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}
	
	public EquipmentReportVO getEquipmentReport(int rNo) {
		EquipmentReportVO equipmentReport = esupporterMapper.selectEquipmentReport(rNo);
		return equipmentReport;
	}
	
	public void insertEquipmentReport(EquipmentReportVO equipmentReport) {
		int rNo = esupporterMapper.selectReportSequenceNextValue();
		equipmentReport.setRno(rNo);
		esupporterMapper.insertEquipmentReport(equipmentReport);
		esupporterMapper.updateEsupporterStatus(equipmentReport.getWcode());
		esupporterMapper.updateMemberEId(equipmentReport.getId());
	}
	
	public void insertEmergencyReport(EmergencyReportVO emergencyReport) {
		int rNo = esupporterMapper.selectReportSequenceNextValue();
		emergencyReport.setRNo(rNo);
		esupporterMapper.insertEmergencyReport(emergencyReport);
		esupporterMapper.updateEsupporterStatus(emergencyReport.getWCode());
		esupporterMapper.updateMemberEId(emergencyReport.getId());
	}
	
}
