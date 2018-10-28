package com.geekscoder.websocket.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.geekscoder.websocket.handler.MessageHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig  implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		registry.addHandler(new MessageHandler(),"/messages").withSockJS();
		
	}

}
