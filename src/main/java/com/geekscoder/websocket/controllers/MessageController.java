package com.geekscoder.websocket.controllers;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {
	
	
	
	@MessageMapping("/messages")
	public String processMessage(String message) {
		return message.toUpperCase();
	}
	
	

}
