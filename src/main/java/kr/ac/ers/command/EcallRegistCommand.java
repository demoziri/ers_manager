package kr.ac.ers.command;

import kr.ac.ers.dto.EcallVO;
import lombok.Data;

@Data
public class EcallRegistCommand {

	private int c_Num;
	private String e_Name;
	private String relation;
	private String e_Phone[];
	private String id;
	

	public void setCNum(int c_Num) {
		this.c_Num = c_Num;
	}
	public void setCNum(String c_Num) {
		this.c_Num = Integer.parseInt(c_Num);
	}
	
	
	public EcallVO toEcallVO() {
			
		EcallVO ecall = new EcallVO();
		
		System.out.println("relation ? " + this.relation);
		ecall.setCnum(c_Num);
		ecall.setName(e_Name);
		ecall.setRelation(relation);
		ecall.setPhone(e_Phone[0]+"-"+e_Phone[1]+"-"+e_Phone[2]);
		ecall.setId(id);
		
		return ecall;
	}
		
}
