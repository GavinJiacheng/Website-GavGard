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
function send(name) {
	if (name == null) {
			var username = "GUEST";
	}else {
		var username = name;
	}
		var message = document.getElementById('chat').value;
		if (message != ""){
			websocket.send(username+": "+message);
			document.getElementById('chat').value = "";
		}
 }
