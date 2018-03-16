<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard-Ragnarok</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" >
  </head>
  <body background="img/Background.jpg" onkeydown = "checkaction(event)" onkeyup = "stopmoving(event)">
    <%@ include file="specialhead.jsp" %>
        <div id = "txt" style="position: fixed" onkeydown = "checkaction(event)" onkeyup = "stopmoving(event)">
          <div class = "gamebox"   >
          <h2 style = "clear: left"> Ragnarok </h2>
          <p> please press 'x' to attack, and press directiion keys to move! </p>
            <img id = "Thor" src = "Ragnarok/viking/stance.gif"/>
          <p id="demo"></p>
          </div>
        </div>
      <%@ include file="end.jsp" %>
      <script src="js/myjs.js"></script>
      <script src="js/Ragnarok.js"></script>
    </body>
  </html>
