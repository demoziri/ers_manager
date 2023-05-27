package kr.ac.ers.repository;

import java.util.List;

import kr.ac.ers.dto.ReportVO;

public interface ManagerReportMapper {

	List<ReportVO> selectReportByMemId(String id);
}
