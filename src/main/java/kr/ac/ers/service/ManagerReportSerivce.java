package kr.ac.ers.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.ManagerReportSearchCriteria;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.dto.ReportVO;
import kr.ac.ers.repository.ManagerReportMapper;

@Service
public class ManagerReportSerivce {

	@Autowired
	private ManagerReportMapper managerReportMapper;
	
	 public List<ReportVO> getReportListToMemberMain(ManagerReportSearchCriteria cri) {
	  
	 RowBounds rowbounds = new
	 RowBounds(0,4);
	 
	 List<ReportVO> reportList = managerReportMapper.selectReportByCriteria(cri,rowbounds);
		
	 return reportList;
	 
	 }
	 
	 public List<ReportVO> getReportListToReportMain(ManagerReportSearchCriteria cri,String viewcheck) {
		  
		
		 
		 List<ReportVO> reportList = managerReportMapper.selectReportListToReportMain(cri,viewcheck);
			
		 return reportList;
		 
		 }
	 
	 
	 
	 public ReportVO getReportByRno(String rno) {
		 
	 ReportVO report = managerReportMapper.selectReportByRno(rno);
	 
	 if(report.getViewCheck().equals("0") ) {
		 managerReportMapper.updateViewCheck(rno);
	 }
	 
	 return report;
		 
	 }
	 
	 public List<ReportVO> getReportListToManagerMain(){
		 RowBounds rowbounds = new RowBounds(0,6);
		 List<ReportVO> reportList = managerReportMapper.selectReportListToMain(rowbounds);
		 return reportList;
	 }
	 
	 public ReportFileVO getReportFileByRno(int rno) {
		 return managerReportMapper.selectReportFileByRno(rno);
	 }
	 
	 public int getMemberReportCount() {
		 return managerReportMapper.selectMemberReportCount();
	 }
	 public int getMachineReportCount() {
		 return managerReportMapper.selectMachineReportCount();
	 }
	 
	 
	 
	
	 
}
