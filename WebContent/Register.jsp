<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
	<title>Create Account</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
	<script type="text/javascript" >
	
	function gotoindex(){
		window.location.href="index.jsp";
	}
	
	//邮箱格式匹配
	
	function checkEmail(email){
		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (filter.test(email))
		 return true;
		else return false;
		
	}
	
	//1~20为字母开头允许有字母数字点下划线
	function checkUsername(name){
		var filter  = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){0,19}$/;
		if (filter.test(name))
		 return true;
		else return false;
	}
	
	//字母数字5~20位 
	function checkPassword(pwd){
		var filter  = /^(\w){5,20}$/;
		if (filter.test(pwd))
		 return true;
		else return false;
	}
	
	//1开头的11位
	function checkPhone(phone){
		var filter  = /^1\d{10}$/;
		if (filter.test(phone))
		 return true;
		else return false;
	}
	
	function check(form){
		if(form.Username.value==""||!checkUsername(form.Username.value))
			{
			 alert("Please enter correct username!");
             form.Username.focus();
             return false;
			}
		if(form.Password.value==""||!checkPassword(form.Password.value))
		{
		 alert("Please enter password!");
         form.Password.focus();
         return false;
		}
		
		if(form.Password.value!=form.Confirmpwd.value)
		{
			alert("Please enter password and confirmpassword that are the same!");
	         form.Confirmpwd.focus();
	         return false;
		}
		
		
		
		if((form.Email.value=="")||!checkEmail(form.Email.value)){
		 alert("Please enter correct email!");
         form.Email.focus();
         return false;
		}
		
		if(form.Phone.value==""||!checkPhone(form.Phone.value))
		{
		 alert("Please enter Phone!");
         form.Phone.focus();
         return false;
		}
		
		if(form.optionsRadios.value.equals("Female")||form.optionsRadios.value.equals("Male"))
		{
		 alert("Please choose Gender!");
         form.optionsRadios.focus();
         return false;
		}
		
		return true;
	}
	</script>
</head>
<body class="templatemo-bg-gray">
    <form action="register" method="post" id="register">
   
    
         
         
	<h1 class="margin-bottom-15">Create Account</h1>
	
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="#" method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-12">		          	
			            <label for="username" class="control-label">Username</label>
			            <input type="text" class="form-control" name="Username" placeholder="Please enter username" >		            		            		            
			          </div>  
			          <div class="col-md-12">		          	
			            <label for="password" class="control-label">Password</label>
			            <input type="password" class="form-control" name="Password" placeholder="Please enter password">		            		            		            
			          </div>      
			          <div class="col-md-12">
			            <label for="confrimpwd" class="control-label">Confirm Password</label>
			            <input type="password" class="form-control" name="Confirmpwd" placeholder="">
			          </div>       
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">		          	
			            <label for="email" class="control-label">Email</label>
			            <input type="text" class="form-control" name="Email" placeholder="">		            		            		            
			          </div>              
			        </div>			
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="phone" class="control-label">Phone</label>
			            <input type="text" class="form-control" name="Phone" placeholder="">		            		            		            
			          </div>
			          <div class="col-md-6 templatemo-radio-group">
			          	<label class="radio-inline">
		          			<input type="radio" name="optionsRadios" id="optionsRadios1" value="Male"> Male
		          		</label>
		          		<label class="radio-inline">
		          			<input type="radio" name="optionsRadios" id="optionsRadios2" value="Female" checked="checked"> Female
		          		</label>
			          </div>             
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <br/>
			            <input type="submit" value="Create account" class="btn btn-info" onclick="return check(this.form)">
			             <%if(request.getAttribute("message") != null){%> 
                         	<label><%=request.getAttribute("message")%></label>
                         <%} %>
			          </div>
			        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</form>
</body>
</html>