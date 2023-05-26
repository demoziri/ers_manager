package kr.ac.ers.command;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MultipartCommand {

	private String title;
	private MultipartFile file;

}
