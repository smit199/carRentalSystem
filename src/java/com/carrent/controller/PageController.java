/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.carrent.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.carrent.beans.User;
import java.util.List;
import org.springframework.ui.Model;
import com.carrent.dao.UserDao;
import java.sql.SQLIntegrityConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import com.carrent.beans.Car;
import com.carrent.dao.CarDao;
/**
 *
 * @author smit sheth
 */
@Controller
public class PageController {
    @Autowired
    UserDao udao;
    @Autowired
    CarDao cdao;
    
    @RequestMapping(value = "/about")
    public String about() {
        System.out.println("redirected to about.jsp page");
        return "about";
    }
    
    @RequestMapping(value = "/register")
    public String register(@ModelAttribute("user") User user, Model m, HttpServletResponse response, 
            HttpSession session, HttpServletRequest request) throws Exception {
        
        if(request.getMethod().equals("POST")) {
            boolean is_registered = false;
            int rows;
            try {
                rows = udao.save(user);
                is_registered = true;
            } catch(Exception ex) {
                m.addAttribute("isRegistered", false);
                System.out.println("Registration unsuccessful");
            }
            m.addAttribute("isRegistered", is_registered);

            if(! is_registered) {
                System.out.println("Registration unsuccessful");
                //response.sendRedirect("register");
            }
            else {
                System.out.println("Registration successful");
                session = request.getSession();
                List<User> us = udao.validUser(user.getUsername(), user.getPassword());
                session.setAttribute("id", us.get(0).getUserid());
                session.setAttribute("user", us.get(0).getUsername());
                System.out.println(session.getAttribute("id"));
                System.out.println(session.getAttribute("user"));
                response.sendRedirect("index");
            } 
        }
        System.out.println("redirected to register.jsp page");
        return "register";
    }
    
    @RequestMapping(value = "/login")
    public String login(Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if(request.getMethod().equals("POST")) {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            List<User> user = udao.validUser(username, password);
            HttpSession session = request.getSession();
            
            if(user.isEmpty()) {
                m.addAttribute("isValid", false);
                System.out.println(m.getAttribute("isValid"));
                System.out.println("invalid user");
            }
            else {
                session.setAttribute("id", user.get(0).getUserid());
                session.setAttribute("user", username);
                response.sendRedirect("index");
            }
        }
        System.out.println("redirected to login.jsp page");
        return "login";
    }
    
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        System.out.println("user has logged out");
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("id");
        return "index";
    }
    
    @RequestMapping(value = "/car")
    public String car(Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Car> cars = cdao.getAllCars();
        m.addAttribute("allCars", cars);
        System.out.println("redirected to car.jsp page");
        return "car";
    }
    
    @RequestMapping(value = "/caradd")
    public String carAdd(@ModelAttribute("car") Car car, Model m, HttpServletResponse response, 
            HttpSession session, HttpServletRequest request) throws Exception {
        if(request.getMethod().equals("POST")) {
            boolean isCarAdded = false;
            int rows;
            try {
                rows = cdao.save(car);
                if(rows!=0)
                    isCarAdded = true;
            } catch(Exception ex) {
                m.addAttribute("isCarAdded", false);
                System.out.println("Car is not added");
            }
            m.addAttribute("isCarAdded", isCarAdded);

            if(! isCarAdded) {
                System.out.println("car is not added");
            }
            else {
                System.out.println("Car is added successfully");
            } 
        }
        return "caradd";
    }
    
    @RequestMapping(value = "/getcar")
    public String getCar(@RequestParam("carId") int carid, Model m, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        session = request.getSession();
        String uname = (String)session.getAttribute("user");
        Car car = cdao.getCarById(carid);
        car.setCarid(carid);
        m.addAttribute("carById", car);
        
        if(uname.equals("admin"))
            return "updatecar";
        else
            return "carbooking";
    }
    
    @RequestMapping(value = "/carupdate")
    public String carUpdate(@ModelAttribute("car") Car car, Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(request.getMethod().equals("POST")) {
            boolean isCarUpdated = false;
         
            int rows;
            System.out.println(car.getCarid());
            try {
                rows = cdao.update(car);
                System.out.println(rows);
                if(rows!=0)
                    isCarUpdated = true;
            } catch(Exception ex) {
                m.addAttribute("isCarUpdated", false);
                System.out.println("Car details not updated");
            }
            m.addAttribute("isCarUpdated", isCarUpdated);

            if(! isCarUpdated) {
                System.out.println("car details not updated");
            }
            else {
                System.out.println("Car details are updated successfully");
            } 
        }
        return "updatecar";
    }
    
    @RequestMapping(value = "/deletecar")
    public void deleteCar(@RequestParam("carId") int carid, Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
        cdao.delete(carid);
        response.sendRedirect("car");
    }
}
