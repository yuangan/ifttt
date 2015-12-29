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

@WebServlet(name="DeleteTaskServlet",urlPatterns={"/deletetask"})
public class DeleteTaskServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public DeleteTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String taskname=request.getParameter("deletetask_text");
		Myconn conn = new Myconn();
		conn.connectdatabase();
		String sql = "delete from userwork where taskName = '"+taskname+"'";
		conn.ExecuteSql(sql);
		conn.close();
    	if(taskname!=null){
    		System.out.println(taskname);
    		AllTask.getAllTask().deleteTask(taskname);
    	}
    	else System.out.println("error");
        String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	    response.sendRedirect(basePath+"main.jsp");
    }
}
