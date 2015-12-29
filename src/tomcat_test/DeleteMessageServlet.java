package tomcat_test;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="DeleteMessageServlet",urlPatterns={"/deletemessage"})
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session1 = request.getSession();
		String receiver = (String) session1.getAttribute("username");
		int flag=0;
		if(session1.getAttribute("level").toString().equals("admin"))
			  flag=1;
		
		int MorD = Integer.parseInt(request.getParameter("hidden").toString());
		
		 Myconn myconn=new Myconn();
	     myconn.connectdatabase();
		String[] values = request.getParameterValues("message") ;
		   if(values!=null&&values.length>0) {
			   /*for(int i= 0 ;i<values.length;i++)
		         {
				    System.out.println(values[i].toString());
		         }*/
			    
		        for(int i= 0 ;i<values.length;i++)
		         {
		        	
		        	String []item=(values[i].toString()).split("\\$");
		        	if(flag==0){
		            String sql="delete from message where "+"sender = '"+item[0]+"' and receiver = '"+receiver+"' and content = '"+item[1]+"' and time = '"+item[2]+"'"+" and type = '"+item[3]+"'";
		            myconn.ExecuteSql(sql);
		        	}
		        	else
		        	{
		        		if(item[3].equals("private"))
		        		{
		        			String sql="delete from message where "+"receiver = '"+item[0]+"' and sender = '"+receiver+"' and content = '"+item[1]+"' and time = '"+item[2]+"'"+" and type = '"+item[3]+"'";
				            myconn.ExecuteSql(sql);
		        		}
		        		else{
		        			String sql="delete from message where "+"sender = '"+item[0]+"' and content = '"+item[1]+"' and time = '"+item[2]+"'"+" and type = '"+item[3]+"'";
				            myconn.ExecuteSql(sql);
		        		}
		        	}
		        	if(MorD==1)
		        	{
		        		Date date= new Date(System.currentTimeMillis());
		        		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        		String time = dateFormat.format(date);
		        		String modify = request.getParameter("modifymsg") ;
		        		if(item[3].equals("private"))
		        		{
		        			String sql="insert into message values('"+receiver+"','"+item[0]+"','"+modify+"','"+time+"','private')";
				            myconn.ExecuteSql(sql);
		        		}
		        		else
		        		{
		        			ResultSet rs = myconn.GetDataReader("select * from user where level != 'admin'");
		        			try {
								while(rs.next())
								{
									String user = rs.getString(1);
									String sql="insert into message values('"+receiver+"','"+user+"','"+modify+"','"+time+"','public')";
									myconn.ExecuteSql(sql);
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
		        		}
		        	}
		         }
		   }
		   request.getRequestDispatcher("/main.jsp").forward(request,response);
		   myconn.close();
	}

}
