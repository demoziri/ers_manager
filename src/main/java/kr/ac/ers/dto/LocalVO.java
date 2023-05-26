package kr.ac.ers.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocalVO {

	private String lnum;
	private String name;
	
	private List<CenterEquipmentVO> equipmentList;
}
