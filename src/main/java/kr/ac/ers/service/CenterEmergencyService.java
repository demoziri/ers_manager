package kr.ac.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.CenterEmergencyVO;
import kr.ac.ers.repository.CenterEmergencyMapper;

@Service
public class CenterEmergencyService {

	@Autowired
	private CenterEmergencyMapper centerEmergencyMapper;
	
	public int getEmergencyCountByDepart(String depart) {
		int count = centerEmergencyMapper.selectEmergencyCountByDepart(depart);
		return count;
	}


	public void modifyEmergency(String depart) {
		List<CenterEmergencyVO> emergencyList = centerEmergencyMapper.selectEmergencyListByDepartForScode(depart);
		
		if(emergencyList!=null && emergencyList.size()>0)
			for(CenterEmergencyVO emergency : emergencyList) {
				 centerEmergencyMapper.updateEmergencyCheckOut(emergency.getScode());
			}
		
	}


	public List<CenterEmergencyVO> getEmergencyList(String depart) {
		List<CenterEmergencyVO> emergencyList = centerEmergencyMapper.selectEmergencyListByDepart(depart);
		return emergencyList;
	}

}
