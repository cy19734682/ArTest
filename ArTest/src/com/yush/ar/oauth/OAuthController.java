package com.yush.ar.oauth;
import com.alibaba.fastjson.JSONObject;
import com.yush.ar.entity.Users;
import com.yush.ar.util.BaseAction;
import com.yush.ar.util.MyEncrypt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("/oauth")
public class OAuthController extends BaseAction{
    @Resource
    private OAuthService oAuthService;
    
    
    
    @RequestMapping("/{type}/login.do")
  	@ResponseBody
      public ModelAndView baiduLogin(@PathVariable(value = "type") String type) {
      	ModelAndView modelAndView=null;
      	System.out.println("开始进入！！！");
      	System.out.println("type:"+type);
      	modelAndView=new ModelAndView("redirect:" + oAuthService.getLoginUrl(type));
          return modelAndView;
      }
    
    
 // github 成功登陆后的回调
    @RequestMapping(value="/{type}/callback.do", method = RequestMethod.GET)
    //@ResponseBody
    public String ToLoginCallback(@RequestParam("code") String code,@PathVariable(value = "type") String type,
    			RedirectAttributesModelMap arrt) throws Exception {
    	System.out.println("回调开始了！！！");
    	String access_token=oAuthService.getToAccessToken(type, code);//取出token
    	String openid=oAuthService.getUserInfoId(type, access_token);
    	 Users users=oAuthService.checkOauthUser(type,openid);
         if(users!=null){
         	  session.setAttribute("users", users);
         	  String jumpUrl=(String) session.getAttribute("jumpUrl");
         	 if(jumpUrl!=null&&!jumpUrl.equals("")){
				   session.removeAttribute("jumpUrl");
				   return "redirect:"+jumpUrl;
			   }else {
				   return "redirect:/index.jsp";
			  }
         }else{
         	MyEncrypt myEncrypt=new MyEncrypt();
         	openid=myEncrypt.encrypt(openid);
         	arrt.addAttribute("openid",openid);
         	arrt.addAttribute("type",type);
         	return "redirect:/oauth/tobangdUsers.do";
         }
    }
    
    /**
     * 未绑定账号时跳转到绑定页面
     * @param code
     * @param arrt
     * @return
     * @throws Exception 
     */
    @RequestMapping("/tobangdUsers.do")
    @ResponseBody
    public ModelAndView tobangdUsers(@ModelAttribute("openid") String openid,@ModelAttribute("type") String type, 
    				Model model) throws Exception {
        ModelAndView  modelAndView=null;
        MyEncrypt myEncrypt=new MyEncrypt();
        model.addAttribute("openid", myEncrypt.decrypt(openid));  
        model.addAttribute("type",type);  
        modelAndView=new ModelAndView("/register1.jsp");
        return modelAndView;
    }
    
    
}