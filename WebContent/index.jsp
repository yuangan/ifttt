<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="task.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Ribbon Login Form Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates"/>
<link href="css/style1.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
function get_main(){
	window.location.href="main.jsp";
}
</script>
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!--/webfonts-->
</head>
<body>
<%AllTask.getAllTask().initAllTask(); %>
<form action="checkuser.jsp" method="post">
<!--start-main-->
<h1>Welcome!<span>Please login...</span></h1>
<div class="login-box">
		
			<input type="text" name="user" class="text" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" >
			<input type="password" name = "pass" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
		
		<div class="remember">
			<a href="#"><p>Remember me</p></a>
			<h4>No Account?<a href="Register.jsp">Click here to Register.</a></h4>
		</div>
		<div class="clear"> </div>
		<div class="btn">
			<input type="submit" value="LOG IN">
			
		</div>
		<div class="clear"> </div>
</div>
<!--//End-login-form-->
<!--start-copyright-->

<!--//end-copyright-->	
</form>	
</body>
</html>