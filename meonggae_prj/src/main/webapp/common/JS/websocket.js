/**
 * 
 */
 let websocket;
 
 function connect() {
 
 var wsUrl = "ws://${pageContext.request.serverName}:${pageContext.request.contextPath}/meonggae_talk/talk_page.do";
 
 websocket = new WebSocket(wsUrl);
 
 websocket.on
 
 }