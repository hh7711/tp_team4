package com.lgy.Goit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@RequestMapping("/mainPage")
	public String signUpPage() {
		log.info("@@### 메인페이지");
		return "mainPage";
	}
}
