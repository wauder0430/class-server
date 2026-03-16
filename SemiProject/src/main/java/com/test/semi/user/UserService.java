package com.test.semi.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.semi.model.UserDao;
import com.test.semi.model.UserDto;

public class UserService {

	public int register(HttpServletRequest req) {
		try {
			
			// req.setCharacterEncoding("UTF-8");
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getServletContext().getRealPath("/asset/pic"), //servletContext > application
										1024 * 1024 * 10,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			
			System.out.println(req.getServletContext().getRealPath("/asset/pic"));
			
			String id = multi.getParameter("id");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String attach = multi.getFilesystemName("attach");
			String intro = multi.getParameter("intro");
			
			//System.out.println(id);
			//System.out.println(name);
			//System.out.println(attach);
			
			UserDto dto = new UserDto();
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPic(attach);
			dto.setIntro(intro);
			
			UserDao dao = new UserDao();
			
			int result = dao.register(dto);
			
			
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// Login 서블릿이 id/pw를 줄테니 인증 처리 좀 해주세요. 
	public UserDto login(UserDto dto) {
		// 1. DB작업 > select 
		// 2. 결과 > 인증 티켓 발급
		UserDao dao = new UserDao();
		
		UserDto result = dao.login(dto);
		
		return result;
		
	}

	// Info 서블릿이 id를 줄테니 그 유저의 모든 내용을 돌려주세요.
	public UserDto info(String id) {
		
		UserDao dao = new UserDao();
		
		UserDto dto = dao.info(id); 
		
		return dto;
	}

}
