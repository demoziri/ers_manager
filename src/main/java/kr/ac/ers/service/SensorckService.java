package kr.ac.ers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.SensorckVO;
import kr.ac.ers.repository.SensorckMapper;

@Service
public class SensorckService {
	@Autowired
	private SensorckMapper sensorckMapper;

	public SensorckVO modifyMemberstasus(String id) {
		String outconfirm = sensorckMapper.selectOutconfirm(id);
		if (outconfirm.equals("N")) {
			sensorckMapper.updateMemberStatusToY(id);
		}else {
			sensorckMapper.updateMemberStatusToN(id);
		}
		
		SensorckVO sensor =sensorckMapper.getSensorck(id);
		
		return sensor;
		
	}
	
	public SensorckVO modifyActivetime(String id) {
		
		sensorckMapper.updateActivetime(id);
		
		SensorckVO sensor =sensorckMapper.getSensorck(id);
		
		return sensor;
		
	}
	
	public SensorckVO getMemberStasus (String id) {
		return sensorckMapper.getSensorck(id);
	}

} 
	
