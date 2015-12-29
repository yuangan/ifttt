<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%--public int checkInMySql(String user, String pass){
				try{    
    				Class.forName("com.mysql.jdbc.Driver") ;
    				}
				catch(ClassNotFoundException e){
    				System.out.println("加载驱动失败！");
				    e.printStackTrace() ;
   					 }
				try{
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/experiment2", "root", "112358");
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from job where eno = '" + user + "'");
				while(resultSet.next()){//查找数据库
					if(resultSet.getString(1).equals(pass))
					return 0;
					else return 1;//密码错误 
				}
				connection.close();
				}
				catch(SQLException sqle){
					sqle.printStackTrace();
				}
			return 2;//无用户名
			}
			 --%>
 
 <%
			 String user = request.getParameter("user");
			 String pass = request.getParameter("pass");
			 HttpSession session1 = request.getSession(); 
			 user1 u = new user1();
			 u.setLogUser(user, pass);
			 switch(u.trylogin()){
			 case 1:
//			 	out.print("log in successfully, you will enter another page after 3 seconds......");
                session1.setAttribute("username",u.getusername() );
                session1.setAttribute("email",u.getemail());
                session1.setAttribute("phone",u.getphone());
                session1.setAttribute("level", u.getlevel());
                session1.setAttribute("money",u.getmoney());
                session1.setAttribute("islogin",u.getstatus());
			 	out.println("<script>alert('login sucessfully,you will enter another page after 3 seconds......');</script>");
			 	request.setAttribute("usr", u);
			 	%>
			 	
			<meta http-equiv="refresh" content="3; url=main.jsp?&name = usr">
			<% 	break;
			 case -1:
//			 	out.print("log in fail, wrong password, you will back after 3 seconds......");
                session1.setAttribute("islogin",u.getstatus());
			 	out.println("<script>alert('log in fall,wrong password,you will be back after 3 secondes......');</script>");
			 	%>
			 	
			<meta http-equiv="refresh" content="3; url=index.jsp">
 		
			<%	break;
			 case -2:
//				out.print("log in fail, no such username, you will back after 3 seconds......");
                session1.setAttribute("islogin",u.getstatus());
				out.println("<script>alert('og in fail, no such username, you will be back after 3 seconds......');</script>");
				%>
				
			<meta http-equiv="refresh" content="3; url=index.jsp">
			<%	break;
			 default:
				 out.println("<script>alert('unknown mistake');</script>");
			 }
			 
			 %>
</body>
</html>