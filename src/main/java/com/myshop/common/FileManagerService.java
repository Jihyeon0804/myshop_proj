package com.myshop.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 게시된 이미지를 저장할 폴더의 경로
	// workspace/images/userId_ms 형태로 저장할 것임
//	public static final String FILE_UPLOAD_PATH = "D:\\김지현\\project\\workspace\\images/";
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\cam08\\Desktop\\project\\workspace\\images/";

	public String saveFile(int userId, MultipartFile file) {
		// 폴더명 지정
		// userId_게시된시간(ms) 형태
		// TODO : userId -> user 테이블의 loginId로 바꾸기
		String directoryName = userId + "_" + System.currentTimeMillis();

		// 파일의 경로(FILE_UPLOAD_PATH 지정 시 마지막에 / 를 붙여주었으므로 바로 directoryName을 이어 붙여주면 됨
		// D:\\김지현\\project\\workspace\\images/userId_1698922577076
		String filePath = FILE_UPLOAD_PATH + directoryName;

		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			// 폴더 생성 실패 시 이미지 경로 null 반환
			return null;
		}

		try {
			// 이미지를 byte배열로 변환하여 저장
			byte[] bytes = file.getBytes();
			// 디렉토리 경로 + 사용자가 올린 파일명(확장자 포함)
			Path path = Paths.get(filePath + "/" + file.getOriginalFilename());
			// 해당 경로에 byte로 변환된 이미지를 저장
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			// 저장 실패 시 null 반환
			return null;
		}

		// 파일 업로드 성공 시 웹 이미지 url path 리턴
		// 주소는 이렇게 될 것이다.(예언)
		// /images/1_1698942335689/the-cat-8317334_640.jpg
		return "/images/" + directoryName + "/" + file.getOriginalFilename();

	}

}
