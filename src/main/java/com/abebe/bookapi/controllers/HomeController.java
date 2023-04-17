package com.abebe.bookapi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abebe.bookapi.services.BookService;
import com.abebe.bookapi.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	private final UserService userServ;
		
		@Autowired
		private BookService bookServ;
		
		public HomeController(UserService userServ) {
			this.userServ = userServ;
		}
		
		@GetMapping("/books")
		public String home(HttpSession session,Model model) {
			if(session.getAttribute("user_id") == null) {
				return "redirect:/";
			}
			model.addAttribute("allBooks", bookServ.getAll());
			model.addAttribute("loggedInUser", userServ.getUser((Long) session.getAttribute("user_id")));
			model.addAttribute("allUsers", userServ.getAll());
			return "main/dashboard.jsp";
		}

}
