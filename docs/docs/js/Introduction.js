$(document).ready(function(){
  $("#a1").click(function(){
    $("a").removeClass("active");
    $(this).addClass("active");
    $("#contents").html("This website is a demonstration of HTML5/CSS3 and Javascript by Gavin Xu. </br> This website will contain all the information that I know about said scripting languages.");
    $("#titles").text("What is this website?")
  });

  $("#a2").click(function(){
    $("a").removeClass("active");
    $(this).addClass("active");
    $("#contents").html("Gavin Xu is the smartest and most handsome student at SFU. </br> Gavin is majoring in computing science.");
    $("#titles").text("Who is Gavin Xu?")
  });

  $("#a3").click(function(){
    $("a").removeClass("active");
    $(this).addClass("active");
    $("#contents").text("GavGard stands for 'Gavin's Garden' which is similar to the word 'Asgard' which means 'Garden of Æsir' (Æsir is the collective term for the gods in Norse mythology)");
    $("#titles").text("The meaning of 'GavGard'")
  });

  $("#a4").click(function(){
    $("a").removeClass("active");
    $(this).addClass("active");
    $("#contents").html("You know Ragnarok in Norse mythology, right? You don't know Norse mythology?  </br>So do you know Ragnarok in Marvel's commics and movies? You don't know? OMG please kill me.  </br> Anyway, as same as the Ragnarok happen in Asgard, there are some very very very bad guys want to attack Gavgard. Thor, 'Odin son', is coming to help us. The Ragnarok is a small game which is made by javascript.");
    $("#titles").text("What is the Ragnarok?")
  });

  $("#a5").click(function(){
    $("a").removeClass("active");
    $(this).addClass("active");
    $("#contents").text("I am going to test some javascript code for this website. My plan is to make a sign up/log in system that allows people to leave messages on the website, which needs some knowledge about python or PHP.");
    $("#titles").text("What will become of this website?")
  });
});
