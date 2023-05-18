package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.EcallVO;

@Mapper
public interface EcallMapper {
	List<EcallVO> selectEcallListById(String id);
}
