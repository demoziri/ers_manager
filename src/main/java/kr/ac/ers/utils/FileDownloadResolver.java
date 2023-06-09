package kr.ac.ers.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FileDownloadResolver {

	public static void sendFile(String fileName, String savedPath, 
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 보낼 파일 설정.
		String filePath = savedPath + File.separator + fileName;
		File downloadFile = new File(filePath);
		FileInputStream inStream = new FileInputStream(downloadFile);

		// header 세팅
		ServletContext context = request.getServletContext();
		String mimeType = context.getMimeType(filePath);
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}

		// response 수정.
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// 한글깨짐 방지 : ISO-8859-1
		String headerKey = "Content-Disposition";
		String sendFileName = 
				MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");
		String header = request.getHeader("User-Agent");
		if (header.contains("MSIE")) {
			sendFileName = URLEncoder.encode(sendFileName, "UTF-8");
		} else {
			sendFileName = new String(sendFileName.getBytes("utf-8"), "ISO-8859-1");
		}

		String headerValue = String.format("attachment; filename=\"%s\"", sendFileName);
		response.setHeader(headerKey, headerValue);

		// 파일 내보내기
		OutputStream outStream = response.getOutputStream();
		try {
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
		} finally {

			outStream.close();
			inStream.close();
		}
	}
}





