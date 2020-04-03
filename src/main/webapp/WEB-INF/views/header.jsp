
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
      <div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
              <p class="topcontact"><i class="icon-phone"></i> (123) 456-7890</p>
            </div>
            <div class="span6">

              <ul class="social-network">
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-linkedin icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-pinterest  icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-google-plus icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Dribbble"><i class="icon-dribbble icon-white"></i></a></li>
              </ul>

            </div>
          </div>
        </div>
      </div>
      <div class="container">


        <div class="row nomargin">
          <div class="span4">
            <div class="logo">
              <a href="index"><img src="https://cdn.shopify.com/s/files/1/0039/7046/5841/files/Fresh_Farms_Hemp_Extract_Logo_Color_1401x.jpg?v=1574806347" 
              alt="logo" style="width: 120px; height: 65px"></a>
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li class="dropdown ${_index}">
                      <a id="_index" href="index"><i class="icon-home"></i> Home <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a id="_users" href="users">Members</a></li>
                        <li><a href="#">Add Property</a></li>
                        <li><a href="#">Services</a></li>                        
                      </ul>
                   
                    </li>                    
                    <li class="${_about}">
                      <a id="_about" href="about">About-Us </a>
                    </li>
                    <li class="${_shop}">
                      <a id="_shop" href="Shop">Shop </a>
                    </li>
                    
                    <li class="${_contact}">
                      <a id="_contact" href="contact">Contact </a>
                    </li>
				   <c:choose>
				   <c:when test="${empty loggedInuser}">
				   <li class="${_login}">
				   <a id="_login" href="login">Login</a>
				   </li>
				   <li class="${_register}">
				   <a id="_register" href="register">Register</a>
				   </li>
				   </c:when>
				   <c:otherwise>
				   <li class="${_profile}">
				   <a href="profile">My Profile</a>
				   </li>
				   <li>
				   <a id="logout_link" href="logout">| Logout |</a>
				   </li>   
				   </c:otherwise>
				   </c:choose>
                    
                    <li >
                      <a  href="cart"><i class="icon-shopping-cart text-danger"> ${cart}</i> </a>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
    </header>