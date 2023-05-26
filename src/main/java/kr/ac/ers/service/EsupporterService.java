package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.DispatchReportVO;
import kr.ac.ers.dto.DispatchVO;
import kr.ac.ers.dto.EmergencyReportVO;
import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.dto.EquipmentReportVO;
import kr.ac.ers.dto.EsupporterVO;
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
	
	public EsupporterVO getEsupporter(String wId) {
		return esupporterMapper.selectEsupportByWId(wId);
	}
	
	public List<DispatchVO> getEmergencyList(SearchCriteria cri, String wId){
		List<DispatchVO> emergencyList = esupporterMapper.selectEmergencyList(cri, wId);
		return emergencyList;
	}
	
	public DispatchVO getEmergencyDetail() {
		DispatchVO dispatch = esupporterMapper.selectEmergencyDetail();
		return dispatch;
	}
	
	public List<DispatchReportVO> getEmergencyReportYNList(SearchCriteria cri, String wId){
		List<DispatchReportVO> dispatchReportList = esupporterMapper.selectEmergencyReportYNList(cri, wId);
		return dispatchReportList;
	}
	
	public DispatchReportVO getEmergencyReportYNDetail() {
		DispatchReportVO dispatchReport = esupporterMapper.selectEmergencyReportYNDetail();
		return dispatchReport;
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
	
	public List<EquipmentReportVO> getEquipmentReportList(SearchCriteria cri, int wCode){
		List<EquipmentReportVO> equipmentReportList = esupporterMapper.selectEquipmentReportList(cri, wCode);
		return equipmentReportList;
	}
	
	public EquipmentReportVO getEquipmentReport(int rNo) {
		EquipmentReportVO equipmentReport = esupporterMapper.selectEquipmentReport(rNo);
		return equipmentReport;
	}
	
	public void insertEquipmentReport(EquipmentReportVO equipmentReport) {
		int rNo = esupporterMapper.selectReportSequenceNextValue();
		equipmentReport.setRno(rNo);
		esupporterMapper.insertEquipmentReport(equipmentReport);
	}
	
	public void insertEmergencyReport(EmergencyReportVO emergencyReport) {
		int rNo = esupporterMapper.selectReportSequenceNextValue();
		emergencyReport.setRNo(rNo);
		esupporterMapper.insertEmergencyReport(emergencyReport);
	}
	
}
