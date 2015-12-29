<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>
<!-- Section: services -->
    <section id="service" class="home-section color-dark bg-gray">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Work</h2>
					<div class="divider-header"></div>
					<p>please choose the work you want to create</p>
				
					</div>
					</div>
				</div>
			</div>

		</div>

		<div class="text-center">
		<div class="container">

        <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-3">
				<div class="wow fadeInLeft" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<img src="img/timer.jpg" >
					</div>
					<div class="service-desc">	
					<form action="create_timer" id="create_timer" method="post">		
						<h5>Set Timer</h5>
						<p>
						Set the time to start the work
						</p>
						<input type="submit" value="Create" class="btn btn-skin">
						<%if(request.getAttribute("message_timer") != null){%> 
                         	<label><%=request.getAttribute("message_timer")%></label>
                         <%} %>
						</form>		
					</div>
                </div>
				</div>
            </div>
			<div class="col-xs-6 col-sm-3 col-md-3">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<img src="img/weibo.jpg" > 
					</div>
					<div class="service-desc">
						<form action="create_weibo" id="create_weibo" method="post">	
						<h5>Weibo</h5>
						<p>
						Set the Weibo Mission.
						</p>
						<input type="submit" value="Create" class="btn btn-skin">
						<%if(request.getAttribute("message_weibo") != null){%> 
                         	<label><%=request.getAttribute("message_weibo")%></label>
                         <%} %>
						</form>		
					</div>
                </div>
				</div>
            </div>
			<div class="col-xs-6 col-sm-3 col-md-3">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<img src="img/mail.jpg" > 
					</div>
					<div class="service-desc">
						<form action="create_mail" id="create_mail" method="post">	
						<h5>Mail</h5>
						<p>
						Set the Mail Mission.
						</p>
						<input type="submit" value="Create" class="btn btn-skin">
						<%if(request.getAttribute("message_mail") != null){%> 
                         	<label><%=request.getAttribute("message_mail")%></label>
                         <%} %>
						</form>		
					</div>
                </div>
				</div>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-3">
				<div class="wow fadeInUp" data-wow-delay="0.2s">
                <div class="service-box">
					<div class="service-icon">
						<img src="img/fourth.jpg" > 
					</div>
					<div class="service-desc">
						<form action="create_timeweibo" id="create_timeweibo" method="post">	
						<h5>Mail</h5>
						<p>
						Set the TimeWeibo Mission.
						</p>
						<input type="submit" value="Create" class="btn btn-skin">
						<%if(request.getAttribute("message_timeweibo") != null){%> 
                         	<label><%=request.getAttribute("message_timeweibo")%></label>
                         <%} %>
						</form>		
					</div>
                </div>
				</div>
            </div>
		
        </div>		
		</div>
		</div>
		<br/>
		<input type="button" style="margin-left:46%" value="back to main" class="btn btn-skin" onclick="window.location.href='main.jsp'">
		
	</section>
	<!-- /Section: services -->
</body>
</html>