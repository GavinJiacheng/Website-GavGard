<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard-Jstest</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" >
  </head>
  <%@ include file="head.jsp" %>
        <div id = "txt">
          <div class = "box">
            <a id = "box1" class = "jstest" title = "t1"> test 1: Smart Gavin</a>
        </div>
        <div  class = "box">
          <a  id = "box2" class = "jstest" title = "t2"> test 2: Make a dynamic Thor</a>
        </div>
        <div  class = "box">
          <a  id = "box3" class = "jstest" title = "t3"> test 3: To be continued, something about jQuery</a>
        </div>
        <div  class = "box">
          <a  id = "box4" class = "jstest" title = "t4"> test 4: Nothing</a>
        </div>
      </div>
      <%@ include file="end.jsp" %>
    </div>
    <script src="js/myjs.js"></script>
    <script src="js/jstest.js"></script>
  </body>
</html>
