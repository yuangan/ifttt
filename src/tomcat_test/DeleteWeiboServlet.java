package tomcat_test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="DeleteWeiboServlet",urlPatterns={"/delete_weibo"})
public class DeleteWeiboServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
    public DeleteWeiboServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Myconn conn=new Myconn();
		conn.connectdatabase();
		String sql1="delete from workspace where workid = 2";
		String sql2="select * from workspace where workid = 2";
		ResultSet rs=conn.GetDataReader(sql2);
		try {
			if(!rs.next()){
				request.setAttribute("message_weibo","<script>alert('You have not created weibo')</script> ");
				request.getRequestDispatcher("/admin_delete_work.jsp").forward(request,response);
				conn.close();
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.ExecuteSql(sql1);
		request.setAttribute("message_weibo","<script>alert('delete weibo successfully')</script> ");
		request.getRequestDispatcher("/admin_delete_work.jsp").forward(request,response);
		conn.close();
	}
}
