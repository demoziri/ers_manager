package kr.ac.ers.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.CenterEmergencyReportCommandVO;
import kr.ac.ers.dto.CenterEmergencyVO;
import kr.ac.ers.dto.LocalVO;
import kr.ac.ers.repository.CenterEmergencyMapper;
import kr.ac.ers.repository.CenterEmergencyReportMapper;

@Service
public class CenterEmergencyService {

	@Autowired
	private CenterEmergencyMapper centerEmergencyMapper;
	@Autowired
	private CenterEmergencyReportMapper centerEmergencyReportMapper;
	
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

	public void modifyEmergencyInsertWid(String scode, String wcode) {
		String wid = centerEmergencyMapper.selectWidByWcode(wcode);
		centerEmergencyMapper.updateEmergencyInsertWid(scode, wid);
		centerEmergencyMapper.updateEmanagerChangeStatus(wid);
	}


	public List<LocalVO> getEmergencyListToMain() {
		List<LocalVO> localList = centerEmergencyMapper.selectLocalList();
		
		for(LocalVO local : localList) {
			int count1 = centerEmergencyReportMapper.selectEmergenctCount(local.getName());
			int count2 = centerEmergencyReportMapper.selectAmbulanceCount(local.getName());
			int count3 = centerEmergencyReportMapper.selectFireCount(local.getName());
			
			List<CenterEmergencyReportCommandVO> reportList = new ArrayList<>();
			
			reportList.add(new CenterEmergencyReportCommandVO("응급호출",count1));
			reportList.add(new CenterEmergencyReportCommandVO("119통화",count2));
			reportList.add(new CenterEmergencyReportCommandVO("화재감지",count3));
			local.setReportList(reportList);
		}
		
		return localList;
	}

}
