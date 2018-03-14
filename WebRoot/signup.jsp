<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard-Log in</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" >
  </head>
    <%@ include file="head.jsp" %>
        <div id = "txt">
          <div class = "fullbox">
            <div class = "login">
            <h1>Sign up</h1>
            <form action="RegistServlet" method="post">
      		      Username：<br/><input type="text" name="username"><br/>
                            <font color="red" size="2"> ${msgu }</font><br/>
                Nickname: <br/><input type="text" name="nickname"><br/>
                            <font color="red" size="2"> ${msgn }</font><br/>
      		      Password：<br/><input type="password" name="password"><br/>
                            <font color="red" size="2"> ${msgp }</font><br/>
                Confirmation：<br/><input type="password" name="rpsw"><br/>
                            <font color="red" size="2"> ${msgr }</font><br/>
      	       <input type="submit" value="Sign up">
              </form>
         	  <font color="red" size="2"> ${msg }</font>
          </div>
        </div>
      </div>
      <%@ include file="end.jsp" %>
    <script src="js/myjs.js"></script>
    <script src="js/jstest.js"></script>
  </body>
</html>
