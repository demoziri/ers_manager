package kr.ac.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.repository.ManagerStaffMapper;

@Service
public class ManagerStaffService {
	
	@Autowired
	private ManagerStaffMapper managerStaffMapper;
	
	public List<ManagerVO> getManagerNeedApproval(String depart) {
		return managerStaffMapper.selectManagerNeedApproval(depart);
	}
}
