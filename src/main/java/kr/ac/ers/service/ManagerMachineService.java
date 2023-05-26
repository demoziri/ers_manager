package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.MachinePageMaker;
import kr.ac.ers.command.MachineSearchCriteria;
import kr.ac.ers.command.MemPageMaker;
import kr.ac.ers.dto.ManagerMachineVO;
import kr.ac.ers.repository.ManagerMachineMapper;

@Service
public class ManagerMachineService {

	@Autowired
	private ManagerMachineMapper managerMachineMapper;
	
	
	public Map<String,Object> getEquipmentList(MachineSearchCriteria cri) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<ManagerMachineVO> stockList = managerMachineMapper.selectStockList(cri,rowbounds);
		
		dataMap.put("stockList", stockList);
		
		MachinePageMaker pageMaker = new MachinePageMaker();
		pageMaker.setMachineCri(cri);
		pageMaker.setTotalCount(managerMachineMapper.selectSearchStockListCount(cri));
		
		dataMap.put("pageMaker", pageMaker);
		
		
		
		
		return dataMap;
	}
	
	
	public List<ManagerMachineVO> getASListPerWeek(){
		
		List<ManagerMachineVO> asList = managerMachineMapper.selectASListPerWeek();
		
		return asList;
	}
	
	
	
}
