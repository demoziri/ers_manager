package kr.ac.ers.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEquipmentVO {
	
	private String mcode;
	private String m_name;
	private String l_name;
	private int cnum;
	private String c_name;
	private int totalCount;
	private int receive;
	private int noreceive;
	private int unconnect;
	private int trouble;
	private int stock;
	private String equipmentPercent;
	
	private void calc() {
		double equ =  getReceive()*100.0 / getTotalCount() ;
		this.equipmentPercent=Double.toString(Math.round(equ*100)/100.0)+"%";
	}
	
	public void setStock(int stock) {
		this.stock = stock;
		calc();
	}
	
	
}
