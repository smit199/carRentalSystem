/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*package com.carrent.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.carrent.beans.User;
import com.carrent.dao.UserDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
//import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author smit sheth
 */
/*@Controller
public class RegisterController {
    
    @Autowired
    UserDao udao;
    
    public RegisterController() {
    }
    
    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    protected void registerUser(@ModelAttribute("user") User user, Model m, HttpServletResponse response, 
            HttpSession session, HttpServletRequest request) throws Exception {
        int rows = udao.save(user);
        //ModelAndView mv = new ModelAndView("register");
        if(rows==0) {
            //mv.addObject("isRegistered",false);
            m.addAttribute("isRegisterd", false);
            System.out.println("Registration unsuccessful");
            response.sendRedirect("register");
        }
        else {
            //mv.addObject("isRegistered",true);
            System.out.println("Registration successful");
            session = request.getSession();
            List<User> us = udao.validUser(user.getUsername(), user.getPassword());
            session.setAttribute("id", us.get(0).getUserid());
            session.setAttribute("user", us.get(0).getUsername());
            response.sendRedirect("index");
        }           //return mv;        
    }
    
    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    protected void loginUser(
                    @RequestParam("username") String username,
                    @RequestParam("password") String password, 
                    HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<User> user = udao.validUser(username, password);
        HttpSession session = request.getSession();
        if(user.isEmpty())
            response.sendRedirect("login");
        else {
            session.setAttribute("id", user.get(0).getUserid());
            session.setAttribute("user", username);
            response.sendRedirect("index");
        }
            
           
            /*System.out.println(session.getAttribute("user"));
            ModelAndView mv = new ModelAndView();
            mv.addObject("user",username);
            mv.setViewName("index");*/
/*    }
    
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        System.out.println("redirected to login.jsp page");
        request.getSession().removeAttribute("user");
        return "index";
    }
}*/
