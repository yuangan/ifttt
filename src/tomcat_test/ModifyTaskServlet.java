package tomcat_test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import task.AllTask;
@WebServlet(name="ModifyTaskServlet",urlPatterns={"/modifytask"})
public class ModifyTaskServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
    public ModifyTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String taskName=request.getParameter("taskname");
    	String ori_taskName=request.getParameter("ori_taskname");
    	String taskNameToDelete=ori_taskName;
    	String isDateOrBlogOrMail=request.getParameter("if_select");
    	String isBlogOrMail=request.getParameter("then_select");
    	String checkName="";
    	String checkPassword="";
    	String executeID="";
    	String executePassword="";
    	String content="";
    	String willReceiveMailName="";
    	String mailTitle="";
    	String time="";
    	String state="0";
    	String checkMessage="";
    	
    	if(isDateOrBlogOrMail.equals("1")){
    		time=request.getParameter("timer_input");
    	}
    	else if(isDateOrBlogOrMail.equals("2")){
    		checkName=request.getParameter("if_select_weibo_username");
    		checkPassword=request.getParameter("if_select_weibo_pwd");
    		content=request.getParameter("if_select_weibo_content");
    		
    	}
    	else if(isDateOrBlogOrMail.equals("3")){
    		checkName=request.getParameter("if_select_mail_username");
       		checkPassword=request.getParameter("if_select_mail_pwd");
    		
    	}
    	else if(isDateOrBlogOrMail.equals("4")){
    		time=request.getParameter("timer_input");
    		checkName=request.getParameter("if_select_timeweibo_username");
    		checkPassword=request.getParameter("if_select_timeweibo_pwd");
    	}
    	
    	if(isBlogOrMail.equals("2")){
			executeID=request.getParameter("then_select_weibo_username");
			executePassword=request.getParameter("then_select_weibo_pwd");
			content=request.getParameter("then_select_weibo_content");
		}
		else if(isBlogOrMail.equals("3")){
			executeID=request.getParameter("then_select_mail_username");
			executePassword=request.getParameter("then_select_mail_pwd");
			content=request.getParameter("then_select_mail_content");
			willReceiveMailName=request.getParameter("then_select_mail_receiver");
			mailTitle=request.getParameter("then_select_mail_title");
		}
    	
    	/*System.out.println("taskname1 is:"+taskName);
    	System.out.println(isDateOrBlogOrMail);
    	System.out.println(isBlogOrMail);
    	System.out.println(checkName);
    	System.out.println(checkPassword);
    	System.out.println(executeID);
    	System.out.println(executePassword);
    	System.out.println(content);
    	System.out.println(willReceiveMailName);
    	System.out.println(mailTitle);
    	System.out.println(time);
    	System.out.println(state);
    	System.out.println(checkMessage);
    	*/
    	String sql;
    	Myconn conn=new Myconn();
    	conn.connectdatabase();
    	if(!taskName.equals(ori_taskName)){
		sql="select * from userwork where taskname='"+taskName+"'";
		ResultSet rs=conn.GetDataReader(sql);
		try {
			if(rs.next()){
				request.getRequestDispatcher("/main.jsp").forward(request,response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	}
		sql="update userwork set taskname='"+taskName+"',isdateorblogormail='"+isDateOrBlogOrMail+"',isblogormail='"+isBlogOrMail+"',checkname='"+checkName+"',checkpassword='"+checkPassword+"',executeid='"+executeID+"',executepassword='"+executePassword+"',content='"+content+"',willreceivemailname='"+willReceiveMailName+"',mailtitle='"+
				mailTitle+"',t_time='"+time+"',state='"+state+"',checkmessage='"+checkMessage+"' where taskname='"+ori_taskName+"'";
				
		conn.GetRegisterInfo(sql);
		conn.close();
    	AllTask.getAllTask().modifyTask(taskNameToDelete, taskName, isDateOrBlogOrMail, isBlogOrMail, checkName, checkPassword, executeID, executePassword, content, willReceiveMailName, mailTitle, time, state, checkMessage);

		request.getRequestDispatcher("/main.jsp").forward(request,response);
    }
}
