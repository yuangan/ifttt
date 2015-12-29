package task;

import tomcat_test.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javafx.animation.Timeline;

public class AllTask {
	private ArrayList<Task> allTaskList =new ArrayList<Task>();
	
	//饿汉式单例类
	private AllTask(){}
	private static final AllTask allTask = new AllTask();
	public static AllTask getAllTask(){
		return allTask;
	}
	
	//初始化服务器中的任务
	public void initAllTask(){
		Myconn conn = new Myconn();
		conn.connectdatabase();
		String sql = "select * from userwork";
		ResultSet rs=conn.GetDataReader(sql);
		try {
			while(rs.next()){
				Task newTask = new Task(
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13),
						rs.getString(14));
				allTaskList.add(newTask);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		run();
	}
	
	//创建任务
	public void createNewTask(
			String taskName,
			String isDateOrBlogOrMail,
			String isBlogOrMail,
			String checkName,
			String checkPassword,
			String executeID,
			String executePassword,
			String content,
			String willReceiveMailName,
			String mailTitle,
			String time,
			String state,
			String checkMessage){
				Task tempTask = new Task(taskName,isDateOrBlogOrMail,isBlogOrMail,checkName,checkPassword,executeID,
						executePassword,content, willReceiveMailName,mailTitle,time,state,checkMessage);
				allTaskList.add(tempTask);
	}
	
	//删除任务
	public void deleteTask(String taskname){
		Task taskToDelete = null;
		for(Task t:allTaskList){
			if(t.taskName.equals(taskname)){
				taskToDelete = t;
			}
		}
		allTaskList.remove(taskToDelete);

	}
	
	//修改任务
	public void modifyTask(String taskNameToDelete,
			String taskName,
			String isDateOrBlogOrMail,
			String isBlogOrMail,
			String checkName,
			String checkPassword,
			String executeID,
			String executePassword,
			String content,
			String willReceiveMailName,
			String mailTitle,
			String time,
			String state,
			String checkMessage){
		deleteTask(taskNameToDelete);
		createNewTask(taskName, isDateOrBlogOrMail, isBlogOrMail, checkName, checkPassword, executeID, executePassword, content, willReceiveMailName, mailTitle, time, state, checkMessage);
		
	}
	
	//初始执行
	public void run(){
		for(Task t:allTaskList){
			if(t.isDateOrBlogOrMail.equals("1")){
				MyTimerTask myTimerTask = new MyTimerTask(t);
			}
			else{
				MyTimerTask2 myTimerTask2 = new MyTimerTask2(t);
			}
		}
	}
	//执行某个任务
	public void runATask(String taskName){

		for(Task t:allTaskList){
			if(t.taskName.equals(taskName)){
				t.state = "1";
				Myconn conn = new Myconn();
				conn.connectdatabase();
				String sql = "update userwork set state = '1' where taskName = '"+taskName+"'";
				conn.ExecuteSql(sql);
				conn.close();
				if(t.isDateOrBlogOrMail.equals("1")){
					MyTimerTask myTimerTask = new MyTimerTask(t);
				}
				else{
					MyTimerTask2 myTimerTask2 = new MyTimerTask2(t);
				}
				break;
			}
		}
	}
	//停止某个任务
	public void stopATask(String taskName){
		for(Task t: allTaskList){
			if(t.taskName.equals(taskName)){
				t.state = "2";
				Myconn conn = new Myconn();
				conn.connectdatabase();
				String sql = "update userwork set state = '2' where taskName = '"+taskName+"'";
				conn.ExecuteSql(sql);
				conn.close();
			}
		}
	}
	//1秒定时器，用于实现多线程执行
	private class MyTimerTask extends TimerTask {
		Timer timer;
		Task temp = null;
		public MyTimerTask() {}
		public MyTimerTask(Task t){
			timer =new Timer();
			temp = t;
			timer.schedule(this, 1000,1000);
		}
		public void run() {
			if(temp.state.equals("1")){
				if(temp.This()){//开始执行
					temp.That();
				}
			}
			else timer.cancel();
		}
	}
	//10秒定时器
	private class MyTimerTask2 extends TimerTask {
		Timer timer;
		Task temp = null;
		public MyTimerTask2() {}
		public MyTimerTask2(Task t){
			timer =new Timer();
			temp = t;
			if(temp.isDateOrBlogOrMail.equals("3")){
				temp.setMailCount();
				timer.schedule(this, 1000,10000);
			}
		
			else if(temp.isDateOrBlogOrMail.equals("2")){
				temp.setBlogTime();
			//	System.out.println("gggggg");
				timer.schedule(this, 1000,180000);
			}

			else if(temp.isDateOrBlogOrMail.equals("4")){
				temp.setBlogTime();
				timer.schedule(this,1000,1000);
			}
		}
		public void run() {
			if(temp.state.equals("1")){
		//		System.out.println("s:"+temp.state);
				if(!temp.isDateOrBlogOrMail.equals("4")){
					if(temp.This()){//开始执行
					temp.That();
					}
				}
				else {
					if(temp.timeInterval>0)temp.timeInterval--;
					else if(temp.This())temp.That();
				}
			}
			else {
		//		System.out.println("nnonono");
				timer.cancel();
			}
		}
	}
}