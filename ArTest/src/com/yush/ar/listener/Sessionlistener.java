package com.yush.ar.listener;


import java.util.HashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.yush.ar.entity.Users;
import com.yush.ar.service.SessionService;

public class Sessionlistener implements HttpSessionListener,ServletContextListener{
	
	public static HashMap hUserName = new HashMap();
	//使用 Collections.synchronizedList(List<T> list)方法将LinkedList包装成一个线程安全的集合
	 //private List<HttpSession> list = Collections.synchronizedList(new LinkedList<HttpSession>());
	 
	 //定义一个对象，让这个对象充当一把锁，用这把锁来保证往list集合添加的新的session和遍历list集合中的session这两个操作达到同步
	  private Object lock = new Object();
	 
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		 /*synchronized (lock){
	      *//**
	       *将该操作加锁进行锁定，当有一个thread-1(线程1)在调用这段代码时，会先拿到lock这把锁，然后往集合中添加session，
	       *在添加session的这个过程中假设有另外一个thread-2(线程2)来访问了，thread-2可能是执行定时器任务的，
	       *当thread-2要调用run方法遍历list集合中的session时，结果发现遍历list集合中的session的那段代码被锁住了，
	       *而这把锁正在被往集合中添加session的那个thread-1占用着，因此thread-2只能等待thread-1操作完成之后才能够进行操作
	       *当thread-1添加完session之后，就把lock放开了，此时thread-2拿到lock，就可以执行遍历list集合中的session的那段代码了
	       *通过这把锁就保证了往集合中添加session和变量集合中的session这两步操作不能同时进行，必须按照先来后到的顺序来进行。
	       *//*
	    // list.add(session);
		 }    */ 
	}

	@Override
	public   void sessionDestroyed(HttpSessionEvent se) {
		if (se == null)
			return;
		HttpSession session = se.getSession();
		if(session == null)
			return;
		Users users=(Users) session.getAttribute("users");
		if(users!=null){
			ApplicationContext ctx=WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
			SessionService sessionService=(SessionService)ctx.getBean("sessionServiceImpl");
			sessionService.logout(users);
			this.DelSession(session);
		}
	}

	@Override
	public  void contextDestroyed(ServletContextEvent arg0) {
		 System.out.println("web应用关闭");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		 System.out.println("web应用初始化");
		  //创建定时器
		//Timer timer = new Timer();
		  //每隔30秒就定时执行任务
		 // timer.schedule(new MyTask(hUserName,lock), 0, 1000*30);
		//timer.schedule(new MyTask(hUserName,lock,list), 0, 1000*30);
	}
	
	public static synchronized void DelSession(HttpSession session) {
         if (session != null) {
                // 删除单一登录中记录的变量
         	   //System.out.println("开始监听。。。。。。");
        	 Users users =  (Users)session.getAttribute("users");
             if(users!=null){
                   Sessionlistener.hUserName.remove(users.getUserId()); 
                   session.removeAttribute("users");
             }
         }
	    }

}
