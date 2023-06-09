/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author minhthuy
 */
@Controller
public class UserController {

    CategoryFacadeLocal categoryFacade = lookupCategoryFacadeLocal();

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    JavaMailSender mailSender;

    @RequestMapping(value = "admin/userlist", method = RequestMethod.GET)
    public String showUserList(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Users> userList = usersFacade.findAll();
        model.addAttribute("uList", userList);
        return "admin/userlist";
    }

    @RequestMapping(value = "user/register", method = RequestMethod.GET)
    public String showRegisterPage(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        return "user/register";
    }

    @ModelAttribute("RegisterForm")
    public Users showFormRegister() {
        return new Users();
    }

    @RequestMapping(value = "/user/processRegister", method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("RegisterForm") Users user, @RequestParam("birthday") String birthday, Model model) {
        if (usersFacade.getUserByUsername(user.getUsername()) != null) {
            model.addAttribute("errUname", "Username was used");
            return "user/register";

        } else if (usersFacade.getUserByEmail(user.getEmail()) != null) {
            model.addAttribute("errE", "Email was used");
            return "user/register";
        } else {
            Users u = new Users();
            u.setUsername(user.getUsername());
            u.setPassword(passwordEncoder.encode(user.getPassword()));
            u.setAddress(user.getAddress());
            u.setBirthday(birthday);
            u.setEmail(user.getEmail());
            u.setGender(user.getGender());
            u.setPhone(user.getPhone());
            u.setCode("code");
            u.setStatus(0);
            u.setUserType(0);
            usersFacade.create(u);
        }
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/admin/deleteUser", method = RequestMethod.GET)
    public String deleteUser(@RequestParam("id") int id, Model model) {
        Users u = usersFacade.find(id);
        u.setStatus(1);
        usersFacade.edit(u);
        showUserList(model);
        return "admin/userlist";
    }

    @RequestMapping(value = "/user/forgetpassword", method = RequestMethod.GET)
    public String showForgetPasswordPage() {
        return "user/forgetpassword";
    }

    @ModelAttribute("ForgetPasswordForm")
    public Users showForgetPasswordForm() {
        return new Users();
    }

    @RequestMapping(value = "/sendemail", method = RequestMethod.POST)
    public String processSendEmail(@ModelAttribute("ForgetPasswordForm") Users user, HttpServletRequest request, Model model) throws MessagingException, UnsupportedEncodingException {
        if (usersFacade.getUserByEmail(user.getEmail()) == null) {
            model.addAttribute("errExist", "Email hasn't registered account");
            return "user/forgetpassword";
        } else {
            String token = UUID.randomUUID().toString();
            usersFacade.updateCodeByEmail(token, user.getEmail());
            String resetPasswordLink = request.getContextPath() + "/user/showresetpassword?token=" + token + "&email=" + user.getEmail();
            sendEmail(user.getEmail(), resetPasswordLink, false, true);
            model.addAttribute("success", "yes");
            return "user/forgetpassword";
        }

    }

    public void sendEmail(String recipientEmail, String link, boolean isMultipart, boolean isHtml)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, isMultipart, "UTF-8");
        String content = "";
        content = "<a href='http://localhost:8080" + link + "'>Click here to reset your password</a>";
        messageHelper.setTo(recipientEmail);
        messageHelper.setSubject("Here's the link to reset your password");
        messageHelper.setText(content, isHtml);
        mailSender.send(mimeMessage);
    }

    @RequestMapping(value = "user/showresetpassword", method = RequestMethod.GET)
    public String showResetPassword(@RequestParam("token") String token, @RequestParam("email") String email, Model model) {
        if (usersFacade.getUserByToken(token, email) != null) {
            model.addAttribute("token", token);
            model.addAttribute("email", email);
            return "user/resetpassword";

        } else {
            return "redirect:/user/login";
        }
    }

    @ModelAttribute("ResetPasswordForm")
    public Users showResetPasswordForm() {
        return new Users();
    }

    @RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
    public String processUpdatePassword(@RequestParam(value = "token") String token, @RequestParam(value = "email") String email, @ModelAttribute("ResetPasswordForm") Users user) throws MessagingException, UnsupportedEncodingException {
        System.out.println(token + " " + email);
        if (usersFacade.getUserByToken(token, email) != null) {
            usersFacade.updatePassword(passwordEncoder.encode(user.getPassword()), email, token);
        }
        return "redirect:/user/login";
    }

    @RequestMapping(value = "users/profile", method = RequestMethod.GET)
    public String showProfilePage(Principal principal, Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        String username = "";
        username = principal.getName();
        Users user = usersFacade.getUserByUsername(username);
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("birthday", user.getBirthday());
        model.addAttribute("gender", user.getGender());
        model.addAttribute("address", user.getAddress());
        model.addAttribute("phone", user.getPhone());
        return "user/profile";
    }

    @ModelAttribute("UpdateProfileForm")
    public Users showUpdateProfileForm() {
        return new Users();
    }

    @RequestMapping(value = "users/updateprofile", method = RequestMethod.POST)
    public String processUpdateProfile(@ModelAttribute("UpdateProfileForm") Users user, @RequestParam("birthday") String birthday, Model model) {
        if (usersFacade.checkDuplicateEmail(user.getEmail(), user.getUsername()) != null) {
            model.addAttribute("err", "Email was used!");
            model.addAttribute("gender", user.getGender());
            return "user/profile";
        } else {
            Users u = usersFacade.find(usersFacade.findIdByUsername(user.getUsername()));
            u.setAddress(user.getAddress());
            u.setBirthday(birthday);
            u.setGender(user.getGender());
            u.setPhone(user.getPhone());
            u.setEmail(user.getEmail());
            usersFacade.edit(u);
            return "redirect:/users/profile";
        }
    }

    private UsersFacadeLocal lookupUsersFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (UsersFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/UsersFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CategoryFacadeLocal lookupCategoryFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (CategoryFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/CategoryFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
