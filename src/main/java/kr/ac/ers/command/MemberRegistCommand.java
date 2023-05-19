package kr.ac.ers.command;


import kr.ac.ers.dto.MemberVO;
import lombok.Data;


@Data
public class MemberRegistCommand {
	
	private String id;
	private String name;
	private String birth;
	private String address[];
	private String phone[];
	private String gender;
	private String picture;
	private String wid;
	private String caution;
	private String afNo;
	private String memType;

	
	public MemberVO toMemberVO() {
		String phone = "";
		for(String data : this.phone) {
			phone += data;
		}
		
		String address = "";
		for(String data : this.address) {
			address += data;
		}
		
		//MemberVO setting
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(name);
		member.setBirth(birth);
		member.setAddress(address);
		member.setPhone(phone);
		member.setGender(gender);
		member.setPicture(picture);
		member.setWid(wid);
		member.setCaution(caution);
		member.setAfNo(afNo);
		member.setMemType(memType);
		
		return member;
	}
}
