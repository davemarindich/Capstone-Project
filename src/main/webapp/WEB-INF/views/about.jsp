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
  <title>Home listings | About</title>
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

  <!-- =======================================================
    Theme Name: Eterna
    Theme URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
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
                <li><a href="#">Pages</a> <i class="icon-angle-right"></i></li>
                <li class="active">About</li>
              </ul>
              <div class="span-2 aligncenter">
              <h2>About us</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span10">
            <h4>About our pany</h4>
            <p>
            
                 <div class="span10 aligncenter">
              From a humble beginnings  in the rural Kenya, Dave Marindich ,was born into a  <br/>
               <div class="span9 aligncenter">
                      family of farmers in Eldoret, Kenya who had been growing fresh produce <br/>
                      <div class="span8 aligncenter">
                    and raising livestock for generations  </p>
                 </div>
                 </div>
                   </div>
            
                 <div class="span10 aligncenter">
              Recognizing the need for small scale farmers to access local market,  <br/>
               <div class="span9 aligncenter">
                      he founded F2C(Farmers to Community) <br/>
                      <div class="span8 aligncenter">
                    an web application that allows farmers to upload their produce.</p>
                 </div>
                 </div>
                   </div>
            
            
         
  <div>
 <p>
  <p>
 <div class="span10 aligncenter">
Our Platform acts as a bridge between small scale farmers and local markets, 
<div class="span9 aligncenter">
thereby gaining the market share 
<div class="span9 aligncenter">
otherwise dominated by big farming corporations. </p>
</div>
</div>
</div>
 
   

</div>

 <p>
  <p>
 <div class="span10 aligncenter">
You could have a farm, backyard vegetable garden or urban farm lot 
<div class="span9 aligncenter">
or a small livestock operation,
<div class="span8 aligncenter"> 
all you need is access to our platform 
<div class="span8 aligncenter">
from where you can upload, market and sell your products. </p>
</div>
</div>
</div>
</div>

  </p>
    </p>
<div class="span10 aligncenter">
           

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

        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline"></div>
          </div>
        </div>
        <!-- end divider -->

        <div class="row team">
          <div class="span12">
            <h4 class="title">Nice persons in <strong>Eterna</strong></h4>
          </div>

          <div class="span3">
            <div class="team-box">
              <a href="#" class="thumbnail"><img src="static/img/dummies/team/dave.png" alt="" /></a>
              <div class="roles aligncenter">
                <p class="lead"><strong>Dave Marindich </strong></p>
                <p>
                  CEO - Founder
                </p>
                <p>
                  <a href="#"><i class="icon-facebook icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-twitter icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-linkedin icon-circled icon-bglight active"></i></a>
                </p>

              </div>
            </div>
          </div>
          <div class="span3">
            <div class="team-box">
              <a href="#" class="thumbnail"><img src="static/img/dummies/team/chirchir.jpg" alt="" /></a>
              <div class="roles aligncenter">
                <p class="lead"><strong>Eluid chirchir</strong></p>
                <p>
                  Head of Operations
                </p>
                <p>
                  <a href="#"><i class="icon-facebook icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-twitter icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-linkedin icon-circled icon-bglight active"></i></a>
                </p>
              </div>
            </div>
          </div>
          <div class="span3">
            <div class="team-box">
              <a href="#" class="thumbnail"><img src="static/img/dummies/team/kyle.png" alt="" /></a>
              <div class="roles aligncenter">
                <p class="lead"><strong>Monica Bulumbu</strong></p>
                <p>
                  Customer support
                </p>
                <p>
                  <a href="#"><i class="icon-facebook icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-twitter icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-linkedin icon-circled icon-bglight active"></i></a>
                </p>
              </div>
            </div>
          </div>
          <div class="span3">
            <div class="team-box">
              <a href="#" class="thumbnail"><img src="static/img/dummies/team/mmm.png" alt="" /></a>
              <div class="roles aligncenter">
                <p class="lead"><strong>Gladoo Jeroo</strong></p>
                <p>
                  Marketing
                </p>
                <p>
                  <a href="#"><i class="icon-facebook icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-twitter icon-circled icon-bglight active"></i></a>
                  <a href="#"><i class="icon-linkedin icon-circled icon-bglight active"></i></a>
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="blankline30"></div>

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
