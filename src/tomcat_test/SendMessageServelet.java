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


@WebServlet(name="SendMessageServlet",urlPatterns={"/sendmessage"})
public class SendMessageServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SendMessageServelet() {
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
		String sender = (String) session1.getAttribute("username");
		String receivertotal= request.getParameter("receiveruser");
		String content = request.getParameter("messageforsend");
		String []receiver = receivertotal.split(";");
		Date date= new Date(System.currentTimeMillis());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(date);
		Myconn connect  = new Myconn();
		connect.connectdatabase();
		
		try {
			ResultSet result =  connect.GetDataReader("select count(*) from user where level != 'admin'");
			result.next();
			String type;
			if(Integer.parseInt(result.getString(1))==receiver.length)
				type="public";
			else type="private";
			for(int i=0;i<receiver.length;i++)
			{
				String sql = "insert into message values('"+sender+"','"+receiver[i]+"','"+content+"','"+time+"','"+type+"')";
			    connect.ExecuteSql(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		response.sendRedirect(basePath+"main.jsp");
		connect.close();
	}

}
