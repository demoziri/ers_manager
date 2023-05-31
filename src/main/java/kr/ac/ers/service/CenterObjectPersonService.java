package kr.ac.ers.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.CenterPersonCommandVO;
import kr.ac.ers.dto.CenterPersonVO;
import kr.ac.ers.repository.CenterEmergencyMapper;
import kr.ac.ers.repository.CenterObjectPersonMapper;

@Service
public class CenterObjectPersonService {

	@Autowired
	private CenterObjectPersonMapper centerObjectPersonMapper;
	@Autowired
	private CenterEmergencyMapper centerEmergencyMapper;
	
	public List<CenterPersonCommandVO> getPersonListToMain(String depart) {
		int count1 = centerObjectPersonMapper.selectActiveCountByDepart(depart);
		int count2 = centerObjectPersonMapper.selectGoOutCountByDepart(depart);
		int count3 = centerObjectPersonMapper.selectUnconnectCountByDepart(depart);
		int count4 = centerObjectPersonMapper.selectAbsenceCountByDepart(depart);
		
		List<CenterPersonCommandVO> personList = new ArrayList<>();
		
		String color = "";
		
		if(count1 >0) color = "text-red";
		else color = "text-black";
			CenterPersonCommandVO person1 = new CenterPersonCommandVO("활동 감지기",count1, color);
			if(count2 >0) color = "text-red";
			else color = "text-black";	
			CenterPersonCommandVO person2 = new CenterPersonCommandVO("외출중",count2, color);
			CenterPersonCommandVO person3 = new CenterPersonCommandVO("연결해제",count3, "text-blue");
			CenterPersonCommandVO person4 = new CenterPersonCommandVO("장기부재",count4, "text-blue");
			personList.add(person1);
			personList.add(person2);
			personList.add(person3);
			personList.add(person4);
			System.out.println(personList);
		return personList;
	}

	public List<CenterPersonVO> getPersonActiveList(String depart) {
		return centerObjectPersonMapper.selectPersonActiveListByDepart(depart);
	}

	public List<CenterPersonVO> getPersonGoOutList(String depart) {
		 
		 
		return centerObjectPersonMapper.selectPersonGoOutListByDepart(depart);
	}

	public void modifyCommandEmanager(String wcode, String personGubun, String mid) {
		String wid = centerEmergencyMapper.selectWidByWcode(wcode);
		int paramGubun = 0;
		if(personGubun.equals("active")) paramGubun = 4;
		else paramGubun = 5;
		int scode = centerObjectPersonMapper.selectEmergencyNextVal();
		centerObjectPersonMapper.insertEmergencySituation(scode, wid, paramGubun, mid);
		centerObjectPersonMapper.updateMemberEid(wid, mid);
		centerEmergencyMapper.updateEmanagerChangeStatus(wid);
		
	}
	
}
