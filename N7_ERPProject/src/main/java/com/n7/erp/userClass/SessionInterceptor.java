package com.n7.erp.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandler call");
		if(request.getSession().getAttribute("id")==null) {
			response.sendRedirect("./"); //home.jsp
		}
		System.out.println(request.getServletPath().toString().substring(0, 2));
		if(request.getServletPath().toString().substring(0, 3).equals("/hr")) {
			if(request.getSession().getAttribute("auth").toString().equals("0")){
				response.sendRedirect("/erp/myInfo/myInfo");
			}
		}
		return true;  //controller 진입가능
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle call");
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
