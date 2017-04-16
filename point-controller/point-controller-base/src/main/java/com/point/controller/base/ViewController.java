package com.point.controller.base;

import com.point.entity.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by Zhouyang on 2017/4/15.
 */
@Controller
public class ViewController {



    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/index");
        return mav;
    }


    //point部分
    @RequestMapping("/map")
    public ModelAndView map(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/point/map");
        return mav;
    }

    @RequestMapping("/addpoint")
    public ModelAndView addpoint(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/point/addpoint");
        return mav;
    }



    //用户部分
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/user/login");
        return mav;
    }

    @RequestMapping("/register")
    public ModelAndView register(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/user/register");
        return mav;
    }

    @RequestMapping("/activative")
    public ModelAndView activative(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/user/activative");
        return mav;
    }

    @RequestMapping("/userindex")
    public ModelAndView userindex(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/user/userindex");
        return mav;
    }

    @RequestMapping("/userinfo")
    public ModelAndView userinfo(HttpSession httpSession){
        ModelAndView mav=new ModelAndView();
        User user = (User) httpSession.getAttribute("user");
        mav.addObject(user);
        mav.setViewName("/user/userinfo");
        return mav;
    }


}
