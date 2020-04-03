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
  <title>HomeListings | Index</title>
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

    <!-- section featured -->
    <section id="featured">

      <!-- slideshow start here -->

      <div class="camera_wrap" id="camera-slide">

        <!-- slide 1 here -->
         <div data-src="static/img/slides/camera/slide2/logoek.png">
       
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span6">
                  <h2 class="animated fadeInDown"><strong>FreshFarms </strong></h2>
                  <p class="animated fadeInUp"> <font color="white">Fresh produce, of course. But also fresh ideas. 
                  New ways of thinking about the age-old business of getting great-tasting sweet potatoes — 
                  and blueberries and napa cabbage and more — from field to table.</font> </p>
             
											
                 
                </div>
                <div class="span6">
                  <img src="" />
                
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- slide 2 here -->
        <div data-src="static/img/slides/camera/slide2/blue.png">
        
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span6">
                  <img src="" alt="" />
                </div>
                <div class="span6">
                    <h2 class="animated fadeInDown"><strong>Healthy Focus  </strong></h2>
                  <p class="animated fadeInUp"> <font color="white">It’s easy to understand why FreshFarms is popular: They offer healthy fresh fruit and vegetables, 
                  plus a chance to meet the people who grow what you’re buying.</font> </p>
                </div>

              </div>
            </div>
          </div>
        </div>

        <!-- slide 3 here -->
        <div data-src="static/img/slides/camera/slide2/label.png">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
               <div class="span6">
                    <h2 class="animated fadeInDown"><strong>Locally produced </strong></h2>
                  <p class="animated fadeInUp"> <font color="white">FreshFarms works with farms that have gone through certification process and 
               are truly committed to the principles of organic farming.</font> </p>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

      <!-- slideshow end here -->

    </section>
    <!-- /section featured -->

    <section id="content">
      <div class="container">


        <div class="row">

          <div class="span3">
            <div class="service-box aligncenter flyLeft">
              <div class="icon">
                 <a href="#" class="thumbnail"><img src="https://freebw.com/templates/oragnive/images/icons/icon1.1.png" alt="" /></a>
              </div>
              <h5>Custom <span class="colored" style = "position:relative; left:-45px">100% Organic</span></h5>
             <p>
              
               F2C works with farms that have gone through certification process and 
               are truly committed to the principles of organic farming.
              </p>

            </div>
          </div>
          <div class="span3">
            <div class="service-box aligncenter flyIn">
              <div class="icon">
                <a href="#" class="thumbnail"><img src="https://freebw.com/templates/oragnive/images/icons/icon1.1.png" alt="" /></a>
              </div>
              <h5>Cloud <span class="colored" style = "position:relative; left:-45px">Family Healthy</span></h5>
              <p>
                F2C promotes healthier than processed and packaged foods by having
                products that are locally grown or raised. 
              </p>

            </div>
          </div>
          <div class="span3">
            <div class="service-box aligncenter flyIn">
              <div class="icon">
               <a href="#" class="thumbnail"><img src="https://freebw.com/templates/oragnive/images/icons/icon2.2.png" alt="" /></a>
              </div>
              <h5>Mobile <span class="colored" style = "position:relative; left:-45px">Always Fresh</span></h5>
              <p>
                If you are looking for fresh food F2C helps you to find the type of farm market you're 
                 seeking, in your own local area. 
              </p>

            </div>
          </div>
          <div class="span3">
            <div class="service-box aligncenter flyRight">
              <div class="icon">
                <a href="#" class="thumbnail"><img src="https://freebw.com/templates/oragnive/images/icons/icon4.4.png" alt="" /></a>
              </div>
              <h5>Viral <span class="colored" style = "position:relative; left:-45px">Food Safety</span></h5>
              <p>
                Our Platform is about enjoying real food, grown yourself or purchased from people you trust 
               
            </div>
          </div>
        </div>

        <div class="row">
          <div class="span12">
            <div class="cta-box">
              <div class="row">
                <div class="span8">
                  <div class="cta-text">
                  
                  
                  </div>
                </div>
                <div class="span4">
                  
                </div>

              </div>


            </div>
          </div>
        </div>

        <div class="row">
          <div class="span12 aligncenter">
            <h3 class="title">What people <strong>saying</strong> about us</h3>
            <div class="blankline30"></div>

            <ul class="bxslider">
            <c:forEach var="item" items="${comments}">
            <c:if test="${not empty item.comment}">
              <li>
                <blockquote>
                  <p>${item.comment}</p>
                </blockquote>
                <div class="testimonial-autor">
                  <img src="static/img/users/${item.id}/profile/${item.image}" alt=""
                  style="width: 50px; height: 45px; border-radius: 50%;" />
                  <h4>${item.fname} ${item.lname}</h4>
                  <a href="#">${item.email}</a>
                </div>
              </li>
              </c:if>
              </c:forEach>
            </ul>

          </div>
        </div>

      </div>
    </section>


    <section id="works">
  
      <div class="container">
      <div class="icon">
      
                <img src="http://themazine.com/unify/farm/images/gallary/gallary-home.jpg" alt="" />
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
  <script src="static/js/camera/camera.js"></script>
  <script src="static/js/camera/setting.js"></script>

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
