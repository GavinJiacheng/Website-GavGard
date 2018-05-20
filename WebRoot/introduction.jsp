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

    <title>GavGard-introduction</title>

    <!-- Bootstrap core CSS -->
    <link href="./Bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="./Bootstrap/dashboard.css" rel="stylesheet">
    <style>
      body {
        padding-top: 4rem;
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
          <li class="nav-item active">
            <a class="nav-link" href="introduction.jsp">Introduction <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="JavascrpitTest.jsp">Web Test</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Ragnarok.jsp">Game:Ragnarok</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-target="#" href="http://example.com/" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Community</a>
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

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar" style = "margin-top: 10px">
              <div class="sidebar-sticky">
                <ul class="nav flex-column mb-2">
                  <li class="nav-item">
                    <a class="nav-link active" id= "a1" style = "font-size:110%" href="javascript:void(0);" onclick="js_method()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z">
                          </path>
                            <polyline points="14 2 14 8 20 8">
                              </polyline>
                                <line x1="16" y1="13" x2="8" y2="13"></line>
                                  <line x1="16" y1="17" x2="8" y2="17"></line>
                                    <polyline points="10 9 9 9 8 9"></polyline></svg>
                      What is this website?
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id= "a2" style = "font-size:110%" href="javascript:void(0);" onclick="js_method()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                      Who is Gavin Xu?
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id= "a3" style = "font-size:110%" href="javascript:void(0);" onclick="js_method()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                      The meaning of 'GavGard'
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id= "a4" style = "font-size:110%" href="javascript:void(0);" onclick="js_method()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                      What is the Ragnarok?
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id= "a5" style = "font-size:110%" href="javascript:void(0);" onclick="js_method()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                      What will become of this website?
                    </a>
                  </li>
                </ul>
              </div>
            </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="padding-top: 3px">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-1 pb-2 mb-3 border-bottom">
            <h1 class="h2" id = "titles">What is this website?</h1>
          </div>
          <p id = "contents" style = "font-size:150%">This website is a demonstration of HTML5/CSS3 and Javascript by Gavin Xu.
          </br> This website will contain all the information that I know about said scripting languages.</p>
        </main>

      </div>
    </div>

    <nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
              <p style="color:white">© GavGard 2018 by Jiacheng Xu.</p>
    </nav>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="./js/Introduction.js"></script>
    <script src="./Bootstrap/bootstrap.min.js"></script>


</body></html>
