package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.CenterEquipmentCheckVO;

@Mapper
public interface CenterEquipmentCheckMapper {

	List<CenterEquipmentCheckVO> selectUnconnectList(String lname);

	List<CenterEquipmentCheckVO> selectUnconnectCancelList(String lname);

	List<CenterEquipmentCheckVO> selectMachineReturnList(String lname);

	List<CenterEquipmentCheckVO> selectNewMemberList(String lname);

}
