<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 function self(){
     //document.upgrade.submit();
}
 </script>
</head>
<body>
<form action="upgrade" id="upgrade" method="post" name="upgrade">
<table  class="table table-striped" align="center" style="vertical-align:middle; width:100%" >
<caption><b>User Info</b></caption>
<br/>
<tr>

<th style="width:20%">name   </th>
<th style="width:20%">gender   </th>
<th style="width:20%">money   </th>
<th style="width:20%">Level   </th>
<th style="width:20%"> </th>

</tr>
<%
Myconn myconn=new Myconn();
myconn.connectdatabase();
String sql="select * from user";
ResultSet rs=myconn.GetDataReader(sql);
ArrayList<String> users=new ArrayList<String>();
int userindex=0;
try{
while(rs.next()){
	String username=rs.getString(1);
	String level=rs.getString(6);
	String gender=rs.getString(5);
	users.add(new String(username));
	int money=Integer.parseInt(rs.getString(7));
	%>
	<tr>
	
	
	<td><%=username %></td>
	<td><%=gender %></td>
	<td><%=money %></td>
	<td><%=level %></td>
	
	<td>
	
    <%if(level.equals("admin")){ %>
	<button type="button" class="btn btn-default btn-xs" value="<%=username%>" disabled="disabled" >UPGRAGE</button>
	<%}else{ %>
	<button type="submit" class="btn btn-default btn-xs" value="<%=username+"$"+level+"$"+"upgrade"+"$"%> " onclick="document.getElementById('hidden').value=this.value;if(this.value.split('\\$')[1]=='diamond') alert('Diamond is the highest level');" >UPGRAGE</button>
	<%}; %>
	&nbsp;
	<%if(level.equals("admin")){ %>
	<button type="button" class="btn btn-default btn-xs" value="<%=username%>" disabled="disabled" >DEGRAGE</button>
	<%}else{ %>
	<button type="submit" class="btn btn-default btn-xs" value="<%=username+"$"+level+"$"+"degrade"+"$"%> " onclick="document.getElementById('hidden').value=this.value;if(this.value.split('\\$')[1]=='normal') alert('Normal is the lowest level');" >DEGRAGE</button>
	<%}; %>
	&nbsp;
	<button type="button" class="btn btn-default btn-xs" value="<%=username%>"  data-toggle="modal" 
   data-target="#<%=username %>" >RECORD</button>
    
	</td>
	</tr>
	
<% }; }
catch(SQLException e){ 
	e.printStackTrace();
}; 
myconn.close();
%>
</table>

<input type="text" value="" id="hidden" name="hidden" style="display:none">

&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn btn-info btn-sm" onclick="window.location.href='main.jsp';">TURN BACK</button>
</form>
<!-- 模态框（Modal） -->
<% for(int i=0;i<users.size();i++) {
  String username=users.get(i);%>
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
<%} %>
</body>
</html>