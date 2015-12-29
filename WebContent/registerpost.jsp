<%@ page language="java" import="java.util.*,tomcat_test.user1" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
 <%@page import="java.sql.*"%>

  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   
   <% 
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
   case 1:{	 out.println("<script>alert('same account');</script>");  break;}
   case 2:{	 out.println("<script>alert('same email');</script>"); break;}
   case 3:{	 out.println("<script>alert('same phone');</script>");  break;}
	default: break;
}
//System.out.println(Username);
 //  ResultSet rs=null; 
     //String str="select id,name,date,text from User where name='"+name+"';"; 
      //query.connect(); 
      //rs=query.select(str); 
        // rs.last();
    /* String str="insert into info (Username,Password,Email,Phone,Gender)values('"+Username+"','"+Password+"','"+Email+"','"+Phone+"','"+gender+"');";
    query.update(str);
    query.close();
    */
    //out.println("asgagdï¼");
    //out.print("dagï¼");
    if(result==4)
    {
    	
    out.println("<script>alert('register sucessfully');</script>");
    out.print("<meta   http-equiv="+"refresh"+"  content=" +"3;url=index.jsp"+">");
    
    // alert("zucechengg");
    }
    else{
    	out.println("<script>alert('register failed please register again');</script>");
        out.print("<meta   http-equiv="+"refresh"+"  content=" +"3;url=Register.jsp"+">");	
    }
     //request.window.location.href="Register.jsp";
    %>

</body>
</html>