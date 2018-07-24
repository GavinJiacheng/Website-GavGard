<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0054)https://getbootstrap.com/docs/4.1/examples/jumbotron/# -->
<html lang="en" class="gr__getbootstrap_com">
  <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>GavGard</title>

    <!-- Bootstrap core CSS -->
    <link href="./Bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./Bootstrap/jumbotron.css" rel="stylesheet">
    <style>
      body {
        padding-top: 3.5rem;
      }
    </style>

  </head>


    <body data-gr-c-s-loaded="true">

      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="./index.jsp">GavGard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="./index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="introduction.jsp">Introduction</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="JavascrpitTest.jsp">Web Test</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Ragnarok.html">Game:Ragnarok</a>
            </li>
            <li class="nav-item dropdown active">
              <a class="nav-link dropdown-toggle" data-target="#" href="http://example.com/" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Community <span class="sr-only">(current)</span></a>
              <div class="dropdown-menu" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="chatroom.jsp">Chatroom</a>
                <a class="dropdown-item" href="Messageboard.jsp">Message Board</a>
              </div>
            </li>
          </ul>
          <a class="text-muted" href="#">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mx-3"><circle cx="10.5" cy="10.5" r="7.5"></circle><line x1="21" y1="21" x2="15.8" y2="15.8"></line></svg>
            </a>

            <%
            if(session.getAttribute("nickname") == null) {
              out.println("<a class='btn btn-primary mr-sm-2'  href='login.jsp'>Log in</a>");
              out.println("<a class='btn btn-primary mr-sm-2'  href='signup.jsp'>Sign up</a>");
            }
            else{
              out.println("<li class='nav-item dropdown'>");
              out.println("<a class='btn btn-primary mr-sm-2 dropdown-toggle' id='dropdown01' href='#' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>You</a>'");
              out.println("<div class='dropdown-menu' aria-labelledby='dropdown02'>");
              out.println("<a class='dropdown-item' href='/OutServlet'> Sign out</a>");
              out.println("</div></li>");
            }
            %>
        </div>
      </nav>

      <main role="main">


      <div class="container">
      </br></br>
      <h3 class="text-center" >CHAT ROOM </h3>
      <div class="row" style="padding-top:40px;">
          <div class="col-md-8">
              <div class="card border-primary"  style = "height: 40em;">
                  <div class="card-header bg-info">
                      RECENT CHAT HISTORY
                  </div>

                  <div class="card-body" style = "overflow: auto;">

                    <div id="message"></div>

                  </div>
                  <div class="card-footer">
                      <div class="input-group">
                                          <input id = "chat" type="text" class="form-control" placeholder="Enter Message" />
                                          <span class="input-group-btn">
                                              <button class="btn btn-info" type="button" onclick="send()">SEND</button>
                                          </span>
                                      </div>
                  </div>
              </div>
          </div>
          <div class="col-md-4">
                <div class="card border-primary"  style = "height: 40em;">
                  <div class="card-header">
                     ONLINE USERS
                  </div>
                  <div class="card-body" style = "overflow: auto;">
                      <div id="users">(this would be doen when I add JSon to the server)</div>
                    </div>
                  </div>

          </div>
      </div>
        </div>
  </br>

      </main>

      <footer class="container">
        <p>© GavGard 2018 by Jiacheng Xu.</p>
      </footer>

      <!-- Bootstrap core JavaScript
      ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
      <script src="./Bootstrap/bootstrap.min.js"></script>
      <script src="js/myjs.js"></script>
      <script src="js/chatroom.js"></script>

  </body></html>
