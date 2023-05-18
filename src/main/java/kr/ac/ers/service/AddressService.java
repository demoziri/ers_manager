package kr.ac.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.AddressVO;
import kr.ac.ers.repository.AddressMapper;

@Service
public class AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	public List<AddressVO> getDongList(String gu){
		return  addressMapper.selectDongNameByLName(gu);
	}
	
}
