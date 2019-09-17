<%--<%@ page language="java" contentType="text/html; charset=UTF-8" %>--%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
    <div class="container">
        <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/logosmall.png" width="8%" height="8%"/>--%>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="col-md-6 collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#home" style="color:purple;">
                        <div style="position: relative;">
                            Home
                            <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>

                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#about" style="color:purple;">
                        <div style="position: relative;">
                            About
                            <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>

                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#standard" style="color:purple;">

                        <div style="position: relative;">
                            Standards
                            <div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#service" style="color:purple;">

                        <div style="position: relative;">
                            Services
                            <div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#" style="color:purple;">

                        <div style="position: relative;">
                            Guidelines
                            <div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#feedback" style="color:purple;">
                        <%--<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal/feedback" style="color:purple;">--%>

                        <div style="position: relative;">
                            Contact
                            <div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">

                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-6">
            <div class="search-container">
                <form >
                    <button type="submit"><i class="fa fa-search"></i></button>
                    <input type="text" placeholder="Search.." name="search">

                </form>
            </div>
        </div>


    </div>
    <img src="/assets/portal/img/logo/bd_gov.png"  style="position:  absolute;height: 40px;left: 2%;width: 40px;z-index:  -10;">
    <img src="/assets/portal/img/logo/a2i.png"  style="position:  absolute;height: 30px;right: 2%;width: 30px;z-index:  -10;">
</nav>