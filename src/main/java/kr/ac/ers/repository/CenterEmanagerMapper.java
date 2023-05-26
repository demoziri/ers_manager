package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.dto.CenterEmanagerVO;

@Mapper
public interface CenterEmanagerMapper {

	List<CenterEmanagerVO> selectEmanagerList(Map<String, Object> returnMap, RowBounds rowBounds);

	int selectEmanagerListCount(Map<String, Object> returnMap);

	CenterEmanagerVO selectEmanagerByWcode(int wcode);

	List<CenterEmanagerVO> selectEmanagerListToMain();

	int selectEmanagerListByLnameStatus(String lname, String status);

	List<CenterEmanagerVO> selectEmanagerListByCnum(int cnum);

}
