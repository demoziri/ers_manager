package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.ManagerReportSearchCriteria;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.dto.ReportVO;

@Mapper
public interface ManagerReportMapper {

	

	List<ReportVO> selectReportByCriteria(ManagerReportSearchCriteria cri, RowBounds rowbounds);
	
	List<ReportVO> selectReportListToReportMain(ManagerReportSearchCriteria cri);
	

	int selectSearchMemberReportCount(ManagerReportSearchCriteria cri);
	
	ReportVO selectReportByRno(String rno);
	
	ReportVO updateViewCheck(String rno);
	
	List<ReportVO> selectReportListToMain(RowBounds rowbounds);
	
	ReportFileVO selectReportFileByRno(int rno);
	
	int selectMemberReportCount();
	
	int selectMachineReportCount();
	
	
	List<ReportVO> selectReportByViewCheck(String reType, String start_day, String end_day, String viewcheck);
}
