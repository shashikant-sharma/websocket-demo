<!DOCTYPE html>
<html>
<head>
    <title>Calculator App Using Spring 4 WebSocket</title>
    <script src="js/sockjs-0.3.4.js"></script>
    <script src="js/stomp.js"></script>
    <script type="text/javascript">
	
        var stompClient = null; 

        function setConnected(connected) {
            document.getElementById('messageDiv').style.visibility = connected ? 'visible' : 'hidden';
            document.getElementById('msgThread').innerHTML = '';
        }
        window.onload= function(){
        	connect()
        }

        function connect() {
            var socket = new SockJS('/messages');
			stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                setConnected(true);
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/messages', function(calResult){
                	showResult(calResult.body);
                });
            });
        }


        function sendNum() {
            var message = document.getElementById('message').value;
            stompClient.send("/app/messages", {},message);
        }

        function showResult(message) {
            var response = document.getElementById('msgThread');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }
    </script>
</head>
<body>
<noscript><h2>Enable Java script and reload this page to run Websocket Demo</h2></noscript>
<h1>Chat Application</h1>
<div>
    <div id="messageDiv">
        <label>Message:</label><textarea id="message" ></textarea></<br/>
        <button id="sendMessage" onclick="sendNum();">Send Message</button>
        <p id="msgThread"></p>
    </div>
</div>
</body>
</html>