<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.gg.Messagedata.*"%>
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
        <div class = "fullbox" style=" background-color: #33D4FF;">
          <form action="MessageBoardServlet" method="post">
              Message：<font color="red" size="2">${errormsg}</font> <br/>
              <input type="text"  style="width: 50%;" name="title"><br/>
              <textarea name="message" style="width: 50%;" rows="6"></textarea><br/>
              <input type="submit" value="Leave the message">
            </form>
        </div>
        <%
        Messagedata messagegetter = new Messagedata();
        ArrayList<Messagess> allmessagess = messagegetter.getallmessage();
        if (allmessagess != null && allmessagess.size() != 0){
          for (Messagess item : allmessagess) {
            out.println("<div class = 'fullbox'>");
            out.println("<h3>"+item.getTitle()+"</h2>");
            out.println("<p> <font size = '3'> From "+ item.getName()+ " in " + item.getTime() + "</font></p>");
            out.println("<p>"+ item.getMessage()+ "</p>");
            out.println("</div>");
          }
        }
        %>
      </div>
      <%@ include file="end.jsp" %>
    </div>
    <script src="js/myjs.js"></script>
    <script src="js/jstest.js"></script>
  </body>
</html>
