package com.gg.loginServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gg.logindata.Userdata;
import com.gg.logindata.User;

public class RegistServlet extends HttpServlet {
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
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String rpsw = request.getParameter("rpsw");
		if(username==null||username.trim().isEmpty()){
			request.setAttribute("msgu", "The username cannot be empty!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		else if (username.contains(" ")){
			request.setAttribute("msgu", "The username cannot contain space!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		else if (username.length() > 12){
			request.setAttribute("msgu", "The length of username must be less than 12 characters!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		if(nickname==null||nickname.trim().isEmpty()){
			request.setAttribute("msgn", "The nickname cannot be empty!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		if(password==null||password.trim().isEmpty()){
			request.setAttribute("msgp", "password cannot be empty!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		else if (password.length() > 16){
			request.setAttribute("msgp", "The length of password must be less than 16 characters!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		if(!password.equals(rpsw)){
			request.setAttribute("msgr", "The passwords are not same! password: "+ password + "rpsw: " + rpsw);
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		Userdata userdao = new Userdata();
		User newuser = new User();
		newuser.setUsername(username);
		newuser.setnickname(nickname);
		newuser.setUserpass(password);
		if (userdao.checkusername(newuser)){
			request.setAttribute("msgu", "The Username is already exist!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		if (userdao.checknickname(newuser)){
			request.setAttribute("msgn", "The nickname is already exist!");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		userdao.addUser(newuser);
		request.setAttribute("msg", "Register successfully! Please log in!");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

}
