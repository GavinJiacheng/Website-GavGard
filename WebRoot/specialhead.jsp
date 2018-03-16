<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div id = "container">
    <div id = "page">
      <header>
        <div id = "header-top">
          <div id = "header-top-right">
              <ul class = "horizontal">
                <li class = "right cwhite menushow"> <a href = "https://github.com/Jiachenggavin" title = "Gavin's Git"> Gavin's Git </a>
                </li>
                <%
                if(session.getAttribute("nickname") == null) {
                  out.println("<li class = 'right cwhite'> <a href = 'signup.jsp' title = 'Sign up'> Sign up </a>");
                  out.println("</li>");
                  out.println("<li class = 'right cwhite'> <a href = 'login.jsp' title = 'Log in'> Log in </a>");
                  out.println("</li>");
                }
                else{
                  out.println("<li class = 'right cwhite menushow'> <a href = 'index.jsp' title = 'Userinfo'> Welcome! " + session.getAttribute("nickname") + "   </a>");
                  out.println("<ul>");
                  out.println("<li><a href='/OutServlet'>Sign out</a></li>");
                  out.println("</ul>");
                  out.println("</li>");
                }
                %>
              </ul>
          </div>
        </div>
        <div id = "header-middle">
            <a href = "./index.jsp" title = "home" ><img src="./img/logo.png"/> </a>
            <form id = "googlesearch" class = "right" method="get" action="https://www.google.ca/search?q=" target="_blank">
              Search Google:
                <input type="text" name="q" maxlength="255" placeholder="Search in Google">
                <input type = "submit", value="Search">
            </form>
        </div>
        <div class = "header-middle">
        <div id = "header-bottom">
          <ul class = "horizontal">
            <li class = "bottomleft "><a href = "introduction.jsp" title = "INTRODUCTION"> INTRODUCTION </a>
            <li class = "bottomleft "><a href = "JavascrpitTest.jsp" title = "JAVASCRIPT EXAMPLE"> JAVASCRIPT EXAMPLE </a>
            <li class = "bottomleft "><a href = "Ragnarok.jsp" title = "RAGNAROK"> RAGNAROK </a>
            <li class = "bottomleft "><a href = "community.jsp" title = "COMMUNITY"> COMMUNITY </a>
            </ul>
          </div>
        </div>
      </header>
