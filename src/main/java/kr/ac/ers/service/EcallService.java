package kr.ac.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.EcallVO;
import kr.ac.ers.repository.EcallMapper;

@Service
public class EcallService {
	
	@Autowired
	private EcallMapper ecallMapper;
	
	public List<EcallVO> getEcallList(String id){
		return ecallMapper.selectEcallListById(id);
	}
	
	public int getEcallCount(String id) {
		return ecallMapper.selectEcallCount(id);
	}
	
	public void registEcall(EcallVO ecall) {
		int c_Num = ecallMapper.selectEcallSequenceNextValue();
		ecall.setCnum(c_Num);
		ecallMapper.insertEcall(ecall);
	}
	
	public void modifyEcall(EcallVO ecall) {
		ecallMapper.updateEcall(ecall);
	}
}
