package com.clicdirectory.controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * User: jainaman1398
 */
@Controller
@RequestMapping("/admin")
public class AdminController  {




    @RequestMapping(method = RequestMethod.POST, value = "/signup", produces = "application/json")
    public @ResponseBody

    String SignUp(HttpServletRequest request) throws Exception{
        String Name=request.getParameter("Name");
        String Pass=request.getParameter("Pass");
        String Contact=request.getParameter("Contact");

        System.out.println(Name);
        System.out.println(Pass);
        System.out.println(Contact);
        return "aj";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/signup",produces = "application/json")
    public @ResponseBody String show(){
        return "index";
    }
}