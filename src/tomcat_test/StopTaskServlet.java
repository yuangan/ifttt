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

@WebServlet(name="StopTaskServlet",urlPatterns={"/stoptask"})
public class StopTaskServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public StopTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String taskname=request.getParameter("stoptask_text");
    	 String path = request.getContextPath();
		 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		if(taskname==null){
			response.sendRedirect(basePath+"main.jsp");
			return;
		}
    	System.out.println(taskname);
    	AllTask.getAllTask().stopATask(taskname);
    	response.sendRedirect(basePath+"main.jsp");
    }
}
