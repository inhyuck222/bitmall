package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.admin.AdminUserService;
import com.cafe24.bitmall.vo.UserVo;

public class AuthAdminLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserVo user = new UserVo();
		user.setEmail(email);
		user.setPassword(password);
		
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		AdminUserService adminUserService = ac.getBean(AdminUserService.class);
		UserVo adminUser = adminUserService.adminUserLogin(user);
		
		if(adminUser == null) {
			request.setAttribute("result", "fail");
			request.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(request, response);
			return false;
		}
		
		HttpSession session = request.getSession();		
		session.setAttribute("adminUser", adminUser);
		
		response.sendRedirect(request.getContextPath()+"/admin/product");
		
		return false;
	}
	

}
