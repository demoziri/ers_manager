package kr.ac.ers.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.MachinePageMaker;
import kr.ac.ers.command.MachineSearchCriteria;
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
	
	
	public List<ManagerMachineVO> getASPerWeek(){
		
		List<ManagerMachineVO> asList = managerMachineMapper.selectASPerWeek();
		
		return asList;
	}
	
	
	public List<ManagerMachineVO> getASListPerWeek(Date week_start, Date week_end, String cnum){
		
		List<ManagerMachineVO> asDetailList = managerMachineMapper.selectASListPerWeekBycNum(week_start, week_end, cnum);
		
		return asDetailList;
	}
	
	public ManagerMachineVO getTotalCount() {
		return managerMachineMapper.selectTotalCount();
	}
	
	public List<ManagerMachineVO> getMachineListByMcode(String mcode){
		List<ManagerMachineVO> machineList = managerMachineMapper.selectMachineListByMcode(mcode);
		
		return machineList;
	}
	
	
	public ManagerMachineVO getMachineAsGuCount() {
		return managerMachineMapper.selectAsGuCount();
	}
	
	
}
