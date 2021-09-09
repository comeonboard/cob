package com.bitcamp.cob.cafe.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafeImg;

@Service
public class CafeInfoService {

	@Autowired
	private SqlSessionTemplate template;
	
	final String UPLOAD_URI = "/uploadfile";
	
	public Cafe getCafeInfo(int idx) {
		return template.getMapper(CafeDao.class).getCafeInfo(idx);		
	}

	public int cafeReg(Cafe cafe, CafeImg cafeImg, HttpServletRequest request) {

		int resultCnt = 0;
		File newFile = null;

		try {
			// 2. dao 저장
			// 결과값과 idx값 저장
			resultCnt = template.getMapper(CafeDao.class).cafeReg(cafe);
			System.out.println("새롭게 등록된 idx => " + cafe.getCafeIdx());
			
			// 1. 파일 저장
			if (cafeImg.getCafeThumbnail() != null && !cafeImg.getCafeThumbnail().isEmpty()) {

				File newDir = mkDir(cafe, request);

				// 파일 저장시에 파일 이름이 같으면 덮어쓴다 -> 회원별 고유한 파일 이름을 만들자!!, 새로운 파일이름에 확장자 추가
				// 카페이름.thumbnail.확장자
				String newFileName = "thumbnail." + chkFileType(cafeImg.getCafeThumbnail());
				
				// 새로운 File 객체
				newFile = new File(newDir, newFileName);
				cafeImg.getCafeThumbnail().transferTo(newFile);
				System.out.println("썸네일 : "+newFileName);
				// cafeImg.setMemberphoto(newFileName); 데이터베이스에 저장할 파일의 이름 설정
				
			} 
			
			if (cafeImg.getCafeImg() != null && cafeImg.getCafeImg().length != 0) {

				File newDir = mkDir(cafe, request);	
				
				for(int i=0; i<cafeImg.getCafeImg().length; i++) {
					// 파일 저장시에 파일 이름이 같으면 덮어쓴다 -> 회원별 고유한 파일 이름을 만들자!!, 새로운 파일이름에 확장자 추가
					// 카페이름.thumbnail.확장자
					String newFileName = i +".img." +chkFileType(cafeImg.getCafeThumbnail());
					
					// 새로운 File 객체
					newFile = new File(newDir, newFileName);
					cafeImg.getCafeImg()[i].transferTo(newFile);
					System.out.println("이미지 : " + newFileName);
					// cafeImg.setMemberphoto(newFileName); 데이터베이스에 저장할 파일의 이름 설정
				}
			}	
//				} else {
//				//member.setMemberphoto("photo.png");
//			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// DB 예외 발생 시 -> 저장된 파일을 삭제
			if (newFile != null && newFile.exists()) {
				newFile.delete();
			}
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return resultCnt;
	}

	// 파일의 ContentType 과 파일 확장자를 체크
	private String chkFileType(MultipartFile file) throws Exception {
		String extension = "";

		// 업로드 파일의 contentType
		String contentType = file.getContentType();
		if (!(contentType.equals("image/jpeg") ||contentType.equals("image/jpg") || contentType.equals("image/png") || contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}

		// 파일 확장자 구하기
		String fileName = file.getOriginalFilename();

		// String[] java.lang.String.split(String regex)
		// : 정규식의 패턴 문자열을 전달해야하기 때문에 \\. 으로 처리
		String[] nameTokens = fileName.split("\\."); /// tet.mini2.jpg PNG png

		// 토큰의 마지막 index의 문자열을 가져옴 : 배열의 개수-1
		extension = nameTokens[nameTokens.length - 1].toLowerCase();

		// 이미지 파일 이외의 파일 업로드 금지
		// 파일 확장자 체크
		if (!(extension.equals("jpg") || extension.equals("png") || extension.equals("gif"))) {
			throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
		}

		return extension;
	}
	
	// 파일 업로드시 카페idx와 카페명으로 폴더 생성
	private File mkDir(Cafe cafe,  HttpServletRequest request) {
		
		// 새로운 저장 폴더 : File
		//File newDir = new File(request.getSession().getServletContext().getRealPath(UPLOAD_URI+"/"+cafe.getCafeIdx()+"."+cafe.getCafeName()));
		File newDir = new File(request.getSession().getServletContext().getRealPath(UPLOAD_URI+"/87."+cafe.getCafeName()));

		// 폴더가 있다면 삭제
		if(newDir.exists()) {
			deleteDir(newDir);
		}
		
		// 카페별 폴더 생성
		if (!newDir.exists()) {
			newDir.mkdir();
			System.out.println("카페 폴더를 생성했습니다.");
		}
		return newDir;
	}
	
	// 예외 발생시 폴더내 파일 삭제
	private void deleteDir(File newDir) {

		while(newDir.exists()) {
			//File[] folder_list = newDir.listFiles(); //파일리스트 얻어오기
			File[] folder_list = newDir.listFiles() ; //파일리스트 얻어오기
			System.out.println("folder_list : "+folder_list.toString());
			for (int j = 0; j < folder_list.length; j++) {
				folder_list[j].delete(); //파일 삭제 
				System.out.println("파일이 삭제되었습니다.");		
			}
					
			if(folder_list.length == 0 && newDir.isDirectory()){ 
				newDir.delete(); //대상폴더 삭제
				System.out.println("폴더가 삭제되었습니다.");
			}
	    }	
	}
	
	

}