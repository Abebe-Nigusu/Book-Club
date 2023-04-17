package com.abebe.bookapi.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abebe.bookapi.models.Book;
import com.abebe.bookapi.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
@Controller
@RequestMapping("/books")
public class BookController {

	@Autowired
	private BookService bookServ;

	@GetMapping("/new")
	public String createBook(@ModelAttribute("book") Book book,HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/users/login/reg";
		}
		return "book/create.jsp";
	}
	
	@PostMapping("/process/new")
	public String processCreateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "book/create.jsp";
		}
		bookServ.create(book);
		return "redirect:/books";
		
	}
	
	@GetMapping("/display/{id}")
	public String diplayBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("book", bookServ.getOne(id));
		return "book/display.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editBook(Model model, @PathVariable("id") Long id) {
		model.addAttribute("book", bookServ.getOne(id));
		return "book/edit.jsp";
	}
	
	@PutMapping("/process/edit/{id}")
	public String processEditBook(@Valid @ModelAttribute("book") Book book, BindingResult result, @PathVariable("id") Long id) {
		if(result.hasErrors()) {
			return "book/edit.jsp";
		}
		bookServ.update(book);
		return "redirect:/books/display/" + id;
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/books";
	}
}
