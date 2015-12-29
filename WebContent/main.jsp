<%@page import="java.sql.*"%>
<%@page import="tomcat_test.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Main Page</title>
	
    <!-- css -->
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
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/scripts/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>

	
	<script type="text/javascript">
     function Cmd(v,k){
    	 if(v.checked){
    		 if(k=='dep'){
    			$("#label_dep").show();
    			$("#label_with").hide();
    			 
    		 }
    		 else{
    			 $("#label_dep").hide();
     			$("#label_with").show();
    		 }
    		 
    	 }
     }
     
     function gotocreate(){
    	 window.location.href="admin_create_work.jsp";
     }
     
     function gotodelete(){
 		window.location.href = "admin_delete_work.jsp";
 	}
     
     function gotocheckinfo(){
    	 window.location.href="admin_check_info.jsp";
     }
	
	function gotochoosework(){
		window.location.href="choose_work.jsp";
	}
	
	 function gotoseemessage(){
    	 window.location.href="see_message.jsp";
     }
	function usershow()
	{
		 document.getElementById("choose").style.display="";
		 document.getElementById("choose receiver").style.display="none";
	}
	
	function AllSelect()
	{
		if(document.select.selectbox.length)
		{
			var flag=1;
			if(document.select.selectbox[0].checked==true)
				flag=0;
			for(var i=0;i <document.select.selectbox.length;i++){
				if(flag==1)
			    document.select.selectbox[i].checked=true;
				else
				document.select.selectbox[i].checked=false;
			   }
		}
	}
	
	function SelectFinish(){
		if(document.select.selectbox.length)
			{
			    var receiver = "";
			    for(var i=0;i <document.select.selectbox.length;i++){
			    	if(document.select.selectbox[i].checked==true)
			    		{
			    		   
			    		   receiver = receiver+document.select.selectbox[i].value+";";
			    		}
			    }
			    
			}
		document.getElementById("choose").style.display="none";
		document.getElementById("choose receiver").style.display="";
		document.getElementById("receiveruser").value = receiver;
	}
	
	
	function checkmessage()
	{
		if(document.getElementById("receiveruser").value==""||document.getElementById("receiveruser").value==null)
			{ alert("You should choose receiver");
			  return false;
			}
		if(document.getElementById("messageforsend").value==""||document.getElementById("messageforsend").value==null)
			{
			  alert("You should write message");
			  return false;
			}
		
		return true;
	}
	
	
	function checkmoney(){
		if(document.getElementById("dep_or_with_txt").value==""||document.getElementById("dep_or_with_txt").value==null)
		{
		  alert("You should enter money sum");
		  return false;
		}
		var filter  = /^\d{1,10}$/;
		if (filter.test(document.getElementById("dep_or_with_txt").value))
		{
			return true;
		}
		else{
			alert("You should enter correct money number");
			  return false;
		}
		return true;
	}
	
	function TaskSelectShow()
	{
		
		var username='<%=session.getAttribute("username")%>';
		var  myselect=document.getElementById("taskset");
		var index=myselect.selectedIndex;
		var data = myselect.options[index].value.split("\\$");
		var taskname = data[0];
	    var ifindex = data[1];
		var thenindex = data[2];
		var state=data[3];
		//alert(data);
		document.getElementById("iftimer").style.display="none";
		document.getElementById("ifmail").style.display="none";
		document.getElementById("ifweibo").style.display="none";
		document.getElementById("iftimeweibo").style.display="none";
		document.getElementById("thenmail").style.display="none";
		document.getElementById("thenweibo").style.display="none";
		switch(ifindex)
		{
			
			case "1": {
				       document.getElementById("iftimer").style.display="";
				       break;
			         }
			case "2": {
			           document.getElementById("ifweibo").style.display="";
			           break;
		             }
			case "3": {
			           document.getElementById("ifmail").style.display="";
			           break;
		            }
			case "4": {
			            document.getElementById("iftimeweibo").style.display="";
			            break;
		             }
			}
			switch(thenindex)
			{ 
			case "2": {
				        document.getElementById("thenweibo").style.display="";
		                break;
		              }
			case "3": {
		        document.getElementById("thenmail").style.display="";
                break;
              }
			}
			switch(state)
			{
			case "0": {
		        document.getElementById("state").value="The task hasn't start";
                break;
              }
			case "1": {
		        document.getElementById("state").value="The task is running";
                break;
              }
			case "2": {
		        document.getElementById("state").value="The task has paused";
                break;
              }
			case "3": {
		        document.getElementById("state").value="The task is finished";
                break;
              }
			}
		
	}
	
	function starttask(){
		var  myselect=document.getElementById("taskset");
		var index=myselect.selectedIndex;
		var data = myselect.options[index].value.split("\\$");
		var taskname = data[0];
		document.getElementById("starttask_text").value=taskname;
	}
	
	function deletetask(){
		var  myselect=document.getElementById("taskset");
		var index=myselect.selectedIndex;
		var data = myselect.options[index].value.split("\\$");
		var taskname = data[0];
		document.getElementById("deletetask_text").value=taskname;
	}
	
	function modifytask(){
		var  myselect=document.getElementById("taskset");
		var index=myselect.selectedIndex;
		var data = myselect.options[index].value.split("\\$");
		var taskname = data[0];
		document.getElementById("modifytask_text").value=taskname;
		
	}
	
	function stoptask(){
		var  myselect=document.getElementById("taskset");
		var index=myselect.selectedIndex;
		var data = myselect.options[index].value.split("\\$");
		var taskname = data[0];
		document.getElementById("stoptask_text").value=taskname;
		
	}
	
	
	</script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom" bgcolor="#d0d0d0">
	 <% HttpSession session1 = request.getSession(); %>
     <%if(session1.getAttribute("islogin")==null){
         out.println("<script>alert('please login first');</script>");
         out.print("<meta   http-equiv="+"refresh"+"  content=" +"3;url=index.jsp"+">");
      } %>
       <% Myconn con = new Myconn();
          con.connectdatabase();
          String sql="select * from user where username = '"+session1.getAttribute("username")+"'";
          ResultSet sessionrs = con.GetDataReader(sql);
          if(sessionrs.next()){
             session1.setAttribute("username",sessionrs.getString(1));
             session1.setAttribute("email",sessionrs.getString(3));
             session1.setAttribute("phone",sessionrs.getString(4));
             session1.setAttribute("money",Integer.parseInt(sessionrs.getString(7)));
             session1.setAttribute("gender",sessionrs.getString(5));
             session1.setAttribute("level",sessionrs.getString(6));
          }
         con.close();
        %>
<nav class="navbar navbar-default" role="navigation">
   <div class="navbar-header">
      <a class="navbar-brand" href="#works">QGZ</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li ><a href="modify.jsp">About Me</a></li>
          <%if(request.getAttribute("message1") != null){%> 
          <label><%=request.getAttribute("message1")%></label>
          <%} %>
         <li><a href="see_message.jsp">See Message</a></li>
         
          <% if(session1.getAttribute("level").toString().equals("admin")){ %>
                            
           <li><a href="admin_check_info.jsp">Check User Info</a></li> 
           <li><a href="admin_create_work.jsp">Create New Work</a></li>            
                
            <li><a href="admin_delete_work.jsp">Delete Work</a></li>
           
                            
        <%} %>
        <li><a href="logout.jsp">Log Out</a></li>
      </ul>
   </div>
</nav>
	
	
	<section id="intro" class="home-slide text-light">

		<!-- Carousel -->
    	
			<!-- Indicators -->
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
			    <div class="item active">
			    	<img src="img/1.jpg" alt="First slide">
                    <!-- Static Header -->
                 
                    <div class="header-text hidden-xs">
                        <div class="col-md-12 text-center">
                            <h2>
                            	
                            	 <%if((Integer.parseInt(session1.getAttribute("islogin").toString()))==1){ %>
                            
                            	 <span>Welcome <%=session1.getAttribute("username") %></span>
                            </h2>
                           
                            <h4>Personal Information:</h4>
                            <p>name: <%=session1.getAttribute("username") %></p> 
                            <p>email: <%=session1.getAttribute("email") %></p>
                            <p>phone: <%=session1.getAttribute("phone") %></p>
                            <p>level: <%=session1.getAttribute("level") %></p>
                             <p>money: <%=session1.getAttribute("money") %></p>
                            
                           
                          <%} %>
                            
                           
                    </div><!-- /header-text -->
			    </div>
			    
			   
			</div>
			</div>
			<!-- Controls -->
			
		

	</section>
	<!-- /Section: intro -->
	
	
    <!-- Navigation -->
    
    
      
    <div id="navigation">
        <nav class="navbar navbar-custom" role="navigation">
                              <div class="container">
                                    <div class="row">
                                          <div class="col-md-2">
                                                   <div class="site-logo">
                                                            <a href="index.html" class="brand">Shuffle</a>
                                                    </div>
                                          </div>
                                          

                                          <div class="col-md-10">
                         
                                                      <!-- Brand and toggle get grouped for better mobile display -->
                                          <div class="navbar-header">
                                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                                                <i class="fa fa-bars"></i>
                                                </button>
                                          </div>
                                                      <!-- Collect the nav links, forms, and other content for toggling -->
                                                      <div class="collapse navbar-collapse" id="menu">
                                                            <ul class="nav navbar-nav navbar-right">
                                                                  <li class="active"><a href="#intro">Home</a></li>
                                                                  <li><a href="#about">Money</a></li>
																   <li><a href="#service">Services</a></li>
                                                                  <li><a href="#works">About us</a></li>				                                                                  
                                                                  
                                                                  <li><a href="#contact">Contact</a></li>
                                                                  
                                                                    <% if(session1.getAttribute("level").toString().equals("admin")){ %>
                                                                    <li><a href="#sendmessage">Send Message</a></li>
                                                                  <% } %>
                                                            </ul>
                                                      </div>
                                                      <!-- /.Navbar-collapse -->
                             
                                          </div>
                                    </div>
                              </div>
                              <!-- /.container -->
                        </nav>
    </div> 
    
    
    
    
    <!-- /Navigation -->  

	<!-- Section: about -->
    <section id="about" class="home-section color-dark bg-white">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">consume and recharge</h2>
					<div class="divider-header"></div>
					<p>Here you can deposit and withdraw your money.</p>
					</div>
					</div>
				</div>
			</div>

		</div>

		<div class="container">

		
        <div class="row">
		<form action="money" id="money" method="post">
			<div class="col-md-6">
			    <img src="img/money1.jpg" alt="" class="img-responsive" />
      
           </div>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
            <div class="col-md-6">		
			<h6>Here you can.</h6>
			<input type="radio" name="dep_or_with" onclick="Cmd(this,'dep')" checked="checked" value="1"> Deposit
			<input type="radio" name="dep_or_with" onclick="Cmd(this,'with')"  value="2"> Withdraw			
			<div>
			<label id="label_dep"><h6>Enter the money you want to deposit</h6></label>
			<label id="label_with" style="display:none"><h6>Enter the money you want to withdraw</h6></label>
			<input type="text" name="dep_or_with_txt" >
			</div>
			
			
			<input type="submit" value="submit" class="btn btn-info" onclick="return checkmoney()">
			

            </div>
		</form>

        </div>		
		</div>

	</section>
	<!-- /Section: about -->
	
	
	<!-- Section: services -->
	
    <section id="service" class="home-section color-dark bg-gray">
     
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Services</h2>  
					<div class="divider-header"></div>
					<p>please choose the service</p>
					<input type="button" value="create new work" class="btn btn-skin" onclick="gotochoosework()"><br><br>
					
  					<select id="taskset" onclick="TaskSelectShow()" name="taskset"> 
					<%Myconn conn=new Myconn();
					  conn.connectdatabase();
					  String asql="select * from userwork where username='"+session1.getAttribute("username").toString()+"'";
					  ResultSet rs=conn.GetDataReader(asql);
					  
					  while(rs.next()){
						  String taskname=rs.getString(2);
						  String ifindex=rs.getString(3);
						  String thenindex=rs.getString(4);
						  String state = rs.getString(13);
						  String value=taskname+"$"+ifindex+"$"+thenindex+"$"+state+"$";
					%>
					<option value='<%=value %>'  >task <%=rs.getString(2) %></option>
					<%}%>
					<%%>
					
					</select>
					
					
					
					</div>
					</div>
				</div>
			</div>

		</div>
	    
	    <div class="text-center">
	   
	    <div class="container">
	    <div class="row">
	    <div class="col-xs-6 col-sm-2 col-md-2">
	    <h1>IF</h1>
	    <br/>
	    </div>
	    <div class="col-xs-6 col-sm-2 col-md-2">
	        <div id="iftimer" style="display:none">
	          <img src="img/timer.jpg" alt="Big Boat" >
	        </div>
	         <div id="ifweibo" style="display:none">
	          <img src="img/weibo.jpg" alt="Big Boat">
	         </div>
	         <div id="ifmail" style="display:none">
	          <img src="img/mail.jpg" alt="Big Boat">
	         </div>
	          <div id="iftimeweibo" style="display:none">
	          <img src="img/fourth.jpg" alt="Big Boat">
	          </div>
	    </div>
	    <div class="col-xs-6 col-sm-2 col-md-2">
	    <h1>THEN</h1>
	    <br/>
	    </div>
	    <div class="col-xs-6 col-sm-2 col-md-2">
	    
	       <div id="thenweibo" style="display:none">
	          <img src="img/weibo.jpg" alt="Big Boat">
	       </div>
	       <div id="thenmail" style="display:none">
	          <img src="img/mail.jpg" alt="Big Boat">
	       </div>
	    
	     
	    
	    </div>
	    <div class="col-xs-6 col-sm-1 col-md-1">
	 
	   <form action="starttask" id="starttask" method="post">
	     <input type="text" id="starttask_text" name="starttask_text" style="display:none" >
	       <input type="submit" value="start" onclick="starttask()" class="btn btn-skin">
	    </form>
	     </div>
	      <div class="col-xs-6 col-sm-1 col-md-1">
	  <form action="deletetask" id="deletetask" method="post">
       <input type="text" id="deletetask_text" name="deletetask_text" style="display:none" >
       <input type="submit" value="delete" onclick="deletetask()" class="btn btn-skin">
       </form>
         </div>
           <div class="col-xs-6 col-sm-1 col-md-1">
       <form action="modifytask.jsp" method="post">
         <input type="text" id="modifytask_text" name="modifytask_text" style="display:none">
          <input type="submit" value="modify" onclick="modifytask()" class="btn btn-skin">
          </form>
           </div>
            <div class="col-xs-6 col-sm-1 col-md-1">
        <form action="stoptask" id="stoptask" method="post">
         <input type="text" id="stoptask_text" name="stoptask_text" style="display:none">
          <input type="submit" value="stop" onclick="stoptask()" class="btn btn-skin">
          </form>
           </div>
	    
	   
	    
	    
	    </div>
	    <input type="text" value="" id="state" disabled="disabled">
	    </div>
	   
	    </div>
	    
   
   
	</section>
	
	<!-- /Section: services -->
	

	<!-- Section: works -->
    <section id="works" class="home-section color-dark text-center bg-white" >
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">ABOUT US</h2>
					<div class="divider-header"></div>
					<p>C'est la vie</p>
					</div>
					<table border="0" id="aboutus" style="table-layout:fixed" >
					  <tr>
					      <td>
					          MOBO
					          <p></p>
					          <img src="img/mobo.jpg" alt="Big Boat">
					      </td>
					      <td>
					          GY
					          <p></p>
					          <img src="img/gy.jpg" alt="Big Boat">
					          
					      </td>
					      <td>
					          ZC
					          <p></p>
					          <img src="img/zc.jpg" alt="Big Boat">
					      </td>
					  </tr>
					  <tr>
					       <td> <p>So we beat on, boats against the current, borne back ceaselessly into the past.</p> </td>
					       <td> <p>One needs 3 things to be truly happy living in the world: some thing to do, some one to love, some thing to hope for.</p> </td>
					       <td> <p>Dream what you want to dream; go where you want to go; be what you want to be, because you have only one life and one chance to do all the things you want to do.</p> </td>
					  </tr>
					</table>
					</div>
				</div>
			</div>

		</div>

		<div class="container">
			<div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" >
					<div class="wow bounceInUp" data-wow-delay="0.4s">
                    <div id="owl-works" class="owl-carousel">
                        <div class="item"><a href="img/works/1.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/1@2x.jpg"><img src="img/works/1.jpg" class="img-responsive" alt="img"></a></div>
                        <div class="item"><a href="img/works/2.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/2@2x.jpg"><img src="img/works/2.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/3.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/3@2x.jpg"><img src="img/works/3.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/4.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/4@2x.jpg"><img src="img/works/4.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/5.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/5@2x.jpg"><img src="img/works/5.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/6.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/6@2x.jpg"><img src="img/works/6.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/7.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/7@2x.jpg"><img src="img/works/7.jpg" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/works/8.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/8@2x.jpg"><img src="img/works/8.jpg" class="img-responsive " alt="img"></a></div>
                    </div>
					</div>
                </div>
            </div>
		</div>

	</section>
	<!-- /Section: works -->

	<!-- Section: contact -->
    <section id="contact" class="home-section nopadd-bot color-dark bg-gray text-center">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Contact us</h2>
					<div class="divider-header"></div>
					<p>If you have any question, contact us</p>
					</div>
					</div>
				</div>
			</div>

		</div>
		
		<div class="container">

			<div class="row marginbot-80">
				<div class="col-md-8 col-md-offset-2">
						<form id="contact-form" class="wow bounceInUp" data-wow-offset="10" data-wow-delay="0.2s">
						<div class="row marginbot-20">
							<div class="col-md-6 xs-marginbot-20">
								<input type="text" class="form-control input-lg" id="name" placeholder="Enter name" required="required" />
							</div>
							<div class="col-md-6">
								<input type="email" class="form-control input-lg" id="email" placeholder="Enter email" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
										<input type="text" class="form-control input-lg" id="subject" placeholder="Subject" required="required" />
								</div>
								<div class="form-group">
									<textarea name="message" id="message" class="form-control" rows="4" cols="25" required="required"
										placeholder="Message"></textarea>
								</div>						
								<button type="submit" class="btn btn-skin btn-lg btn-block" id="btnContactUs">
									Send Message</button>
							</div>
						</div>
						</form>
				</div>
			</div>	


		</div>
	</section>
	<!-- /Section: contact -->
	
	 <% if(session1.getAttribute("level").toString().equals("admin")){ %>
    <section id="sendmessage" class="home-section nopadd-bot color-dark bg-gray text-center">
    
    <div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Send message</h2>
					<div class="divider-header"></div>
					<p>You can send message to public or someone</p>
					</div>
					</div>
				</div>
			</div>

		</div>
		<div id=choose style="display:none;  left:0; top:0; width:100%; height:100%; filter:alpha(opacity=0)">
		<%  tomcat_test.Myconn cnon = new tomcat_test.Myconn();
		cnon.connectdatabase();
		java.sql.ResultSet result = cnon.GetDataReader("select * from user where level!='admin'"); 
		int index=1;
		while(result.next())
		{
			String s=result.getString(1);
		%>
		
		<form id="select" name="select">
		<% %>
		<input type="checkbox" name="selectbox" id="selectbox" style="vertical-align:middle;" value=<%=s %> /><lable style="vertical-align:middle;" ><%=s %></lable>
		&nbsp;
		
		<% if(index%8==0)
		{%>
			<br/>
		<% index=0;}
		index++;
		} %>
	   <%cnon.close(); %>
		</form>
		<input type="button" value="select all" id="select all"class="btn btn-skin" onclick = "AllSelect()">
        &nbsp;
        <input type="button" value="select finish" id="select finish"class="btn btn-skin" onclick = "SelectFinish()">              
		</div>
		
		
		<div class="container">

			<div class="row marginbot-80">
				<div class="col-md-8 col-md-offset-2">
						<form id="contact-form" class="wow bounceInUp" data-wow-offset="10" data-wow-delay="0.2s" action="sendmessage" method="post" id="sendmessage" >
						
						<input type="button" value="choose receiver" id="choose receiver"class="btn btn-skin" onclick = "usershow()">
                            
					    
                        <br/>
                        <br/>  
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
										<input type="text" class="form-control input-lg" name="receiveruser" id="receiveruser" placeholder="receiveruser"  readonly="true" value="" />
								</div>
								<div class="form-group">
									<textarea name="messageforsend" id="messageforsend" class="form-control" rows="4" cols="25" required="required"
										placeholder="Message" value=""></textarea>
								</div>
											
								<button type="submit" class="btn btn-skin btn-lg btn-block" id="sendmeaasge" onclick="return checkmessage()">
									Send Message</button>
							</div>
						</div>
						 
						</form>
				</div>
			</div>	


		</div>	
    </section>
    <%} %>


	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					
					<div class="text-center">
						<a href="#intro" class="totop"><i class="fa fa-angle-up fa-3x"></i></a>

						<p>QGZ, Inc. 163 XianLin Ave, Iceland, Istanbul, Turkey<br />
						&copy;Copyright 2016 - Trifle. Designed by QGZ Corporation</a></p>
                       
                        <!-- 
                            All links in the footer should remain intact. 
                            Licenseing information is available at: http://bootstraptaste.com/license/
                            You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Shuffle
                        -->
					</div>
				</div>
			</div>	
		</div>
	</footer>

    <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>	 
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/jquery-1.4.2.min.js"></script>

    <script src="js/custom.js"></script>

</body>

</html>
