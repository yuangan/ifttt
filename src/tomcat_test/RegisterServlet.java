package tomcat_test;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="RegisterServlet",urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterServlet() {
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
		String Username = request.getParameter("Username"); 
		String Password = request.getParameter("Password"); 
		//String Confirmpwd = request.getParameter("Confirmpwd");
		String Email = request.getParameter("Email");
		String Phone = request.getParameter("Phone");
		String Gender = request.getParameter("optionsRadios");
		String level="normal";
		user1 newuser = new user1();
		newuser.setuser1(Username, Password, Email, Phone, Gender,level);
		int result = newuser.tryregister();
		switch(result){
		   case 1:{	 request.setAttribute("message","<script>alert('same account')</script> ");  break;}
		   case 2:{	 request.setAttribute("message","<script>alert('same email')</script>"); break;}
		   case 3:{	 request.setAttribute("message","<script>alert('same phone')</script>");  break;}
			default: break;
		}
		if(result==4)
	    { String meg= String.format("<script>alert('register sucessfully')</script><meta http-equiv='refresh' content='3;url=%s'", request.getContextPath()+"/index.jsp");
			request.setAttribute("message",meg);
			Date date= new Date(System.currentTimeMillis());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = dateFormat.format(date);
			Myconn con=new Myconn();
			con.connectdatabase();
			String recordsql = "insert into record values('"+Username+"','"+time+"','用户注册成功',1000,1000)";
			con.ExecuteSql(recordsql);
			con.close();
	  
	    }
	    else{
	    	request.setAttribute("message",request.getAttribute("message")+"<script> alert('register failed please register again')</script>");
	    	
	    }
		request.getRequestDispatcher("/Register.jsp").forward(request,response);
	}

}
