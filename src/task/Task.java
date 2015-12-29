package task;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import weibo4j.model.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import tomcat_test.Myconn;
public class Task {
	String taskName;
//	String taskDescription;
	String isDateOrBlogOrMail;
	String isBlogOrMail;
	/*
	 * 监视的用户名，微博/邮箱
	 */
	String checkName;
	String checkPassword;
	String executeID;
	String executePassword;
	String content;
	String willReceiveMailName;
	String mailTitle;
	Calendar calendar;
	
	int timeInterval;
	/*
	 * 0:还未开始
	 * 1:正在运行
	 * 2:暂停中
	 * 3:运行完毕
	 */
	String state;
	String checkMessage;
	
	int mailCount;
	Date checkTime;//检查时间,用于监视微博

	
	Task(){
		taskName = null;
//		taskDescription = null;
		calendar = Calendar.getInstance();
		state = "0";
		mailCount = 0;
	}
	
	public Task(String taskName, String isDateOrBlogOrMail, String isBlogOrMail, String checkName, String checkPassword, String executeID,
			String executePassword, String content, String willReceiveMailName, String mailTitle, String time, String state,String checkMessage) {
		// TODO Auto-generated constructor stub
		this.taskName=taskName;
		this.isDateOrBlogOrMail = isDateOrBlogOrMail;
		this.isBlogOrMail = isBlogOrMail;
		this.checkName = checkName;
		this.checkPassword = checkPassword;
		this.executeID = executeID;
		this.executePassword = executePassword;
		this.content =content;
		this.willReceiveMailName = willReceiveMailName;
		this.mailTitle = mailTitle;
		this.calendar = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date day = null;
		if(isDateOrBlogOrMail.equals("1")){
			try {
				day = df.parse(time);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			//设置时间
			this.calendar.setTime(day);
//			System.out.println(day);
		
		}
		else if(isDateOrBlogOrMail.equals("4")){
			
			try {
				day = df.parse("0000-00-00 "+time);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			//设置时间间隔
			timeInterval = day.getHours()*60*60+day.getMinutes()*60;
		}
		this.state = state;
		this.checkMessage = checkMessage;
	}

	//设置This和that
	boolean This(){
		//到达将来某个时间
		if(isDateOrBlogOrMail.equals("1")){
			Date now =new Date();
			Calendar nowCalendar = Calendar.getInstance();
			nowCalendar.setTime(now);
			//可以执行
			if(calendar.compareTo(nowCalendar)<=0){
				state = "3";
				Myconn conn = new Myconn();
				conn.connectdatabase();
				String sql = "update userwork set state = '3' where taskName = '"+taskName+"'";
				conn.ExecuteSql(sql);
				conn.close();
				return true;
			}
			else if(calendar.compareTo(nowCalendar)>0){
				return false;
			}
		}
		else if(isDateOrBlogOrMail.equals("3")){//增加是否收到邮件判定
//			System.out.println(mailCount);
			if((mailCount+1)==getMailNumber()){
				mailCount = mailCount+1;//可重复监听
				return true;
			}
			else return false;
		}
		else if(isDateOrBlogOrMail.equals("2")){//监听微博
			MicroBlog checkMicroBlog;
			try {
				checkMicroBlog = new MicroBlog(checkName,checkPassword);
				if(checkMicroBlog.checkMessage(checkMessage,checkTime)){
					return true;
				}
			} catch (WeiboException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		else if(isDateOrBlogOrMail.equals("4")){//定时监视微博
			MicroBlog checkMicroBlog;
			try {
				checkMicroBlog = new MicroBlog(checkName,checkPassword);
				state = "3";
				Myconn conn = new Myconn();
				conn.connectdatabase();
				String sql = "update userwork set state = '3' where taskName = '"+taskName+"'";
				conn.ExecuteSql(sql);
				conn.close();
				if(checkMicroBlog.checkBlog(checkTime))return true;
				else return false;
			} catch (WeiboException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	void That(){
		if(isBlogOrMail.equals("2")){//发微博
			try {
				MicroBlog microBlog = new MicroBlog(executeID,executePassword);
				microBlog.sendBlog(content);
			} catch (WeiboException e) {
				e.printStackTrace();
				//TODO:微博发送失败（可能是access_token错误,可能是连接问题）
			} catch (IOException e) {
				e.printStackTrace();
				//TODO:微博发送失败（可能是access_token错误,可能是连接问题）
			}
		}
		else {//发qq邮件
			try {
				sendMail();
			} catch (MessagingException e) {
				e.printStackTrace();
				//TODO:发送邮件失败，可能是认证问题，可能是连接问题
			}
		}
		if(isDateOrBlogOrMail.equals("2"))checkTime = new Date();//可重复监听微博
	}
	
	public void sendMail() throws MessagingException{
		Authenticator authenticator = null;
		//设置properties
		final Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.qq.com");//使用qq邮箱
		properties.put("mail.smtp.port","25");
		properties.put("mail.smtp.auth", true);
		//认证
		authenticator = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(executeID, executePassword);
			}
		};
		//使用环境属性和授权信息，创建邮件会话
		Session mailSession = Session.getInstance(properties,authenticator);
		//创建邮件消息
		MimeMessage message = new MimeMessage(mailSession);
		//设置发件人
		InternetAddress from = new InternetAddress(executeID);
		message.setFrom(from);
		
		//设置收件人
		InternetAddress to = new InternetAddress(willReceiveMailName);
		message.setRecipient(RecipientType.TO, to);
		
		//设置邮件标题
		message.setSubject(mailTitle);
		
		//设置内容
		message.setText(content);
		
		Transport.send(message);
	}
	
	public int getMailNumber(){
		Authenticator authenticator = null;
		final Properties properties = new Properties();
		properties.put("mail.imap.host", "imap.qq.com");//使用qq邮箱
		properties.put("mail.imap.ssl.enable", true);
		properties.put("mail.store.port","imap");
		authenticator = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(checkName, checkPassword);
			}
		};
		Session mailSession = Session.getInstance(properties,authenticator);
		try {
			Store store = mailSession.getStore("imap");
			//连接服务器
			store.connect("imap.qq.com",checkName, checkPassword);
			//获取收件箱
			Folder folder = store.getFolder("INBOX");
			//设置打开方式
			folder.open(Folder.READ_ONLY);
			//返回邮箱内邮件数目
			return folder.getMessageCount();
		} catch (NoSuchProviderException e){
			e.printStackTrace();
			state = "3";//连接不上直接结束任务
			//TODO:收件箱连接失败
		}catch (MessagingException e){
			e.printStackTrace();
			state = "3";
			//TODO:收件箱连接失败
		}
		return 0;
	}
	
	public void setBlogTime(){
		checkTime = new Date();
		}
	
	public void setMailCount(){
		mailCount = getMailNumber();
	}

}

