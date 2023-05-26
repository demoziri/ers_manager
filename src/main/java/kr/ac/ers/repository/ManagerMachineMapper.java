package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.MachineSearchCriteria;
import kr.ac.ers.dto.ManagerMachineVO;


@Mapper
public interface ManagerMachineMapper {
	
	List<ManagerMachineVO> selectStockList(MachineSearchCriteria cri, RowBounds rowbounds);
	
	int selectSearchStockListCount(MachineSearchCriteria cri);
	
	List<ManagerMachineVO> selectASListPerWeek();
	
	
}
