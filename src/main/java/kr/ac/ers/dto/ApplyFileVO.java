package kr.ac.ers.dto;

import java.util.Date;

import lombok.Data;


@Data
public class ApplyFileVO {
	private int afNo;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private int id;
	private String manId;
	private Date regDate;
	
	
	
}
