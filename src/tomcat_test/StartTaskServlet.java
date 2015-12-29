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

@WebServlet(name="StartTaskServlet",urlPatterns={"/starttask"})
public class StartTaskServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public StartTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String taskname=request.getParameter("starttask_text");
    	 String path = request.getContextPath();
		 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		if(taskname==null){
		//	System.out.println(value);
			
			
			response.sendRedirect(basePath+"main.jsp");
			return;
		//	System.out.println(username);
		}
		
    	
    	System.out.println(taskname);
    	AllTask.getAllTask().runATask(taskname);
    	response.sendRedirect(basePath+"main.jsp");
    }
}
