package kr.ac.ers.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterCenterVO {

	private int cnum;
	private String c_name;
	private String address;
	private String phone;
	private String supervisor;
	private String dongcode;
	private String lnum;
	private String l_name;
	private boolean bg_color = false;
	private boolean checked = false;
	
	private List<CenterEquipmentVO> equipmentList;
}
