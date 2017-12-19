package com.atguigu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class IndexController {
	
	@RequestMapping("/index2")
	public String index2() {
		
		return "manager_index";
	}
	
	@RequestMapping("index")
	public ModelAndView index(String success,String url,String title,ModelMap map) {
		
		ModelAndView mv = new ModelAndView("manager_index");
		map.put("url", url);
		map.put("title", title);
		return mv;
	}
	
	@RequestMapping("/index/{success}.do")
	public ModelAndView index2(@PathVariable("success") String success) {
		
		ModelAndView mv = new ModelAndView("manager_index");
		mv.addObject("success", success);
		
		return mv;
	}
	
	@RequestMapping("/reIndex/{success}.do")
	public RedirectView reIndex(@PathVariable("success") String success) {
		RedirectView redirectView = 
				new RedirectView("manager_index", true, false, true);
		redirectView.addStaticAttribute("success", success);
		return redirectView;
	}
	
	
	
	

}
