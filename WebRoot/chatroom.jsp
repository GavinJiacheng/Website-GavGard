<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" >
    <title>GavGard-Log in</title>
  </head>
  <%@ include file="head.jsp" %>
        <div id = "txt">
            <div class = "fullbox">
              <h1 style="  left: 50%;top:3%; transform: translateX(-50%); position:absolute; font-size:40px;"> Chatroom </h1>
              <div id="window" >
                <div id="message"></div>
              </div>
              <div id="window2">
                <br/>
              <textarea id="chat" rows="6" cols="100"></textarea><br/>
              <button onclick="send()">Send message</button><br/><br/>
              </div>
            </div>
        </div>
    <%@ include file="end.jsp" %>
    <script src="js/myjs.js"></script>
    <script type="text/javascript">
        var websocket = new WebSocket("ws://localhost:8080/chatroom");
        websocket.onerror = function () {
             setMessageInnerHTML("Error happen, cannot connect to the server.");
        };
        websocket.onopen = function () {
             setMessageInnerHTML("Connect successfully!");
         }
         websocket.onmessage = function (event) {
             setMessageInnerHTML(event.data);
        }
         websocket.onclose = function () {
            setMessageInnerHTML("No connection.");
         }
         function setMessageInnerHTML(innerHTML) {
            document.getElementById('message').innerHTML += innerHTML + '<br/>';
        }
         function send() {
            var message = document.getElementById('chat').value;
            if (message != ""){
              websocket.send(message);
              document.getElementById('chat').value = "";
            }
         }
    </script>
  </body>
</html>
