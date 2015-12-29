<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
       <style type="text/css">

      body{background-color:#bec0c2;}
      table{border-spacing:0px; border:0px solid #43a102; width:100%;}
      td, th{padding:2px 5px;border-collapse:collapse;text-align:left; font-weight:normal;}
      thead tr th{background:#B0D1FC;border:0px solid white;}
      thead tr th.line1{background:#D3E5FD;}
      thead tr th.line4{background:#C6C6C6;}
      tbody tr td{height:50px;background:#CBE2FB;border:1px solid white; vertical-align:center;}
      tbody tr td.line4{background:#D5D6D8;}
      tbody tr th{height:50px;background: #43a102;border:0px solid white; vertical-align:center;}
      caption,tfoot{display:"";}
      
    
      .button{
      width: 140px;
      line-height: 38px;
      text-align: center;
      font-weight: bold;
      color: #fff;
      text-shadow:1px 1px 1px #333;
      border-radius: 5px;
      margin:0 20px 20px 0;
      position: relative;
      overflow: hidden;
      
      }
      .button:nth-child(6n){
      margin-right: 0;
      }

      .button.yellow{
      border:1px solid #d2a000;
      box-shadow: 0 1px 2px #fedd71 inset,0 -1px 0 #a38b39 inset,0 -2px 3px #fedd71 inset;
      background: -webkit-linear-gradient(top,#fece34,#d8a605);
      background: -moz-linear-gradient(top,#fece34,#d8a605);
      background: linear-gradient(top,#fece34,#d8a605);
      
      }

      .yellow:hover{
      background: -webkit-linear-gradient(top,#ffd859,#e3bb38);
      background: -moz-linear-gradient(top,#ffd859,#e3bb38);
      background: linear-gradient(top,#ffd859,#e3bb38);
      }

      .yellow:active{
      top:1px;
      box-shadow: 0 1px 3px #816b1f inset,0 3px 0 #fff;
      background: -webkit-linear-gradient(top,#d3a203,#dba907);
      background: -moz-linear-gradient(top,#d3a203,#dba907);
      background: linear-gradient(top,#d3a203,#dba907);
      }


</style>
<script type="text/javascript">
 function AllSelect()
{
	var items=document.all['message'];
	
	if(items.length)
	{
		
		var flag=1;
		if(items[0].checked==true)
			flag=0;
		for(var i=0;i <items.length;i++){
			if(flag==1)
				items[i].checked=true;
			else
				items[i].checked=false;
		   }
	}
}
 

  function Check(){
	  var items=document.all['message'];
		
		if(items.length)
		{
		  var index=0;
		  var chooseIndex=0;
		  for(var i=0;i <items.length;i++){
				
					if(items[i].checked==true)
						{ index++;
						  chooseIndex = i;
						}
				
			   }
		  if(index==0)
		  alert("You should choose!");
		  else if(index>1)
			  alert("You can only modify one item everytime!");
		  else{
			  
			  document.getElementById("modifymsg").value=(items[chooseIndex].value.toString()).split("\\$")[1]; 
			  $('#myModal').modal('show') ;
			  //document.getElementById("button").click=true;
			  return false;
		  }
		}
		
		return false;
  }
  function CheckModify()
  {
	  document.getElementById("hidden").value="1";
	  if(document.getElementById("modifymsg").value==""||document.getElementById("modifymsg").value==null)
		  {
		    alert("Please enter message");
		    return false;
		  }
	  return true;
  }
</script>
</head>
<body>
<div>
<% HttpSession session1 = request.getSession();
int flag=0;
if(session1.getAttribute("level").toString().equals("admin"))
	  flag=1;
 %>
<form action="deletemessage" method="post" id="deletemessage" name="deletemessage">
<div><br/>
<table border="0" cellpadding="10" cellspacing="10" class="hovertable">
<caption><b>Private Message</b></caption>

<tr>
<th>CHOOSE</th>
<% if(flag==0){ %>
<th>SENDER</th>
<% }else { %>
<th>RECEIVER</th>
<%}; %>
<th>CONTENT</th>
<th>TIME</th>
<th>TYPE</th>
</tr>
<% 
      Myconn myconn=new Myconn();
      myconn.connectdatabase();
      HttpSession session2 = request.getSession();
      String user = (String) session2.getAttribute("username");
      String sql;
      
      if(flag==0)
      sql="select sender,content,time,type from message where receiver = "+"'"+user+"' and type = 'private'";
      else
      sql="select receiver,content,time,type from message where sender = "+"'"+user+"' and type = 'private'";
      
     
      ResultSet rs=myconn.GetDataReader(sql);
      try{
          while(rs.next()){
              	String sender=rs.getString(1);
               	String content=rs.getString(2);
               	String time=rs.getString(3);
               	String type=rs.getString(4);
                if(type!=null&&!type.equals("public")){
               	//int index = time.indexOf(" ");time.substring(0, index)+"$"+time.substring(index+1, time.length())
               	String value=sender+"$"+content+"$"+time+"$"+type+"$";

%>
	<tr>
	<td>
	<%  %>
	
	<input type="checkbox" style="vertical-align:middle;"  name="message" id="message" value="<%=value%>" />

	
	</td>
	<td><%=sender %></td>
	<td><%=content %></td>
	<td><%=time %></td>
	<td><%=type %></td>
	</tr>
	<% };%>
<% }
}
      catch(SQLException e){
          	e.printStackTrace();
            };
%>
</table>
</div>
 <div>
<table border="0" cellpadding="10" cellspacing="10" class="hovertable">
<caption><b>Public Message</b></caption>

<tr>
<th>CHOOSE</th>
<th>SENDER</th>
<th>CONTENT</th>
<th>TIME</th>
<th>TYPE</th>
</tr>
<%
      
      myconn.connectdatabase();
      
      user = (String) session2.getAttribute("username");
      if(flag==0)
      sql="select sender,content,time,type from message where receiver = "+"'"+user+"' and type = 'public' ";
      else
      sql="select distinct sender,content,time,type from message where type = 'public'"; 
      rs=myconn.GetDataReader(sql);
      try{
          while(rs.next()){
              	String sender=rs.getString(1);
               	String content=rs.getString(2);
               	String time=rs.getString(3);
               	String type=rs.getString(4);
               	if(type!=null&&type.equals("public")){
               	//int index = time.indexOf(" ");time.substring(0, index)+"$"+time.substring(index+1, time.length())
               	String value=sender+"$"+content+"$"+time+"$"+type+"$";
               	
               	%>
	<tr>
	<td>
	<%if(flag==1){  %>
	
	<input type="checkbox" style="vertical-align:middle;"  name="message" id="message" value="<%=value%>" />
    
	<%} %>
	</td>
	<td><%=sender %></td>
	<td><%=content %></td>
	<td><%=time %></td>
	<td><%=type %></td>
	</tr>
	<% };%>
<% }
}
      catch(SQLException e){
          	e.printStackTrace();
            };
    myconn.close();
%>


<div style= "margin:0 auto;width:100%; float:left;">
<br/>
<div style= "margin:0 auto;width:33%; float:left;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="select all" class="button yellow" onclick="AllSelect()" >
</div>

<div style= "margin:0 auto;width:33%; float:left;">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--  
<button class="btn btn-primary btn-lg" id="button"data-toggle="modal" data-target="#myModal" onclick="return Check()">
   modify message
</button>
-->
<% if(flag==1){ %>
<input type="submit" value="modify message" class="button yellow"   onclick="return Check()">
<%} %>

</div>


<div style= "margin:0 auto;width:33%; float:left;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="delete message" class="button yellow"  onclick="document.getElementById('hidden').value='0'" >
</div>
</div>

</table>
 <input type="text" value="" id="hidden" name = "hidden" style="display:none">
</div>
<% %>
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
               Modify Message
            </h4>
         </div>
         <div class="modal-body">
            <div>
            <input type="text" class="form-control"  id="modifymsg" name="modifymsg">
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">exit
            </button>
            <button type="submit" class="btn btn-primary" onclick="return CheckModify()">
               yes
            </button>
         </div>
      </div>
      <!-- /.modal-content -->
</div>
<!-- /.modal -->
</div>
</form>


</div>
</body>
</html>