package kr.ac.ers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.EmergencyVO;
import kr.ac.ers.repository.EmergencyMapper;

@Service
public class EmergencyService {
	@Autowired
	private EmergencyMapper emergencyMapper;
	
	
	public EmergencyVO occurEmergency(String stype, String id) {
		int scode = emergencyMapper.emergency_seq();
		emergencyMapper.insertEmergency(scode, stype, id);
		
		if (stype.equals("3")) {
			EmergencyVO emergency = emergencyMapper.selectNewEmergency(id);
			return emergency;
		}else {
			return null;
		}
		
	}
	
	public EmergencyVO selectNewEmergency(String id) {
		return emergencyMapper.selectNewEmergency(id);
	}
}
