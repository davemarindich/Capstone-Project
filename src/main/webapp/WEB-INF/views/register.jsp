<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Register</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link href="static/css/bootstrap.css" rel="stylesheet" />
  <link href="static/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="static/css/flexslider.css" rel="stylesheet" />
  <link href="static/css/prettyPhoto.css" rel="stylesheet" />
  <link href="static/css/camera.css" rel="stylesheet" />
  <link href="static/css/jquery.bxslider.css" rel="stylesheet" />
  <link href="static/css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link href="static/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
</head>

<body>

  <div id="wrapper">

    <!-- start header -->
    <jsp:include page="header.jsp"/>
    <!-- end header -->

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="inner-heading">
              <ul class="breadcrumb">
                <li><a href="index">Home</a> <i class="icon-angle-right"></i></li>
                <li class="active">Register</li>
              </ul>
              <h2>Register</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span4">

            <aside class="left-sidebar">
              <div class="widget">

                <h5 class="widgetheading">Categories</h5>

              
              </div>
          </aside>
          </div>

          <div class="span8">
              <div class="row">

                <div class="span8">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3><a href="#">Register</a></h3>
                    </div>
                  </div>
                  
                  <form:form action="register" modelAttribute="user" method="post" >
                  <h3>
                  <span class="text-success"> ${success}</span>
                  <span class="text-error text-center">${error}</span>
                  </h3>
                  <div class="control-group">
                    <label class="control-label" for="fname">First Name*</label>
                    <div class="controls">
                     <form:input type="text" path="fname" placeholder="First Name" /> 
                    <p class="has-error">
					  <form:errors path="fname" class="text-error text-center"/>
					</p>
					</div>                    
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="lname">Last Name*</label>
                    <div class="controls">
                     <form:input type="text" path="lname" placeholder="Last Name" /> 
                    <p class="has-error">
					  <form:errors path="lname" class="text-error text-center"/>
					</p>
					</div>                    
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputText">Email*</label>
                    <div class="controls">
                      <form:input type="hidden" path="id"/>
                      <form:input type="email" path="email" placeholder="Email"/>
                    <p>
					  <form:errors path="email" class="text-error text-center"/>
					</p>
                    </div>                    
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label" for="password">Password*</label>
                    <div class="controls">
                     <form:input type="password" path="password" placeholder="Password" /> 
                    <p class="has-error">
					  <form:errors path="password" class="text-error text-center"/>
					</p>
					</div>                    
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label" for="password2">Re-enter Password*</label>
                    <div class="controls">
                     <form:input type="password" path="password2" placeholder="Re-enter Password" /> 
                    <div class="has-error">
					  <form:errors path="password2" class="text-error"/>
					</div>
                    </div>
                    
                  </div>
                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" id="submit" class="btn btn-danger">Submit</button>
                      <a href="login" class="btn btn-success">Cancel</a>
                    
                    </div>
                    
                  </div>
                </form:form>
                  
                </div>
              </div>
            
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp"/>
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="static/js/jquery.js"></script>
  <script src="static/js/jquery.easing.1.3.js"></script>
  <script src="static/js/bootstrap.js"></script>

  <script src="static/js/modernizr.custom.js"></script>
  <script src="static/js/toucheffects.js"></script>
  <script src="static/js/google-code-prettify/prettify.js"></script>
  <script src="static/js/jquery.bxslider.min.js"></script>

  <script src="static/js/jquery.prettyPhoto.js"></script>
  <script src="static/js/portfolio/jquery.quicksand.js"></script>
  <script src="static/js/portfolio/setting.js"></script>

  <script src="static/js/jquery.flexslider.js"></script>
  <script src="static/js/animate.js"></script>
  <script src="static/js/inview.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>


</body>

</html>
