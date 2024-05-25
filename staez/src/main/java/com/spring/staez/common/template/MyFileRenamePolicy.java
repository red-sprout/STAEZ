package com.spring.staez.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class MyFileRenamePolicy {
	// 실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
	public static String saveFile(MultipartFile upfile, HttpSession session, String path) {
		String originName = upfile.getOriginalFilename();
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 수정된 첨부파일명
		String changeName = currentTime + ranNum + ext;
		
		// 첨부파일을 저장할 폴더의 물리적 경로(session)
		String savePath = session.getServletContext().getRealPath(path);
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
