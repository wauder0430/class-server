package com.test.semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// Servlet, JSP > 톰캣이 관리
// Filter > 톰캣이 관리
public class EncodingFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// System.out.println("필터가 생성되었습니다.");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// System.out.println("필터가 동작합니다.");

		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 마지막 > 다음 필터 or 서블릿 호출
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// System.out.println("필터가 소멸되었습니다.");
	}
	
}
