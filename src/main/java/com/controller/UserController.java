package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.User;
import com.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    @ResponseBody
    public String register(User user) {
        userService.addUser(user);
        return "succeed";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(String username, String password, HttpSession session) {

        User user = userService.getUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "succeed";
        } else {
            return "failed";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:index";
    }

    @PostMapping("/update")
    @ResponseBody
    public String update(String username, String password, String newpassword, HttpSession session) {
        User user = userService.getUser(username, password);

        if (user != null) {
            user.setPassword(newpassword);
            userService.updateUser(user);
            return "succeed";
        }
        return "failed";
    }


    @RequestMapping("/getusers")
    @ResponseBody
    public List<User> getUsers(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return null;
        } else {
            return userService.getUsers();
        }
    }


    @RequestMapping("/getusername")
    @ResponseBody
    public boolean getUserName(String username){

        boolean flag=false;
        if(userService.getUserName(username)){
            return true;
        }else{
            return false;
        }
    }

    @GetMapping("/{view}")
    public void getView() {
    }
}
