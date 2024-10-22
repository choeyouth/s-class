package com.test.file.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	
	@Autowired
	private ServletContext servletContext; //application 객체
	
	@GetMapping(value="/add.do")
	public String add() {
		
		return "add";
	}

	@PostMapping(value="/addok.do")
	public String addok(Model model, String txt, MultipartFile attach, HttpServletRequest req) {
		
		System.out.println("txt: " + txt); //txt: 홍길동
		System.out.println(attach.getName()); //attach
		System.out.println(attach.getOriginalFilename()); //highlight.zip
		System.out.println(attach.getContentType()); //application/x-zip-compressed
 		System.out.println(attach.getSize()); //1654113
		System.out.println(attach.isEmpty()); //false
		
		//C:\class\code\spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileTest\resources\files
		//String path = req.getRealPath("/resource/files");
		String path = servletContext.getRealPath("resources/files");
		System.out.println(path);
		
		try {
			
			//파일명 중복 체크
			//1. 넘버링
			//2. 고유 식별자 생성
			// - 시간_파일명
			// - 난수_파일명 
			//3. UUID > Universally Unique ID > 네트워크 상에서 고유성이 보장되는 ID를 만드는 표준
			
			String filename = getFileName(attach.getOriginalFilename());
			
			//filename = System.nanoTime() + "_" + filename;
			
//			UUID uuid = UUID.randomUUID();
//			filename = uuid + "_" + filename;
			
			//임시 폴더에 업로드 파일 > 원하는 폴더로 이동
			File file = new File(path + "\\" + filename);
			attach.transferTo(file);
			
			model.addAttribute("txt", txt);
			model.addAttribute("filename", filename);
			model.addAttribute("orgfilename", attach.getOriginalFilename());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "addok";
	}

	private String getFileName(String filename) {

		//저장 폴더(files) > 파일명 중복(filename)?
		
		//filename = "test_1.txt"
		
		String path = servletContext.getRealPath("/resources/files");
		
		int n = 1; //인덱스 숫자
		int index = filename.lastIndexOf(".");
		
		String tempName = filename.substring(0, index); //"test"
		String tempExt = filename.substring(index); //".txt"
		
		while (true) {
		
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				//있다 > 중복 > 파일명 변경
				//test.txt > test_1.txt
				filename = tempName + "_" + n + tempExt; //test_1.txt
				n++;
			} else {
				//없다 > 사용 가능
				return filename;
			}
		}
	}
	
	@GetMapping(value = "/download.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String filename, String orgfilename, HttpServletRequest req) {

		String path = req.getRealPath("/resources/files");
		Resource resource = new FileSystemResource(path + "\\" + filename);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		// remove UUID
//		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		String resourceOriginalName = orgfilename;
		
		HttpHeaders headers = new HttpHeaders();
		try {

			String downloadName = null;

			if (userAgent.contains("Trident")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}


			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping(value="/multi_addok.do")
	public String multi_addok(Model model, String txt, MultipartFile[] attach) {
	
		String path = servletContext.getRealPath("/resources/files");
		System.out.println(path);
		
		for (MultipartFile file : attach) {
			try {
				String filename = getFileName(file.getOriginalFilename());
				file.transferTo(new File(path + "\\" + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("txt", txt);
		model.addAttribute("attach", attach);
		
		return "addok";
	}
	
}
