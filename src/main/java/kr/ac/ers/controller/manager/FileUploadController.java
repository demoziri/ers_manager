package kr.ac.ers.controller.manager;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.ers.command.MultipartCommand;

@Controller
public class FileUploadController {

	public void fileUploadForm() {
	}

	@PostMapping(value = "/multipartFile", produces = "text/plain;charset=utf-8")
	public ModelAndView uploadByMultipartFile(@RequestParam(defaultValue = "제목없음") String title,
			@RequestParam("file") MultipartFile multi, ModelAndView mnv) throws Exception {
		/* 파일 저장 폴더 설정 */
		String uploadPath = "c:\\upload\\file";
		/* 파일명 중복방지 */
		String filename = multi.getOriginalFilename();
		/* 파일 경로확인 및 생성 */
		File file = new File(uploadPath, filename);
		file.mkdir();

		/* 파일 저장 */
		multi.transferTo(file);

		// addObject:setAttribute -viewName:jsp
		mnv.addObject("title", title);
		mnv.addObject("originalFileName", multi.getOriginalFilename());
		mnv.addObject("uploadedFileName", file.getName());
		mnv.addObject("uploadPath", file.getAbsolutePath());
		mnv.setViewName("fileUploaded");
		return mnv;
	}

	@PostMapping(value = "/multipartHttpServletRequest", produces = "text/plain;charset=utf-8")
	public ModelAndView uploadByMultipartServletRequest(MultipartHttpServletRequest request, ModelAndView mnv)
			throws Exception {

		String title = request.getParameter("title");
		MultipartFile multi = request.getFile("file");

		mnv = uploadByMultipartFile(title, multi, mnv);

		return mnv;
	}

	@PostMapping(value = "/commandObject", produces = "text/plain;charset=utf-8")
	public ModelAndView uploadByCommandObject(MultipartCommand command, ModelAndView mnv) throws Exception {

		MultipartFile multi = command.getFile();
		String title = command.getTitle();

		mnv = uploadByMultipartFile(title, multi, mnv);

		return mnv;
	}

}
