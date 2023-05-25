package kr.ac.ers.repository;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.ApplyFileVO;

@Mapper
public interface ApplyFileMapper {
	
	public ApplyFileVO selectApplyFileByAfNo(int afNo);
	
	public void insertApplyFile(ApplyFileVO applyFile);
	
	public void deleteApplyFile(int afNo);

}
