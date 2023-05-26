package kr.ac.ers.service;

import org.springframework.stereotype.Service;

import kr.ac.ers.dto.ManagerVO;
import kr.ac.ers.repository.ManagerMapper;


@Service
public class ManagerService {
	private ManagerMapper managerMapper;
	
	
	public ManagerService(ManagerMapper managerMapper) {
		this.managerMapper=managerMapper;
	}
	
	public ManagerVO getManagerByLoginId(String loginId) {
		return managerMapper.getManagerByLoginId(loginId);
	}
	
	public int login(String id, String pwd) {
		// 0:성공 1:아이디불일치 2:패스워드불일치
		int result = 0;
		try {
			ManagerVO manager = managerMapper.getManagerByLoginId(id);
			if (manager != null) {
				if (!manager.getPwd().equals(pwd)) {// 패스워드 불일치
					result = 2;
				}
			} else {// 아이디 불일치
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return result;
	}

	public ManagerVO getManager(String id) {
		ManagerVO manager = managerMapper.selectManagerById(id);
		return manager;
	}
	
	public void join(ManagerVO manager) {
		managerMapper.insertManager(manager);
		
	}

	public int overlappedID(ManagerVO manager) {
		int result = managerMapper.overlappedID(manager);
		return result;
	}
	
	public String manager_findId(String name, String phone) {
		String manid = managerMapper.manager_FindId(name, phone);
		return manid;
	}
	
	public String manager_findPw(String id, String phone) {
		return managerMapper.manager_FindPw(id, phone);
	}
	
	public String manager_resetPw(String id, String pwd) {
		return managerMapper.manager_resetPw(id, pwd);
	}


}