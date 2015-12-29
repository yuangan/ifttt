package tomcat_test;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import task.*;
@WebServlet(name="if_this_then_thatServlet",urlPatterns={"/if_this_then_that"})
public class if_this_then_thatServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public if_this_then_thatServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		String username=session1.getAttribute("username").toString();
		System.out.println(username);
		String taskname=request.getParameter("taskname");
		String if_sel=request.getParameter("if_select");
		System.out.println("if_sel is:"+if_sel);
		String then_sel=request.getParameter("then_select");
		String if_time="";
		String if_workusername="";
		String if_workpwd="";
		String then_workusername="";
		String then_workpwd="";
		String then_content="";
//		Map<String,String[]> then_content;
		String then_receiver="";
		String then_title="";
		String state="0";
		String checkmessage="";
		Myconn conn=new Myconn();
		conn.connectdatabase();
		if(if_sel.equals("1")){
			if_time=request.getParameter("timer_input");
			System.out.println("timer_input is:"+if_time);
			if_workusername="";
			if_workpwd="";
			checkmessage="";
			if(then_sel.equals("2")){
				then_workusername=request.getParameter("then_select_weibo_username");
				then_workpwd=request.getParameter("then_select_weibo_pwd");
				then_content=request.getParameter("then_select_weibo_content");
				then_receiver="";
				then_title="";
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
			else if(then_sel.equals("3")){
				then_workusername=request.getParameter("then_select_mail_username");
				then_workpwd=request.getParameter("then_select_mail_pwd");
				then_content=request.getParameter("then_select_mail_content");
				then_receiver=request.getParameter("then_select_mail_receiver");
				then_title=request.getParameter("then_select_mail_title");
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
		}
		else if(if_sel.equals("2")){
			if_time="null";
			if_workusername=request.getParameter("if_select_weibo_username");
			if_workpwd=request.getParameter("if_select_weibo_pwd");
			checkmessage=request.getParameter("if_select_weibo_content");
			if(then_sel.equals("2")){
				then_workusername=request.getParameter("then_select_weibo_username");
				then_workpwd=request.getParameter("then_select_weibo_pwd");
				then_content=request.getParameter("then_select_weibo_content");
				then_receiver="";
				then_title="";
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
			else if(then_sel.equals("3")){
				then_workusername=request.getParameter("then_select_mail_username");
				then_workpwd=request.getParameter("then_select_mail_pwd");
				then_content=request.getParameter("then_select_mail_content");
				then_receiver=request.getParameter("then_select_mail_receiver");
				then_title=request.getParameter("then_select_mail_title");
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
		}
		else if(if_sel.equals("3")){
			if_time="null";
			if_workusername=request.getParameter("if_select_mail_username");
			if_workpwd=request.getParameter("if_select_mail_pwd");
			checkmessage="";
			if(then_sel.equals("2")){
				then_workusername=request.getParameter("then_select_weibo_username");
				then_workpwd=request.getParameter("then_select_weibo_pwd");
				then_content=request.getParameter("then_select_weibo_content");
				then_receiver="";
				then_title="";
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
			else if(then_sel.equals("3")){
				then_workusername=request.getParameter("then_select_mail_username");
				then_workpwd=request.getParameter("then_select_mail_pwd");
				then_content=request.getParameter("then_select_mail_content");
				then_receiver=request.getParameter("then_select_mail_receiver");
				then_title=request.getParameter("then_select_mail_title");
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
		}
		else if(if_sel.equals("4")){
			if_time=request.getParameter("timer_input");
			System.out.println("time is:"+if_time);
			if_workusername=request.getParameter("if_select_timeweibo_username");
			if_workpwd=request.getParameter("if_select_timeweibo_pwd");
		
			if(then_sel.equals("2")){
				then_workusername=request.getParameter("then_select_weibo_username");
				then_workpwd=request.getParameter("then_select_weibo_pwd");
				then_content=request.getParameter("then_select_weibo_content");
				then_receiver="";
				then_title="";
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
			else if(then_sel.equals("3")){
				then_workusername=request.getParameter("then_select_mail_username");
				then_workpwd=request.getParameter("then_select_mail_pwd");
				then_content=request.getParameter("then_select_mail_content");
				then_receiver=request.getParameter("then_select_mail_receiver");
				then_title=request.getParameter("then_select_mail_title");
				String sql="insert into userwork (username,taskname,isdateorblogormail,isblogormail,checkname,checkpassword,executeid,executepassword,content,willreceivemailname,mailtitle,t_time,state,checkmessage)"
						+ "values('"+username+"','"+taskname+"','"+if_sel+"','"+then_sel+"','"+if_workusername+"','"+if_workpwd+"','"+then_workusername+"','"+then_workpwd+"','"+then_content+"','"+then_receiver+"','"+
						then_title+"','"+if_time+"','"+state+"','"+checkmessage+"')";
				conn.GetRegisterInfo(sql);
				conn.close();
			}
		}
		AllTask.getAllTask().createNewTask(taskname, if_sel, then_sel, if_workusername, if_workpwd, then_workusername, then_workpwd, then_content, then_receiver, then_title, if_time, then_title, checkmessage);
		
		Myconn con = new Myconn();
		con.connectdatabase();
		Date date= new Date(System.currentTimeMillis());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(date);
		
		String select ="select money from user where username='"+username+"'";
		ResultSet moneyrs = con.GetDataReader(select);
		int nowmoney=0;
		try {
			if(moneyrs.next())
			{
				nowmoney=Integer.parseInt(moneyrs.getString(1));
			}
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String level=session1.getAttribute("level").toString();
		int money_txt=200;
		switch(level)
		{
		case "normal": break;
		case "brass": money_txt *= 0.9;
		case "silver": money_txt *= 0.8;
		case "gold": money_txt *= 0.7;
		case "diamond": money_txt *= 0.6;
		case "admin": money_txt *= 0.5;
		}
		String str="创建任务 "+taskname;
		String recordsql = "insert into record values('"+username+"','"+time+"','"+str+"'"+","+(-money_txt)+","+(nowmoney-money_txt)+")";
		con.ExecuteSql(recordsql);
		String moneysql="update user set money = money -"+money_txt+" where username = '"+username+"'";
		con.ExecuteSql(moneysql);
		con.close();
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		response.sendRedirect(basePath+"main.jsp");

	}
}
