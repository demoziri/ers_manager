package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEquipmentUserListVO {
	
	private String m_name;
	private String address;
	private String phone;
	private String name;
	private String mstatus;
	private Date unconnecttime;
	private String c_name;
	private String l_name;
}
