package com.gg.loginServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import com.gg.logindata.Userdata;
import com.gg.logindata.User;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request, response);
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verifyc  = request.getParameter("verifycode");
		String svc =(String) request.getSession().getAttribute("sessionverify");
		User newuser =new Userdata().searchUsername(username);
		if(!svc.equalsIgnoreCase(verifyc)){
			request.setAttribute("username", username);
			request.setAttribute("msge", "* verification code wrong.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(newuser ==null){
			request.setAttribute("username", username);
			request.setAttribute("msge", "* Username or Password wrong.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(newuser!=null&&!newuser.getUserpass().equals(password)){
			request.setAttribute("username", username);
			request.setAttribute("msge", "* Username or Password wrong.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(newuser.getUserpass().equals(password)){
			///cookie!!!
			HttpSession session = request.getSession();
			session.setAttribute("nickname", newuser.getnickname());
			Cookie cookie = new Cookie("username",username);
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			request.setAttribute("msg", "Username: "+username+", log in successfully!");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
}
