package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.dto.CenterCenterVO;
import kr.ac.ers.dto.CenterEquipmentUserListVO;
import kr.ac.ers.dto.CenterEquipmentVO;
import kr.ac.ers.dto.LocalVO;

@Mapper
public interface CenterEquipmentMapper {

	List<CenterEquipmentVO> selectEquipmentListWithCount(String lname);

	List<LocalVO> selectLocalList();

	List<CenterEquipmentVO> selectEquipmentListWithCountByLnum(String lnum);

	List<CenterCenterVO> selectCenterListByLname(String lname, String center_name);

	List<CenterEquipmentVO> selectEquipmentListByLnameCenterName(String center_name);

	List<CenterEquipmentUserListVO> selecUserListByInfo(Map<String, Object> dataMap, RowBounds rowbounds);

	int selectUserListCount(Map<String, Object> dataMap);

}
