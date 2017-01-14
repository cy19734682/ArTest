package com.yush.ar.listener;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yush.ar.entity.Users;
import com.yush.ar.service.UserService;

public class MyTask extends TimerTask{
	//存储HttpSession的list集合
	 private List<HttpSession> list;
	 private  HashMap hUserName = new HashMap();
	 private UserService userService;
	 //存储传递过来的锁
	 private Object lock;
	public MyTask(HashMap hUserName,Object lock,List<HttpSession> list){
	    this.hUserName = hUserName;
	    this.lock = lock;
	    this.list=list;
	}
	/* run方法指明了任务要做的事情
	 * @see java.util.TimerTask#run()
	 */
	@Override
	public void run() {
	        //将该操作加锁进行锁定
	    synchronized (lock) {
	        System.out.println("定时器执行！！");
	        System.out.println(list.size());
	         ListIterator<HttpSession> it = list.listIterator();
	        /**
	         * 迭代list集合中的session，在迭代list集合中的session的过程中可能有别的用户来访问，
	         * 用户一访问，服务器就会为该用户创建一个session,此时就会调用sessionCreated往list集合中添加新的session，
	         * 然而定时器在定时执行扫描遍历list集合中的session时是无法知道正在遍历的list集合又添加的新的session进来了，
	         * 这样就导致了往list集合添加的新的session和遍历list集合中的session这两个操作无法达到同步
	         * 那么解决的办法就是把"list.add(session)和while(it.hasNext()){//迭代list集合}"这两段代码做成同步，
	         * 保证当有一个线程在访问"list.add(session)"这段代码时，另一个线程就不能访问"while(it.hasNext()){//迭代list集合}"这段代码
	         * 为了能够将这两段不相干的代码做成同步，只能定义一把锁(Object lock)，然后给这两步操作加上同一把锁，
	         * 用这把锁来保证往list集合添加的新的session和遍历list集合中的session这两个操作达到同步
	         * 当在执行往list集合添加的新的session操作时，就必须等添加完成之后才能够对list集合进行迭代操作，
	         * 当在执行对list集合进行迭代操作时，那么必须等到迭代操作结束之后才能够往往list集合添加的新的session
	         */
	       while(it.hasNext()){
	            HttpSession session = (HttpSession) it.next();
	            /*Users users= (Users) session.getAttribute("users");
	            if(users.getUserid()!=null){
	            	System.out.println(users.getUsername());
	            }*/
	            System.out.println(session.getAttribute("users"));
	            for (Iterator<Integer> keys = hUserName.keySet().iterator(); keys.hasNext();) {
	            	Integer key = (Integer) keys.next();
	            	/*if(users.getUserid()!=null){
	            		System.out.println("值是："+key);
	        		   //userService.forceLogoutUser(key);
	        	  }*/
	            } 
	                //手动销毁session
	                //session.invalidate();
	                //移除集合中已经被销毁的session
	               // it.remove();
	           
	        }
	        
	    }
	}
}
