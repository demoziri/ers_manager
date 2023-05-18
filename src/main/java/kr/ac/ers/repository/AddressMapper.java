package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.AddressVO;

@Mapper
public interface AddressMapper {
	
	List<AddressVO> selectDongNameByLName(String gu);
	
}
