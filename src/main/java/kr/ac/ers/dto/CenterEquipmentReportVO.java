package kr.ac.ers.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEquipmentReportVO {

	private String rno;
	private Date regDate;
	private String content;
	private String m_id;
	private String m_name;
	private String memType;
	private String address;
	private String phone;
	private String f_name;
	private String l_name;
	private String wType;
	private String e_phone;
	private String c_name;
	
	private List<CenterMachineCommandVO> machineList;
}
