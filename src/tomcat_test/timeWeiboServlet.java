package tomcat_test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="timeWeiboServlet",urlPatterns={"/create_timeweibo"})
public class timeWeiboServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public timeWeiboServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO:add timer to database
		Myconn conn=new Myconn();
		conn.connectdatabase();
		String sql1="insert into workspace(workid,workname) values (4,'timeWeibo')";
		String sql2="select * from workspace where workid = 4";
		ResultSet rs=conn.GetDataReader(sql2);
		try {
			if(rs.next()){
				request.setAttribute("message_timeweibo","<script>alert('You have created timeweibo')</script> ");
				request.getRequestDispatcher("/admin_create_work.jsp").forward(request,response);
				conn.close();
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.ExecuteSql(sql1);
		request.setAttribute("message_timeweibo","<script>alert('create timeWeibo successfully')</script> ");
		request.getRequestDispatcher("/admin_create_work.jsp").forward(request,response);
		conn.close();
	}
}
