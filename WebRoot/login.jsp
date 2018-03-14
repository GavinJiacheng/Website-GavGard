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
          <h3>Log in</h3>
          <center>
          <form action="LoginServlet" method="post">
            <table class = "login">
              <tr>
                <td width="66" align="right"><font size="3">Username：</font></td>
                <td colspan="2"><input type="text" name="username" value="${username }"/></td>
              </tr>
              <tr>
                <td align="right"><font size="3">Password：</font></td>
                <td colspan="2"><input type="password" name="password" /></td>
              </tr>
              <tr>
                <td align="right"><font size="3">Verification code：</font></td>
                  <td width="110px" valign="middle"><input type="text" name="verifycode" /></td>
                  <td width="90px" valign="middle"><img src="VerifyCodeServlet" id="verify" onclick="document.getElementById('verify').src='VerifyCodeServlet?'+Math.random();"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2" align="center"><input type="submit" value="Login" /></td>
              </tr>
            </table>
          </form>
          <td><font color="red" size="3"> ${msge }</font></td><br/>
          <td><font color="blue" size="4"> ${msg }</font></td><br/>
        </center>
          <a href="signup.jsp" style="margin-left: 80px;"><font size="2"><i>Sign up here</i></font></a>
        </div>
      </div>
      <%@ include file="end.jsp" %>
    <script src="js/myjs.js"></script>
    <script src="js/jstest.js"></script>
  </body>
</html>
