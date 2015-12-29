package tomcat_test;


import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="moneyServlet",urlPatterns={"/money"})
public class moneyServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	  
    public moneyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session1 = request.getSession();
        String name=(String) session1.getAttribute("username");
        int ori_money=(int) (session1.getAttribute("money"));
        String money=request.getParameter("dep_or_with_txt");
        int money_txt=Integer.parseInt(money);
        if(money_txt<0){
        	String s="<script>alert('negative number!')</script>";
        	request.setAttribute("message2",s);
        	String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			response.sendRedirect(basePath+"main.jsp");
        	return;
        }
        
    	String choice=request.getParameter("dep_or_with");
    	if(choice.equals("1")){
    		Myconn myconn=new Myconn();
    		myconn.connectdatabase();
    		String sql="update user set money=money+'"+money_txt+"' where username='"+name+"'";
    		int i=myconn.GetRegisterInfo(sql);
    		if(i<0){
    			request.setAttribute("message2","<script>alert('deposit failed')</script>");
    			String path = request.getContextPath();
    			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			response.sendRedirect(basePath+"main.jsp");
    			myconn.close();
            	return;
    		}
    		else{
    			request.setAttribute("message2","<script>alert('deposit successfully')</script>");
    			session1.setAttribute("money", ori_money+money_txt);
    			String path = request.getContextPath();
    			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			response.sendRedirect(basePath+"main.jsp");
    			Date date= new Date(System.currentTimeMillis());
    			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			String time = dateFormat.format(date);
    			
    			String select ="select money from user where username='"+name+"'";
    			ResultSet moneyrs = myconn.GetDataReader(select);
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
    			String recordsql = "insert into record values('"+name+"','"+time+"','´æ¿î',"+money_txt+","+nowmoney+")";
    			myconn.ExecuteSql(recordsql);
    			
    			myconn.close();
            	return;
    		}
    	}
    	else if(choice.equals("2")){
    		if(ori_money-money_txt<0){
    			request.setAttribute("message2","<script>alert('negative!')</script>");
    			String path = request.getContextPath();
    			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			response.sendRedirect(basePath+"main.jsp");
            	return;
    		}
    		Myconn myconn=new Myconn();
    		myconn.connectdatabase();
    		String sql="update user set money=money-'"+money_txt+"' where username='"+name+"'";
    		int i=myconn.GetRegisterInfo(sql);
    		if(i<0){
    			request.setAttribute("message2","<script>alert('withdraw failed')</script>");
    			String path = request.getContextPath();
    			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			response.sendRedirect(basePath+"main.jsp");
            	myconn.close();
            	return;
    		}
    		else{
    			request.setAttribute("message2","<script>alert('withdraw successfully')</script>");
    			session1.setAttribute("money", ori_money-money_txt);
    			String path = request.getContextPath();
    			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			response.sendRedirect(basePath+"main.jsp");
    			
    			
    			Date date= new Date(System.currentTimeMillis());
    			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			String time = dateFormat.format(date);
    			
    			String select ="select money from user where username='"+name+"'";
    			ResultSet moneyrs = myconn.GetDataReader(select);
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
    			
    			String recordsql = "insert into record values('"+name+"','"+time+"','È¡¿î',"+(-money_txt)+","+nowmoney+")";
    			myconn.ExecuteSql(recordsql);
            	myconn.close();
            	return;
    		}
    	}
    }
	
}
