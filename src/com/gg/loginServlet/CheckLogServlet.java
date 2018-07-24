package com.gg.loginServlet;

import java.io.IOException;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import com.gg.logindata.Userdata;
import com.gg.logindata.User;

import javax.json.Json;
import javax.json.JsonReader;

public class CheckLogServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        JsonObjectBuilder checkLog = Json.createObjectBuilder();
        checkLog.add("Type", "Log_check");
        if(session.getAttribute("nickname") == null) {
            checkLog.add("Logged", false);
            checkLog.add("Nickname", "");
        }else {
            checkLog.add("Logged", true);
            checkLog.add("Nickname", (String)session.getAttribute("nickname"));
            checkLog.add("UserID", (String)session.getAttribute("id"));
        }
        String result = checkLog.build().toString();
        System.out.println(result);
        response.getWriter().print(result);
    }
}