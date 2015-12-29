<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
	<title>Modify Information</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" >
	

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
		
		
		if((form.email.value=="")||!checkEmail(form.email.value)){
		 alert("Please enter correct email!");
         form.Email.focus();
         return false;
		}
		
		else if(form.phone.value==""||!checkPhone(form.phone.value))
		{
		 alert("Please enter correct Phone!");
         form.Phone.focus();
         return false;
		}
		
		document.getElementById("email").disabled="";
		document.getElementById("phone").disabled="";
		document.getElementById("gender").disabled="";
		
		return true;
	}
	
	function changeGender()
	{ 
		if(document.getElementById("gender").value=="Male")
		{ 
			document.getElementById("gender").value="Female";
		} 
		else {
			document.getElementById("gender").value="Male";
		}
	}
	
	function modifypassword(){
		
		var bfpwd = document.getElementById("bfpwd").value;
		
		var username =document.getElementById("username").value;
		
        var dbpwd = document.getElementById("hidden").value;
       
        var newpwd =  document.getElementById("pwd").value;
        var cfmpwd =  document.getElementById("cfmpwd").value;
        
        if(newpwd!=cfmpwd)
        {
        	alert("更改密码不匹配，失败！");
    		return;
        }
        
        if(!checkPassword(newpwd))
        {
        	alert("新设密码格式不匹配(5-20位数字或字母)，失败！");
    		return;
        }
        
        document.getElementById("hidden").value=bfpwd+"$"+newpwd;
       // alert("密码缓存成功，但只有点击提交才能完全更改密码！");
	}
	</script>
</head>
<!--  
<body class="templatemo-bg-gray">
    <form action="modify" method="post" id="modify">
   
    
         
         
	<h1 class="margin-bottom-15">Modify Information</h1>
	
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="#" method="post">
				<div class="form-inner">
				<%-- HttpSession session1 = request.getSession(); --%>
					<div class="form-group">
			        
			         
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">		          	
			            <label for="email" class="control-label">Email</label>
			            <input type="text" class="form-control" name="Email" value=<%--=session1.getAttribute("email") %>>		            		            		            
			          </div>              
			        </div>			
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="phone" class="control-label">Phone</label>
			            <input type="text" class="form-control"  name="Phone" value=<%--=session1.getAttribute("phone") %>>		            		            		            
			          </div>
			                     
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <br/>
			            <input type="submit" value="Modify Information" class="btn btn-info" onclick="return check(this.form)">
			            <%-- <%if(request.getAttribute("message1") != null){%> 
                         	<label><%=request.getAttribute("message1")%></label>
                         <%} --%>
			          </div>
			        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</form>
	-->
<body>
 <form class="bs-example bs-example-form" role="form" action="modify" method="post" id="modify">
   <div style="padding: 100px 100px 10px;">
         <h1><b>Self   Info</b></h1>
       <% HttpSession session1 = request.getSession();
          Myconn con1 = new Myconn();
          String consql = "select * from user where username = '"+session1.getAttribute("username").toString()+"'";
          con1.connectdatabase();
          ResultSet rs1 = con1.GetDataReader(consql);
          if(rs1.next())
          { String email = rs1.getString(3);
            String phone = rs1.getString(4);
            String gender = rs1.getString(5);
            String level = rs1.getString(6);
            String money=rs1.getString(7);
            con1.close();%>
       <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-user"></span>
         </span>
         
         <input type="text" class="form-control "id="username" name="username" placeholder="USERNAME" disabled="disabled" value=<%=session1.getAttribute("username") %>>
         
         <span class="input-group-btn">
             <button class="btn btn-default " type="button" data-toggle="modal" data-target="#myModal">
                    修改密码
             </button>
             
         </span>
       </div><br>

      <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-envelope"></span>
         </span>
         
         <input type="text" class="form-control " id="email" name="email" placeholder="EMAIL" disabled="disabled" value=<%=email %>>
         
         <span class="input-group-btn">
             <button class="btn btn-default " type="button" onclick="document.getElementById('email').disabled=''">
                    修改
             </button>
             
         </span>
       </div><br>

        <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-phone"></span>
         </span>
         
         <input type="text" class="form-control " id="phone" name="phone" placeholder="PHONE" disabled="disabled" value=<%=phone %>>
         
         <span class="input-group-btn">
             <button class="btn btn-default " type="button" onclick="document.getElementById('phone').disabled=''">
                    修改
             </button>
             
         </span>
       </div><br>
       
       <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-heart"></span>
         </span>
         <input type="text" class="form-control " id="gender" name="gender" placeholder="GENDER" disabled="disabled" value=<%=gender %>>
         
         <span class="input-group-btn">
             <button class="btn btn-default " type="button" onclick="changeGender()">
                    修改
             </button>
             
         </span>
       </div><br>
       
       
       <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-usd"></span>
         </span>
         
         <input type="text" class="form-control " placeholder="MONEY" disabled="disabled" value=<%=money %> >
         
         <span class="input-group-btn">
             <button class="btn btn-default " type="button" data-toggle="modal" data-target="#<%=session1.getAttribute("username") %>" >
                    查看
             </button>
             
         </span>
       </div><br>
       
       <div class="input-group input-group-lg">
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-star"></span>
         </span>
         
         <input type="text" class="form-control " placeholder="LEVEL" disabled="disabled" value=<%=session1.getAttribute("level") %>>
       
       </div><br>
       
      
        <button type="submit" class="btn btn-primary btn-lg btn-block" onclick="return check(this.form);">
                       提交
        </button>
       <%if(request.getAttribute("message1") != null){%> 
                         	<label><%=request.getAttribute("message1")%></label>
        <%} %>
        <button type="button" class="btn btn-danger btn-lg btn-block" onclick="window.location.href = 'main.jsp'">
                     返回 
        </button>
        
 <% String username = session1.getAttribute("username").toString(); %>
 <div class="modal fade" id=<%=username %> tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true" >
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
                消费记录
            </h4>
         </div>
         <div class="modal-body">
            
            <table  class="table table-striped table-bordered table-condensed" align="center" style="vertical-align:middle; width:100%" >
            
               <tr>

                <th style="width:30%">Time   </th>
                <th style="width:30%">Affair   </th>
                <th style="width:20%">Amount   </th>
                <th style="width:20%">Balance   </th>
                </tr>
                <% Myconn con = new Myconn();
                   con.connectdatabase();
                   String recordSql="select * from record where username = '"+username+"'";
                   ResultSet rst = con.GetDataReader(recordSql);
                   while(rst.next()){
                	   String time = rst.getString(2).toString().substring(0, rst.getString(2).toString().lastIndexOf("."));
                	   String affair = rst.getString(3);
                	   int amount = Integer.parseInt(rst.getString(4));
                	   int balance = Integer.parseInt(rst.getString(5)); %>
                <tr>
                   
                    <td><%=time %></td>
                    <td><%=affair %></td>
                    <td><%=amount %></td>
                    <td><%=balance %></td>
                    
                </tr>
                <%   }
                   con.close();
                %>
            
            </table>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            
         </div>
      </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>
       
       
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               修改密码
            </h4>
         </div>
         <div class="modal-body">
              <lable> <b>原先密码 :</b></lable>
              <input type="text" id="bfpwd" name="bfpwd"class="form-control">
              <br/>
              
              <lable> <b>更改密码 :</b></lable>
              <input type="text" id="pwd" name="pwd" class="form-control">
              <br/>
              
              <lable> <b>确认密码 :</b></lable>
              <input type="text" id="cfmpwd" name="cfmpwd" class="form-control">
              <br/>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="modifypassword()">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
       
       <input type="text" value="" id="hidden" name="hidden" style="display:none">
        
     <%} %>
  </div>
  </form>
</body>
</html>