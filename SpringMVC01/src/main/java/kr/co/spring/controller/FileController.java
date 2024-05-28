package kr.co.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {
	@RequestMapping("/upload.do")
	public String upload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, Model model)
			throws Exception {
		// MultipartHttpServletRequest -->>첨부파일
		String UPLOAD_DIR = "file_repo";
		String uploadPath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

		Map map = new HashMap();
		/*
		 * String id=multipartRequest.getParameter("id"); String
		 * name=multipartRequest.getParameter("name");
		 */
		Enumeration<String> e = multipartRequest.getParameterNames();// Enumeration열거형
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			String value = multipartRequest.getParameter("name");
			System.out.println("#####" + name + ":" + value);// #####name:입력이름, #####id:입력이름 -->> 파라메터로 넘어온 것이 이름
			map.put(name, value);
		}
		// 파라메터로 넘어온 이름과 실제 이름이 다르다
		//Iterator<String> it = multipartRequest.getFileNames();// getFileNames : 파일이름이 아니라 파라메터를 읽어옴
		 Iterator fileNameIter = multipartRequest.getFileNames(); 
		 
		List<String> fileList = new ArrayList<>();
		while (fileNameIter.hasNext()) {
			String paramName = (String)fileNameIter.next();
			System.out.println("#######paramName :" + paramName);// paramName :file1
			MultipartFile mFile = multipartRequest.getFile(paramName);// MultipartFile ->파일(이름 타입 크기);
			String f_name = mFile.getOriginalFilename();// 실제 업로드 된 파일이름
			System.out.println("업로드 파일이름 :" + f_name);
			fileList.add(f_name);// 업로드 할 파일 목록
			File file = new File(uploadPath + "\\" + paramName);// 저장위치+파일이름
			// 파일 저장경로가 있는지 확인
			if (mFile.getSize() != 0) {// 파일이 있다면
				if (!file.exists()) {// 저장위치+파일이름이 없다면
					if (file.getParentFile().mkdir()) {// 상위디렉토리로 빠져나가 디렉토리 생성
						file.createNewFile();// 저장위치+파일이름으로 임시로 파일 생성
					}
				}
				mFile.transferTo(new File(uploadPath + "\\" + f_name));// 여기에서 파일업로드가 됨
			}
		}
		
		map.put("fileList", fileList);
		model.addAttribute("map", map);
		System.out.println("이동");
		return "result"; //이동할 페이지 
	}
	
	
	
	@RequestMapping("/download.do")
	public void download(String filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println(filename);
		//실제 물리 경로 
		String UPLOAD_DIR="file_repo";
		String uploadPath=request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;//폴더까지 경로
		
		//파일객체 생성
		File f=new File(uploadPath+"\\"+filename);// 폴더까지 경로+파일이름.확장자
		try {
			filename=URLEncoder.encode(filename, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//한글인코딩
		filename=filename.replace("+", " ");//크롬의 경우 공백이 있을 시 + 로 표현됨 이것을 다시 공백으로 변경하는 것
		//다운로드 준비(기본적인 패턴): 서버에서 클라이언트에게 다운로드 준비를 시키는 부분
		response.setContentLength((int)f.length());//파일크기 확인
		response.setContentType("application/x-msdownload;charset=utf-8");//데이터 타입 확인
		response.setHeader("Content-Disposition", "attachment;filename="+filename+";");//다운로드시 뜨는 화면
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		//실제 다운로드
		FileInputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(f);
			out=response.getOutputStream();
			byte[] buffer=new byte[1024];
			while(true) {
				int count=in.read(buffer);
				if(count==-1) {
					break;
				}
				out.write(buffer, 0, count);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//파일읽기 준비
		
		
		in.close();
		out.close();
		
		
		
	}

		
		
		
	
}
