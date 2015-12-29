package tomcat_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class user1 {

	private String username;
	private String password;
	private String email;
	private String phone;
	private String gender;
	private String level;
	private int money;
	private ArrayList<String> message=new ArrayList<String>();
	/*
	 * logStatus 
	 * :0 have not log in
	 * :1 log in success
	 * :-1 password wrong
	 * :-2 no username
	 */
	private int logStatus;
	
	
	public user1(){
		username="";
		password="";
		email="";
		phone="";
		gender="";
		level="";
		money=1000;
		logStatus = 0;
	}

	public void setuser1(String u,String p,String e,String ph,String g,String l){
		username=u;
		password=p;
		email=e;
		phone=ph;
		gender=g;
		level=l;
	}
	
	public void setLogUser(String u,String p){
		username = u;
		password = p;
	}
	
	public void setlevel(String l){
		level=l;
		Myconn conn=new Myconn();
		conn.connectdatabase();
		String sql="update user set level='"+level+"' where username='"+username+"'";
		conn.GetRegisterInfo(sql);
		conn.close();
	}
	
	public void consume(int m){
		money-=m;
		setmoney();
	}
	
	public void recharge(int m){
		money+=m;
		setmoney();
	}
	
	public void setmoney(){
		Myconn conn=new Myconn();
		conn.connectdatabase();
		String sql="update user set money='"+money+"' where username='"+username+"'";
		conn.GetRegisterInfo(sql);
		conn.close();
	}
	
	public void addmessage(String mess){
		message.add(mess);
	}
	
	public ArrayList<String> checkmessage(){
		return message;
	}
	
	public void checkmessage(int index){
		message.remove(index);
	}
	
	public String getusername(){
		return username;
	}
	
	public String getemail(){
		return email;
	}
	
	public String getphone(){
		return phone;
	}
	
	public String getlevel(){
		return level;
	}
	
	public int getmoney(){
		return money;
	}
	
	public int getstatus(){
		return logStatus;
	}
	
	
	public int trylogin(){                
		logStatus=0;//not log in
		Myconn conn=new Myconn();
		conn.connectdatabase();
		String sql="select * from user where username='"+username+"'";
		ResultSet rs=conn.GetDataReader(sql);
		try {
			while(rs.next()){
				if(rs.getString(2).equals(password)){
					email = rs.getString(3);
					phone = rs.getString(4);
					gender = rs.getString(5);
					level = rs.getString(6);
					money = rs.getInt(7);
					logStatus=1;//log in success
				}
				else logStatus = -1;//error1:password wrong
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(logStatus == 0)logStatus = -2;// error2:no username
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs=null;
		}
		conn.close();
		return logStatus;
	}
	
	public void logout(){
		logStatus=0;
	}
	
	public int tryregister(){                
		Myconn conn=new Myconn();
		conn.connectdatabase();
		if(testsql(conn)==1){
			return 1;
		}
		else if(testsql(conn)==2){
			return 2;
		}
		else if(testsql(conn)==3){
			return 3;
		}
		else{
			String sql=makesql();
			conn.GetRegisterInfo(sql);
			conn.close();
			return 4;
		}
			
	}
	
	
	
	
	
	public int testsql(Myconn conn){
      try{
		String test_sql;
		test_sql="select * from user where username='"+username+"'";
		ResultSet rs=conn.GetDataReader(test_sql);
		if(rs.next()){
			return 1;
		}
		test_sql="select * from user where email='"+email+"'";
		rs=conn.GetDataReader(test_sql);
		if(rs.next()){
			return 2;
		}
		test_sql="select * from user where phone='"+phone+"'";
		rs=conn.GetDataReader(test_sql);
		if(rs.next()){
			return 3;
		}
	  }
		catch(Exception e){
			e.printStackTrace();
		}
      
      return 4;
		
		
	}
	
	public String makesql(){
		String _result="INSERT INTO user (username,password,email,phone,gender,level,money) VALUES('" + username + "','" + password + "','" + email + "','" + phone + "','"+gender+"','"+level+"','"+money+"')";
		return _result;
	}
	
	
/*	
	public int checkInMySql(Myconn conn){
		String sql="select * from user where username='"+username+"'";
		ResultSet rs=conn.GetDataReader(sql);
		try{
			while(rs.next()){  //锟斤拷锟斤拷锟斤拷锟捷匡拷
				if(rs.getString(2).equals(password))
					return 0;
				else return 1;  //锟斤拷锟斤拷锟斤拷锟� 
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	    return 2;//锟斤拷锟矫伙拷锟斤拷
	}
	*/
/*	public static void connectdatabase(){
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			String url="jdbc:mysql://localhost:3306/mobosql?user=root&password=";
			Connection con=DriverManager.getConnection(url);
			Statement stmt=con.createStatement();
			String query="select * from user";
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()){
				System.out.print(rs.getString(1)+" ");
				System.out.print(rs.getString(2)+" ");
				System.out.print(rs.getString(3)+" ");
				System.out.print(rs.getString(4)+" ");
				System.out.print(rs.getString(5)+" ");
			}
			
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(stmt!=null){
				stmt.close();
				stmt=null;
			}
			if(con!=null){
				con.close();
				con=null;
			}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}*/
	

}
