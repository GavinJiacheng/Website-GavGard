package com.gg.loginServlet;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gg.utils.VerifyCode;


public class VerifyCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage(90,30);
		request.getSession().setAttribute("sessionverify", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
