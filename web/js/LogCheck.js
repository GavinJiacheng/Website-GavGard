function getXmlHTTP(){
	var xmlhttp;
	if (window.XMLHttpRequest)
  {
      //  IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
  }
  else
  {
      // IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
	return xmlhttp;
}

var nickname = "";
var UserID = -1;

window.onload=function(){
	var request = getXmlHTTP();
	request.onreadystatechange = function () {
	    if (request.readyState === 4) {
	    		if (request.status === 200) {
	    				var responseJSON = JSON.parse(request.responseText);
	    				if (responseJSON.Logged == true){
								nickname = responseJSON.Nickname;
								UserID = responseJSON.UserID;
	    					$('#log_check').html(
	    						"<li class='nav-item dropdown'>" +
	    						"<a class='btn btn-primary mr-sm-2 dropdown-toggle' id='dropdown01' href='#' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>You</a>'" +
	    						"<div class='dropdown-menu' aria-labelledby='dropdown02'>" +
	    						"<a class='dropdown-item' href='/OutServlet'> Sign out</a>" +
	    						"</div></li>"
	    					);
	    				}else{
	    					$('#log_check').html(
	    						"<a class='btn btn-primary mr-sm-2'  href='login.jsp'>Log in</a>" +
	    						"<a class='btn btn-primary mr-sm-2'  href='signup.jsp'>Sign up</a>"
	    					);
	    				}
	    		} else {
	    				//return fail(request.status);
	    		}
	    } //else {
	    //}
		}
	request.open('GET', '/CheckLogServlet');
	request.send();

}
