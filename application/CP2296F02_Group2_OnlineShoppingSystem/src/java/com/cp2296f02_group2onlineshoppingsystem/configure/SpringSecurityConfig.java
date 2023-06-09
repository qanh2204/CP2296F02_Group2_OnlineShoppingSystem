package com.cp2296f02_group2onlineshoppingsystem.configure;

import com.cp2296f02_group2onlineshoppingsystem.service.LoginSuccessHandler;
import com.cp2296f02_group2onlineshoppingsystem.service.UserService;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.ResolvableType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author minhthuy
 */
@EnableWebSecurity
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();

    UserService userService = new UserService();
    LoginSuccessHandler loginSuccessHandler = new LoginSuccessHandler();

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable().authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/user/*").permitAll()
                .antMatchers("/users/**").hasAuthority("User")
                .antMatchers("/admin/*")
                .hasAuthority("Admin")
                .and().exceptionHandling().accessDeniedPage("/user/forbidden")
                .and().formLogin().loginPage("/user/login")
                //.defaultSuccessUrl("/admin/homepageadmin")
                //.failureUrl("/user/login?error")
                .usernameParameter("username").passwordParameter("password")
                .successHandler(loginSuccessHandler).permitAll()
                .and()
                .logout().logoutSuccessUrl("/user/login?logout")
                .deleteCookies("JSESSIONID");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        for (int i = 0; i < usersFacade.getAllUserEnable().size(); i++) {
//                    System.out.println("password"+ usersFacade.getAllUserEnable().get(i).getPassword());
//
//            if (usersFacade.getAllUserEnable().get(i).getUserType() == 1) {
//                auth.inMemoryAuthentication()
//                        .withUser(usersFacade.getAllUserEnable().get(i).getUsername()).password(usersFacade.getAllUserEnable().get(i).getPassword()).roles("Admin");
//            }
//            else if(usersFacade.getAllUserEnable().get(i).getUserType() == 0){
//                auth.inMemoryAuthentication()
//                        .withUser(usersFacade.getAllUserEnable().get(i).getUsername()).password(usersFacade.getAllUserEnable().get(i).getPassword()).roles("User");
//
//            }
//        }
//      
//    }

    private UsersFacadeLocal lookupUsersFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (UsersFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/UsersFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
