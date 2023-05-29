package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ApplyFileVO {
	private int afno;
	private String uploadpath;
	private String filename;
	private String filetype;
	private String id;
	private String manid;
	private Date regDate;
	
	
	
}
