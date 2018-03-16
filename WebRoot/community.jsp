<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard-Community</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" >
  </head>
  <%@ include file="head.jsp" %>
        <div id = "txt">
          <div class = "box">
            <a href = "chatroom.jsp" title = "Chatroom" style = " font-size:35px;"> Chatroom </a>
        </div>
        <div  class = "box">
          <a href = "Messageboard.jsp" title = "Chatroom" style = " font-size:35px;"> Message Board </a>
        </div>
      </div>
      <%@ include file="end.jsp" %>
    </div>
    <script src="js/myjs.js"></script>
    <script src="js/jstest.js"></script>
  </body>
</html>
