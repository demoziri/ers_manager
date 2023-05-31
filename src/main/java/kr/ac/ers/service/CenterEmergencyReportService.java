package kr.ac.ers.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CenterEmergencyReportCommandVO;
import kr.ac.ers.dto.CenterEmergencyReportVO;
import kr.ac.ers.repository.CenterEmergencyReportMapper;

@Service
public class CenterEmergencyReportService {

	@Autowired
	private CenterEmergencyReportMapper centerEmergencyReportMapper;

	public List<CenterEmergencyReportCommandVO> getEmergencyReportListToMain(String depart) {
		
		int count1 = centerEmergencyReportMapper.selectEmergenctCount(depart);
		int count2 = centerEmergencyReportMapper.selectAmbulanceCount(depart);
		int count3 = centerEmergencyReportMapper.selectFireCount(depart);
		
		List<CenterEmergencyReportCommandVO> reportList = new ArrayList<>();
		
		reportList.add(new CenterEmergencyReportCommandVO("응급호출",count1));
		reportList.add(new CenterEmergencyReportCommandVO("119통화",count2));
		reportList.add(new CenterEmergencyReportCommandVO("화재감지",count3));
		return reportList;
	}

	public Map<String, Object> getEmergencyReportListByDepart(Map<String, Object> dataMap, SearchCriteria cri) {
		Map<String,Object> returnMap = new HashMap<>();
		
		RowBounds rowBounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<CenterEmergencyReportVO> reportList = centerEmergencyReportMapper.selectEmergencyReportListByDepart(dataMap, rowBounds);
		int count = centerEmergencyReportMapper.selectEmergencyReportListCountByDepart(dataMap);
		
		if(reportList != null && reportList.size() > 0)
			for(CenterEmergencyReportVO report : reportList) {
				SimpleDateFormat sf = new SimpleDateFormat("yyDDmm");
				DecimalFormat df = new DecimalFormat("0000");
				report.setChangeRno("R" + sf.format(report.getR_regDate()) + df.format(Double.parseDouble(report.getRno())));
			}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		returnMap.put("reportList", reportList);
		returnMap.put("pageMaker", pageMaker);
		
		return returnMap;
	}

	public CenterEmergencyReportVO getEmergencyReportByRno(String rno) {
		
		CenterEmergencyReportVO report = centerEmergencyReportMapper.selectEmergencyReportByRno(rno);
		
		SimpleDateFormat sf = new SimpleDateFormat("yyDDmm");
		DecimalFormat df = new DecimalFormat("0000");
		report.setChangeRno("R" + sf.format(report.getR_regDate()) + df.format(Double.parseDouble(report.getRno())));
		
		return report;
	}

}
