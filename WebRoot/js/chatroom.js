var websocket = new WebSocket("ws://159.89.124.219//chatroom");
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
