package task;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import weibo4j.Account;
import weibo4j.Oauth;
import weibo4j.model.Status;
import weibo4j.model.StatusWapper;
import weibo4j.model.User;
import weibo4j.model.WeiboException;
import weibo4j.util.BareBonesBrowserLaunch;
import weibo4j.Timeline;
import weibo4j.examples.oauth2.Log;
import weibo4j.http.AccessToken;
import tomcat_test.*;
public class MicroBlog {
	String access_token;
	//用于测试，没有使用的初始化函数
	MicroBlog(){
		access_token = "2.00sc8gRGAYVt6D7bc3cee94c7Ts4cD";
		String statuses = "I love you!";
		Timeline tm = new Timeline(access_token);
		try {
			Status status = tm.updateStatus(statuses);
			Log.logInfo(status.toString());
		} catch (WeiboException e) {
			e.printStackTrace();
			//TODO:微博发送失败（可能是access_token错误,可能是连接问题）
		}	
	}
	//发送微博的函数
	void sendBlog(String blogContent){
		String statuses = blogContent;
		Timeline tm = new Timeline(access_token);
		try {
			//更新微博状态——发微博
			Status status = tm.updateStatus(statuses);
		} catch (WeiboException e) {
			//TODO:微博发送失败（可能是access_token错误,可能是连接问题）
			return;
		}	
		//退出当前账号
		Account am = new Account(access_token);
		try {
			User user = am.endSession();
		} catch (WeiboException e) {
			e.printStackTrace();
			//TODO:退出当前微博账号失败
		}
	}
	//初始化函数
	MicroBlog(String name,String password) throws WeiboException, IOException{
		String code;
		access_token=null;
		if(compareNamePassword(name,password)){
			access_token = getToken(name,password);
		}
		else{
			//Oauth授权
			Oauth oauth = new Oauth();
			BareBonesBrowserLaunch.openURL(oauth.authorize("code"));
			System.out.println(oauth.authorize("code"));
			System.out.print("Hit enter when it's done.[Enter]:");
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			code = br.readLine();
			Log.logInfo("code: " + code);
			try{
				access_token=oauth.getAccessTokenByCode(code).getAccessToken();
				Myconn conn = new Myconn();
				conn.connectdatabase();
				String sql = "insert into token(username,password,token) values ('"+name+"','"+password+"','"+access_token+"')";
				conn.ExecuteSql(sql);
				conn.close();
			} catch (WeiboException e) {
				if(401 == e.getStatusCode()){
					Log.logInfo("Unable to get the access token.");
				}else{
					e.printStackTrace();
				}
			}
			//获取access_token
		}
	}
	
	public boolean checkMessage(String message,Date checkTime){
		Timeline tm = new Timeline(access_token);
		try {
			StatusWapper status = tm.getUserTimeline();
			for(Status s:status.getStatuses()){
				//System.out.println(":::::"+s);
				String content = s.getText();
				//System.out.println("????："+content);
				//System.out.println(s.getCreatedAt().toString());
				if(s.getCreatedAt().after(checkTime)&&content.contains(message))return true;
			}
		} catch (WeiboException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//与默认用户名比较
	public boolean compareNamePassword(String name,String password){
		Myconn myconn = new Myconn();
		myconn.connectdatabase();
		String sql = "select * from token where username = '"+name+"' and password = '"+password+"'";
		ResultSet rs = myconn.GetDataReader(sql);
		try {
			if(rs.next()){
				myconn.close();
				return true;
			}
//	if(name.equals("15850782677")&&password.equals("112358"))return true;
			else {
				myconn.close();
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean checkBlog(Date checkTime) {
		// TODO Auto-generated method stub
		Timeline tm = new Timeline(access_token);
		try {
			StatusWapper status = tm.getUserTimeline();
			for(Status s:status.getStatuses()){
				if(s.getCreatedAt().after(checkTime))return false;//检测到微博发布,不发邮件
			}
		} catch (WeiboException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public String getToken(String name,String password){
		Myconn myconn = new Myconn();
		myconn.connectdatabase();
		String sql = "select * from token where username = '"+name+"'and password = '"+password+"'";
		ResultSet rs = myconn.GetDataReader(sql);
		String token = "";
		try {
			if(rs.next()){
				token = rs.getString(3);
			}
			myconn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return token;
	}
}
