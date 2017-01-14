package com.yush.ar.controller.common;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yush.ar.util.DateUtils;
import com.yush.ar.util.ImageKit;
import com.yush.ar.util.ImageUploadUtil;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


/**
 * IndexController on shearphoto
 *
 * @author <a href="mailto:akhuting@hotmail.com">Alex Yang</a>
 * @date 2015年08月18日 17:49
 */
@Controller
@RequestMapping("/paizhao")
public class IndexController{

    
    /**
     *上传头像 接口
     * @throws IllegalStateException 
     * @throws IOException
     */
	@ResponseBody
	@RequestMapping("/shearphoto")
    public String   shearphoto(@RequestParam("UpFile")MultipartFile file12,HttpServletRequest request,
    		HttpServletResponse response,Model model) throws IllegalStateException, IOException {
		  CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		  String fileName = null;
	        // 判断 request 是否有文件上传,即多部分请求
	        if (multipartResolver.isMultipart(request)) {
	            // 转换成多部分request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 取得request中的所有文件名
	            Iterator<String> iter = multiRequest.getFileNames();
	            while (iter.hasNext()) {
	                // 取得上传文件
	                MultipartFile file = multiRequest.getFile(iter.next());
	                if (file != null) {
	                    // 取得当前上传文件的文件名称
	                    String myFileName = file.getOriginalFilename();
	                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
	                    if (myFileName.trim() != "") {
	                        // 获得图片的原始名称
	                        String originalFilename = file.getOriginalFilename();
	                        // 获得上传路径的绝对路径地址(/upload)-->
	                        String realPath ="G:/CYBKIMG";
	                        // 如果路径不存在，则创建该路径
	                        File realPathDirectory = new File(realPath);
	                        if (realPathDirectory == null || !realPathDirectory.exists()) {
	                            realPathDirectory.mkdirs();
	                        }
	                        // 重命名上传后的文件名 111112323.jpg
	                        fileName =DateUtils.format2(new Date())+ ".jpg";
	                        // 定义上传路径 .../upload/111112323.jpg
	                        File uploadFile = new File(realPathDirectory + System.getProperty("file.separator") + fileName);
	                        System.out.println("host:"+realPathDirectory + System.getProperty("file.separator") + fileName);
	                        file.transferTo(uploadFile);
	                        String fileName11=originalFilename.replaceAll("\\.[\\s\\S]{0,5}", "");
	                        System.out.println(fileName11);
	                    }
	                }
	               
	            }
	          /*  JSONObject jsonObject=new JSONObject();
	            jsonObject.put("result", "ok"); 
	            response.getWriter().write(jsonObject.toString()); */
	        }
		 
		
        return  "{'status':'success'}";
    }
	
	
}
