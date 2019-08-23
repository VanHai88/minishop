package com.nguyenvanhai.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/dangxuat")
public class DangXuatController {
	@GetMapping
	public void Default(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		session.removeAttribute("user");
		response.sendRedirect("/minishop/");
	}
}
