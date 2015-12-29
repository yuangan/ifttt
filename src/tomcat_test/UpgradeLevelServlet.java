package tomcat_test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="UpgradeLevelServlet",urlPatterns={"/upgrade"})
public class UpgradeLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpgradeLevelServlet() {
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
		String []user=request.getParameter("hidden").toString().split("\\$");
		Myconn myconn=new Myconn();
		myconn.connectdatabase();
		String LevelAfter="diamond";
		if(user[2].equals("upgrade")){
		switch(user[1])
		{
		case "normal":LevelAfter="bronze";break;
		case "bronze":LevelAfter="silver";break;
		case "silver":LevelAfter="gold";break;
		case "gold":LevelAfter="diamond";break;
		}
		}
		else if(user[2].equals("degrade")){
		LevelAfter = "normal";
		switch(user[1]){
		case "diamond":LevelAfter="gold";break;
		case "bronze":LevelAfter="normal";break;
		case "silver":LevelAfter="bronze";break;
		case "gold":LevelAfter="silver";break;
		}	
		}
		String sql="update user set level = '"+LevelAfter+"' where username = '"+user[0]+"'";
		myconn.ExecuteSql(sql);
		myconn.close();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		response.sendRedirect(basePath+"admin_check_info.jsp");
		
	}

}
