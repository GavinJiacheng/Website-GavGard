<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GavGard-Introduction</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css" />
    <script>
    function web() {
    document.getElementById("intr").innerHTML = "This website is a demonstration of HTML5/CSS3 and Javascript by Gavin Xu. This website will contain all the information that I know about said scripting languages.";
    }
    function Xu() {
    document.getElementById("intr").innerHTML = "Gavin Xu is the smartest and most handsome student at SFU. Gavin is majoring in computing science.";
    }
    function Meaning() {
    document.getElementById("intr").innerHTML = "GavGard stands for 'Gavin's Garden' which is similar to the word 'Asgard' which means 'Garden of Æsir' (Æsir is the collective term for the gods in Norse mythology)";
    }
    function cites() {
    document.getElementById("intr").innerHTML = "The background picture shows Constantinople, the 'queen of cities'. </br> </br> The background music is 'The Ring Goes South' which is the music from the movie 'The Lord Of Rings'.";
    }
    function future() {
    document.getElementById("intr").innerHTML = "I am going to test some javascript code for this website. My plan is to make a sign up/log in system that allows people to leave messages on the website, which needs some knowledge about python or PHP.";
    }
    function Ragnarok() {
    document.getElementById("intr").innerHTML = "You know Ragnarok in Norse mythology, right? You don't know Norse mythology? So do you know Ragnarok in Marvel's commics and movies? You don't know? OMG please kill me. </br> </br> Anyway, as same as the Ragnarok happen in Asgard, there are some very very very bad guys want to attack Gavgard. Thor, 'Odin son', is coming to help us. The Ragnarok is a small game which is made by javascript.";
    }
    </script>
  </head>
  <%@ include file="head.jsp" %>
        <div id = "txt" class = "introduction">
          <nav id = "leftside">
            <p class = "leftlist" onclick="web()"> What is this website? </p> <br>
            <p class = "leftlist" onclick="Xu()"> Who is Gavin Xu? </p> <br>
            <p class = "leftlist" onclick="Meaning()"> The meaning of 'GavGard' </p> <br>
            <p class = "leftlist" onclick="Ragnarok()"> What is the Ragnarok? </p> <br>
            <p class = "leftlist" onclick="cites()"> Music and pictures? </p> <br>
            <p class = "leftlist" onclick="future()"> What will become of this website?  </p> <br>
          </nav>
          <section id = "content">
            <p id= "intr">
                Which part of this website are you curious about? Please select an option from the menu on the left.
            </p>
          </section>
        </div>
      <%@ include file="end.jsp" %>
      <script src="js/myjs.js"></script>
  </body>
</html>
