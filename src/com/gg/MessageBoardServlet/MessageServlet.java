package com.gg.MessageBoardServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gg.Messagedata.Messagess;
import com.gg.Messagedata.Messagedata;


public class MessageServlet extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("UTF-8");
        response.setContentType("UTF-8");
        String title=request.getParameter("title");
        String message=request.getParameter("message");
        if(message==null||message.trim().isEmpty()){
            request.setAttribute("errormsg", "The message cannot be empty!");
            request.getRequestDispatcher("/Messageboard.jsp").forward(request, response);
            return;
        }
        else if (message.length() > 1024){
            request.setAttribute("errormsg", "The length of message must be less than 1024 characters!");
            request.getRequestDispatcher("/Messageboard.jsp").forward(request, response);
            return;
        }
        if (title.length() > 32){
            request.setAttribute("errormsg", "The length of message must be less than 32 characters!");
            request.getRequestDispatcher("/Messageboard.jsp").forward(request, response);
            return;
        }
        String author;
        if (request.getSession().getAttribute("nickname") == null){
            request.setAttribute("errormsg", "Please log in to leave messages!");
            request.getRequestDispatcher("/Messageboard.jsp").forward(request, response);
            return;
        }
        else{
            author = (String) request.getSession().getAttribute("nickname");
        }
        java.util.Date now = new java.util.Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        Messagess md =new Messagess();
        md.setTime(time);
        md.setName(author);
        md.setTitle(title);
        md.setMessage(message);
        Messagedata Messaged = new Messagedata();
        Messaged.addInfo(md);
        response.sendRedirect("/Messageboard.jsp") ;
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request,response);
    }
}
