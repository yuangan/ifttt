<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
	<link href="css/flexslider.css" rel="stylesheet" />
	<link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <link href="css/aboutus.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">
	
	<script type="text/javascript">
	function addtimer(){
		var div=document.createElement("div");
		div.style.position="absolute";
		div.style.left="500px";
		div.style.top="300px";
		div.style.width="300px";
		div.style.height="65px";
		div.style.backgroundColor="white";
		div.style.filter="alpha(opacity=40)";
		div.style.opacity=.4;
		div.setAttribute("id","div");
		var div2=document.createElement("div");
		var input1=document.createElement("input");
		input1.type="text";
		input1.value=document.getElementById("timer_input").value;
		input1.setAttribute("id","test");
		div2.appendChild(input1);
		
		var input2=document.createElement("input");
		input2.type="button";
		input2.value="submit";
		input2.onclick=subtimer;
		div2.appendChild(input2);
		var input3=document.createElement("input");
		input3.type="button";
		input3.value="cancel";
		input3.onclick=canceltimer;
		div2.appendChild(input3);
		var c=document.createElement("left");
		c.appendChild(div2);
		div.appendChild(c);
		document.body.appendChild(div);
		}
		function subtimer(){
			
            var testtime=document.getElementById("test").value;
			
			var filter  = /^\d{4}-[0-1][0-9]-[0-3][0-9] [0-2][0-9]:[0-5][0-9]$/;
			if (!filter.test(testtime))
			 {
				alert("Please enter correct time format!");
				return false;
				
			 }
			
		    document.getElementById("if_select").value="1";
		    var timer_input=document.getElementById("timer_input");
		    var div_input=document.getElementById("test");
		    timer_input.value=div_input.value;
		   
		    
		}
		function canceltimer(){
		var p=document.getElementById("div");
		document.body.removeChild(p);
		}
		
		function addweibo(){
			var div1=document.createElement("div");
			div1.style.position="absolute";
			div1.style.left="500px";
			div1.style.top="300px";
			div1.style.width="200px";
			div1.style.height="165px";
			div1.style.backgroundColor="white";
			div1.style.filter="alpha(opacity=40)";
			div1.style.opacity=.4;
			div1.setAttribute("id","div1");
			var div2=document.createElement("div");
			var input1=document.createElement("input");
			input1.type="text";
			input1.value=document.getElementById("if_select_weibo_username").value;
			input1.setAttribute("id","weibo_username");
			input1.setAttribute("name","weibo_username");
			input1.style.width="200px";
			div2.appendChild(input1);
			var input4=document.createElement("input");
			input4.type="password";
			input4.value=document.getElementById("if_select_weibo_pwd").value;
			input4.setAttribute("id","weibo_pwd");
			input4.setAttribute("name","weibo_pwd");
			input4.style.width="200px";
			div2.appendChild(input4);
			var inputarea=document.createElement("textarea");
			inputarea.setAttribute("id","if_weibo_textarea");
			inputarea.setAttribute("name","if_weibo_textarea");
			inputarea.innerHTML=document.getElementById("if_select_weibo_content").value;
			inputarea.style.width="200px";
			div2.appendChild(inputarea);
			var input2=document.createElement("input");
			input2.type="button";
			input2.value="submit";
			input2.onclick=subweibo;
			div2.appendChild(input2);
			var input3=document.createElement("input");
			input3.type="button";
			input3.value="cancel";
			input3.onclick=cancelweibo;
			div2.appendChild(input3);
			var c=document.createElement("left");
			c.appendChild(div2);
			div1.appendChild(c);
			document.body.appendChild(div1);
			}
			function subweibo(){
				document.getElementById("if_select").value="2";
			    document.getElementById("if_select_weibo_username").value=document.getElementById("weibo_username").value;
			    document.getElementById("if_select_weibo_pwd").value=document.getElementById("weibo_pwd").value;
				document.getElementById("if_select_weibo_content").innerHTML=document.getElementById("if_weibo_textarea").value;
			}
			function cancelweibo(){
			var p=document.getElementById("div1");
			document.body.removeChild(p);
			}
			
			function addmail(){
				var div1=document.createElement("div");
				div1.style.position="absolute";
				div1.style.left="500px";
				div1.style.top="300px";
				div1.style.width="200px";
				div1.style.height="100px";
				div1.style.backgroundColor="white";
				div1.style.filter="alpha(opacity=40)";
				div1.style.opacity=.4;
				div1.setAttribute("id","div2");
				var div2=document.createElement("div");
				var input1=document.createElement("input");
				input1.type="text";
				input1.value=document.getElementById("if_select_mail_username").value;
				input1.setAttribute("id","mail_username");
				input1.setAttribute("name","mail_username");
				div2.appendChild(input1);
				var input4=document.createElement("input");
				input4.type="password";
				input4.value=document.getElementById("if_select_mail_pwd").value;
				input4.setAttribute("id","mail_pwd");
				input4.setAttribute("name","mail_pwd");
				div2.appendChild(input4);
				
				var input2=document.createElement("input");
				input2.type="button";
				input2.value="submit";
				input2.onclick=submail;
				div2.appendChild(input2);
				var input3=document.createElement("input");
				input3.type="button";
				input3.value="cancel";
				input3.onclick=cancelmail;
				div2.appendChild(input3);
				var c=document.createElement("left");
				c.appendChild(div2);
				div1.appendChild(c);
				document.body.appendChild(div1);
				}
				function submail(){
				
					document.getElementById("if_select").value="3";
				    document.getElementById("if_select_mail_username").value=document.getElementById("mail_username").value;
				    document.getElementById("if_select_mail_pwd").value=document.getElementById("mail_pwd").value;
				}
				function cancelmail(){
				var p=document.getElementById("div2");
				document.body.removeChild(p);
				}
				
				function addtimeweibo(){
					var div1=document.createElement("div");
					div1.style.position="absolute";
					div1.style.left="500px";
					div1.style.top="300px";
					div1.style.width="200px";
					div1.style.height="85px";
					div1.style.backgroundColor="white";
					div1.style.filter="alpha(opacity=40)";
					div1.style.opacity=.4;
					div1.setAttribute("id","div_timeweibo");
					var div2=document.createElement("div");
					var inputtime=document.createElement("input");
					inputtime.type="text";
					inputtime.value=document.getElementById("timer_input").value;
					inputtime.setAttribute("id","timeweibo_time");
					inputtime.setAttribute("name","timeweibo_time");
					inputtime.style.width="200px";
					div2.appendChild(inputtime);
					var input1=document.createElement("input");
					input1.type="text";
					input1.value=document.getElementById("if_select_timeweibo_username").value;
					input1.setAttribute("id","timeweibo_username");
					input1.setAttribute("name","timeweibo_username");
					input1.style.width="200px";
					div2.appendChild(input1);
					var input4=document.createElement("input");
					input4.type="password";
					input4.value=document.getElementById("if_select_timeweibo_pwd").value;
					input4.setAttribute("id","timeweibo_pwd");
					input4.setAttribute("name","timeweibo_pwd");
					input4.style.width="200px";
					div2.appendChild(input4);
					
					var input2=document.createElement("input");
					input2.type="button";
					input2.value="submit";
					input2.onclick=subtimeweibo;
					div2.appendChild(input2);
					var input3=document.createElement("input");
					input3.type="button";
					input3.value="cancel";
					input3.onclick=canceltimeweibo;
					div2.appendChild(input3);
					var c=document.createElement("left");
					c.appendChild(div2);
					div1.appendChild(c);
					document.body.appendChild(div1);
					}
					function subtimeweibo(){
						var testtime=document.getElementById("timeweibo_time").value.toString();
						
						var filter  = /^\d{2}:[0-5][0-9]$/;
						if (!filter.test(testtime))
						 {
							alert("Please enter correct time format!");
							return false;
							
						 }
						
						document.getElementById("if_select").value="4";
						var timer1=document.getElementById("timer_input");
					    timer1.value=document.getElementById("timeweibo_time").value;
					    document.getElementById("if_select_timeweibo_username").value=document.getElementById("timeweibo_username").value;
					    document.getElementById("if_select_timeweibo_pwd").value=document.getElementById("timeweibo_pwd").value;
					   
						     
					}
					function canceltimeweibo(){
					var p=document.getElementById("div_timeweibo");
					document.body.removeChild(p);
					}
				
				function addthenweibo(){
					var div1=document.createElement("div");
					div1.style.position="absolute";
					div1.style.left="600px";
					div1.style.top="600px";
					div1.style.width="200px";
					div1.style.height="100px";
					div1.style.backgroundColor="white";
					div1.style.filter="alpha(opacity=40)";
					div1.style.opacity=.4;
					div1.setAttribute("id","div_then_weibo");
					var div2=document.createElement("div");
				//	var label_username=document.createElement("<label>username</label>")
				//	div2.appendChild(label_username);
					var input1=document.createElement("input");
					input1.type="text";
					input1.value=document.getElementById("then_select_weibo_username").value;
					input1.setAttribute("id","weibo_then_username");
					input1.setAttribute("name","weibo_then_username");
					input1.style.width="200px";
					div2.appendChild(input1);
				//	var label_password=document.createElement("<label>password</label>");
				//	div2.appendChild(label_password);
					var input4=document.createElement("input");
					input4.type="password";
					input4.value=document.getElementById("then_select_weibo_pwd").value;
					input4.setAttribute("id","weibo_then_pwd");
					input4.setAttribute("name","weibo_then_pwd");
					input4.style.width="200px";
					div2.appendChild(input4);
					
					var inputarea=document.createElement("textarea");
					inputarea.setAttribute("id","weibo_textarea");
					inputarea.setAttribute("name","weibo_textarea");
					inputarea.innerHTML=document.getElementById("then_select_weibo_content").value;
					inputarea.style.width="200px";
					div2.appendChild(inputarea);
					
					
					
					var input2=document.createElement("input");
					input2.type="button";
					input2.value="submit";
					input2.onclick=subthenweibo;
					div2.appendChild(input2);
					
					var input3=document.createElement("input");
					input3.type="button";
					input3.value="cancel";
					input3.onclick=cancelthenweibo;
					div2.appendChild(input3);
					var c=document.createElement("left");
					c.appendChild(div2);
					div1.appendChild(c);
					document.body.appendChild(div1);
					}
					function subthenweibo(){
					   
						document.getElementById("then_select").value="2";
					    document.getElementById("then_select_weibo_username").value=document.getElementById("weibo_then_username").value;
					    document.getElementById("then_select_weibo_pwd").value=document.getElementById("weibo_then_pwd").value;
					    document.getElementById("then_select_weibo_content").innerHTML=document.getElementById("weibo_textarea").value;
				//	    document.getElementById("then_select_weibo_content").innerHTML="abcdke";
					     
					}
					function cancelthenweibo(){
					var p=document.getElementById("div_then_weibo");
					document.body.removeChild(p);
					}
					
					function addthenmail(){
						var div1=document.createElement("div");
						div1.style.position="absolute";
						div1.style.left="600px";
						div1.style.top="600px";
						div1.style.width="200px";
						div1.style.height="250px";
						div1.style.backgroundColor="white";
						div1.style.filter="alpha(opacity=40)";
						div1.style.opacity=.4;
						div1.setAttribute("id","div_then_mail");
						var div2=document.createElement("div");
						var input1=document.createElement("input");
						input1.type="text";
						input1.value= document.getElementById("then_select_mail_username").value;
						input1.setAttribute("id","mail_then_username");
						input1.setAttribute("name","mail_then_username");
						input1.style.width="200px";
						div2.appendChild(input1);
						var input4=document.createElement("input");
						input4.type="password";
						input4.value= document.getElementById("then_select_mail_pwd").value;
						input4.setAttribute("id","mail_then_pwd");
						input4.setAttribute("name","mail_then_pwd");
						input4.style.width="200px";
						div2.appendChild(input4);
						var receiver=document.createElement("input");
						receiver.type="text";
						receiver.value= document.getElementById("then_select_mail_receiver").value;
						receiver.setAttribute("id","receiver");
						receiver.setAttribute("name","receiver");
						receiver.style.width="200px";
						div2.appendChild(receiver);
						var title=document.createElement("input");
						title.type="text";
						title.value= document.getElementById("then_select_mail_title").value;
						title.setAttribute("id","title");
						title.setAttribute("name","title");
						title.style.width="200px";
						div2.appendChild(title);
						var inputarea=document.createElement("textarea");
						inputarea.setAttribute("id","mail_textarea");
						inputarea.setAttribute("name","mail_textarea");
						inputarea.innerHTML= document.getElementById("then_select_mail_content").value;
						inputarea.style.width="200px";
						div2.appendChild(inputarea);
						var input2=document.createElement("input");
						input2.type="button";
						input2.value="submit";
						input2.onclick=subthenmail;
						div2.appendChild(input2);
						var input3=document.createElement("input");
						input3.type="button";
						input3.value="cancel";
						input3.onclick=cancelthenmail;
						div2.appendChild(input3);
						var c=document.createElement("left");
						c.appendChild(div2);
						div1.appendChild(c);
						document.body.appendChild(div1);
						}
						function subthenmail(){
							
						  
						   var then_sel=document.getElementById("then_select");
						   then_sel.value="3";
						   document.getElementById("then_select_mail_username").value=document.getElementById("mail_then_username").value;
						    document.getElementById("then_select_mail_pwd").value=document.getElementById("mail_then_pwd").value;
						    document.getElementById("then_select_mail_receiver").value=document.getElementById("receiver").value;
						    document.getElementById("then_select_mail_content").innerHTML=document.getElementById("mail_textarea").value;
						    document.getElementById("then_select_mail_title").value=document.getElementById("title").value;
						}
						function cancelthenmail(){
						var p=document.getElementById("div_then_mail");
						document.body.removeChild(p);
						}
			
		
    
	
	</script>
<title>Choose Work</title>


</head>
<body>
<form action="modifytask" id="modifytask" method="post">
<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Services</h2>  
					<div class="divider-header"></div>
					<label>please enter a taskname:</label>
					 <%String taskname=request.getParameter("modifytask_text");%>
					<input type="text" name="taskname" id="taskname" value=<%=taskname %>>
					<input type="text" name="ori_taskname" id="ori_taskname" value=<%=taskname %> style="display:none">
					
					<br>
					<p>please choose the service</p>
			
					</div>
					</div>
				</div>
			</div>

		</div>

<div class="row">

<div class="col-xs-6 col-sm-3 col-md-3">
    
                <h1 style="margin-left:20cm">IF</h1>
               
                
				</div>
				

 </div>
 

 
 <div class="row" style="margin-left:18cm">
 <%
 System.out.println("taskname is:"+taskname);
 
 %>
 <%Myconn conn=new Myconn();
 
 conn.connectdatabase();
 String if_taskid="";
 String then_taskid="";
 String checkname="";
 String checkpassword="";
 String executeid="";
 String executepassword="";
 String content="";
 String willreceivemailname="";
 String mailtitle="";
 String t_time="";
 String checkmessage="";
 int if_taskid1=0;
 int then_taskid1=0;
 String sql="select * from userwork where taskname='"+taskname+"'";
 ResultSet rs=conn.GetDataReader(sql);
 if(rs.next()){
	 if_taskid=rs.getString("isdateorblogormail");
	 then_taskid=rs.getString("isblogormail");
	 checkname=rs.getString(5);
	 checkpassword=rs.getString(6);
	 executeid=rs.getString(7);
	 executepassword=rs.getString(8);
	 content=rs.getString(9);
     willreceivemailname=rs.getString(10);
	 mailtitle=rs.getString(11);
	 t_time=rs.getString(12);
	 checkmessage=rs.getString(14);
	 if_taskid1=Integer.parseInt(rs.getString(3));
	 then_taskid1=Integer.parseInt(rs.getString(4));
//	 System.out.println("if_taskid is:"+if_taskid);
//	 System.out.println("then_taskid is:"+then_taskid);
 }
 System.out.println("time is:"+t_time);


 %>
  <input type="text" name="if_select" id="if_select" value=<%=if_taskid %> style="display:none">
 <%if(if_taskid.equals("1")){ %>
 <div class="col-xs-6 col-sm-2 col-md-2" >
				<div class="wow fadeInLeft" data-wow-delay="0.2s">
                <div class="service-box" >
					<div class="service-icon">
					<a href="#" onclick="addtimer()">	<img src="img/timer.jpg"></a>
					<input type="text" id="timer_input" name="timer_input" value=<%=t_time%> style="display:none">
					</div>
					<div class="service-desc">	
							
						<h5>Set Timer</h5>
						<p>
						Set the time to start the work
						</p>
						
					</div>
                </div>
				</div>
            </div> 
            <%} %>
  <% if(if_taskid.equals("2")){ %>
  <div class="col-xs-6 col-sm-2 col-md-2">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<a href="#" onclick="addweibo()"><img src="img/weibo.jpg" > </a>
					</div>
					<input type="text" name="if_select_weibo_username" id="if_select_weibo_username"  value=<%=checkname%> style="display:none">
					<input type="text" name="if_select_weibo_pwd" id="if_select_weibo_pwd"  value=<%=checkpassword%> style="display:none">
					<textarea id="if_select_weibo_content" name="if_select_weibo_content" style="display:none"><%=checkmessage %></textarea>
					<div class="service-desc">	
						<h5>Weibo</h5>
						<p>
						Set the Weibo Mission.
						</p>	
					</div>
                </div>
				</div>
            </div>
            <% } %>
  <% if(if_taskid.equals("3")){%>
  <div class="col-xs-6 col-sm-2 col-md-2">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<a href="#" onclick="addmail()"> <img src="img/mail.jpg" > </a>
					</div>
					<input type="text" name="if_select_mail_username" id="if_select_mail_username"  value=<%=checkname%> style="display:none">
					<input type="text" name="if_select_mail_pwd" id="if_select_mail_pwd"  value=<%=checkpassword%> style="display:none">
					<div class="service-desc">
						
						<h5>Mail</h5>
						<p>
						Set the Mail Mission.
						</p>
							
					</div>
                </div>
				</div>
            </div>
            <% } %>
  <% if(if_taskid.equals("4")){%>
  <div class="col-xs-6 col-sm-2 col-md-2">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<a href="#" onclick="addtimeweibo()"><img src="img/fourth.jpg" > </a>
						<input type="text" id="timer_input" name="timer_input" value=<%=t_time%> style="display:none">
					</div>
					<input type="text" name="if_select_timeweibo_username" id="if_select_timeweibo_username"  value=<%=checkname%> style="display:none">
					<input type="text" name="if_select_timeweibo_pwd" id="if_select_timeweibo_pwd" value=<%=checkpassword%> style="display:none">
					
					<div class="service-desc">	
						<h5>TimeWeibo</h5>
						<p>
						Set the TimeWeibo Mission.
						</p>	
					</div>
                </div>
				</div>
            </div>
            <%} %>
        
            
  
            </div>
            
  <div class="row">
<div class="col-xs-6 col-sm-3 col-md-3">
    
  <h1 style="margin-left:20cm">THEN</h1>
  <input type="text" name="then_select" id="then_select" value=<%=then_taskid %> style="display:none">
</div> &nbsp;&nbsp;

          </div>
 <div class="row" style="margin-left:18cm">
 
 <%if(then_taskid.equals("2")){%>
 <div class="col-xs-6 col-sm-2 col-md-2">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<a href="#" onclick="addthenweibo()"><img src="img/weibo.jpg" > </a>
					</div>
					<input type="text" name="then_select_weibo_username" id="then_select_weibo_username"  value=<%=executeid %> style="display:none">
					<input type="text" name="then_select_weibo_pwd" id="then_select_weibo_pwd"  value=<%=executepassword %> style="display:none">
					<textarea name="then_select_weibo_content" id="then_select_weibo_content" style="display:none" ><%=content %></textarea>
					<div class="service-desc">	
						<h5>Weibo</h5>
						<p>
						Set the Weibo Mission.
						</p>	
					</div>
                </div>
				</div>
            </div>
            <%} %>
 <%if(then_taskid.equals("3")){ %>
 <div class="col-xs-6 col-sm-2 col-md-2">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<a href="#" onclick="addthenmail()"><img src="img/mail.jpg" > </a>
					</div>
					<input type="text" name="then_select_mail_username" id="then_select_mail_username"  value=<%=executeid %> style="display:none">
					<input type="text" name="then_select_mail_pwd" id="then_select_mail_pwd"  value=<%=executepassword %> style="display:none">
					<input type="text" name="then_select_mail_receiver" id="then_select_mail_receiver" value=<%=willreceivemailname %> style="display:none">
					<input type="text" name="then_select_mail_title" id="then_select_mail_title"  value=<%=mailtitle %> style="display:none">
					<textarea name="then_select_mail_content" id="then_select_mail_content" style="display:none"><%=content%></textarea>
					<div class="service-desc">
						
						<h5>Mail</h5>
						<p>
						Set the Mail Mission.
						</p>
							
					</div>
                </div>
				</div>
            </div>
            <%} %>
<%conn.close(); %>
  
            </div>
   <div class="row">
   <input type="submit" value="Submit"  style="margin-left:50%" class="btn btn-skin">
   </div>
    <br/>
   <div class="row">
   <input type="button"  value = "Back To Main"style="margin-left:48.5%" class="btn btn-skin" onclick="window.location.href='main.jsp'">       
   </div>     
  </form>
</body>
</html>