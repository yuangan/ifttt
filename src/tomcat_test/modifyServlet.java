package tomcat_test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="modifyServlet",urlPatterns={"/modify"})

public class modifyServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	 public modifyServlet() {
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
			String Username =(String) session1.getAttribute("username");
			 request.setCharacterEncoding("utf-8");
			//String Confirmpwd = request.getParameter("Confirmpwd");
			String Email = request.getParameter("email");
			String Phone = request.getParameter("phone");
			String Gender = request.getParameter("gender");
			String bfpwd= request.getParameter("bfpwd");
			
			String Password = request.getParameter("pwd");
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			
			
			Myconn myconn=new Myconn();
			myconn.connectdatabase();
			
			String pwdsql="select password from user where username='"+Username+"'";
			ResultSet pwdrs=myconn.GetDataReader(pwdsql);
			try {
				
				if(pwdrs.next())
				{
					String dbpwd = pwdrs.getString(1);
					if(request.getParameter("hidden")!=null&&!request.getParameter("hidden").equals("")){
					     if(!dbpwd.equals(bfpwd))
					   {
						  request.setAttribute("message1","<script>alert('password wrong')</script>");
						  //response.sendRedirect(basePath+"modify.jsp");
						  request.getRequestDispatcher("/modify.jsp").forward(request,response);
						
						  myconn.close();
						  return;
					   }
					}
					else
					Password = new String(dbpwd);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			String sql="select * from user where email='"+Email+"' and username!='"+Username+"'";
			ResultSet rs=myconn.GetDataReader(sql);
			try {
				if(rs.next()){
					request.setAttribute("message1","<script>alert('email exists')</script>");
					//response.sendRedirect(basePath+"modify.jsp");
					request.getRequestDispatcher("/modify.jsp").forward(request,response);
					
					myconn.close();
					return;
				}
				
				sql="select * from user where phone='"+Phone+"' and username!='"+Username+"'";
				rs=myconn.GetDataReader(sql);
				if(rs.next()){
					request.setAttribute("message1","<script>alert('phone exists')</script>");
					//response.sendRedirect(basePath+"modify.jsp");
					request.getRequestDispatcher("/modify.jsp").forward(request,response);
					myconn.close();
					return;
				}
				
				sql="update user set email='"+Email+"',phone='"+Phone+"',gender='"+Gender+"',password='"+Password+"' where username='"+Username+"'";
				int i=myconn.GetRegisterInfo(sql);
				if(i<0){
					request.setAttribute("message1","<script>alert('modify failed')</script>");
					//response.sendRedirect(basePath+"modify.jsp");
					request.getRequestDispatcher("/modify.jsp").forward(request,response);
					myconn.close();
					return;
				}
				else{
					request.setAttribute("message1","<script>alert('modify successfully')</script>");
					
					response.sendRedirect(basePath+"main.jsp");
					myconn.close();
					return;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
}
