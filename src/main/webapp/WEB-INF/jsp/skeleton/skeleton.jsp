
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

	<meta charset="utf-8"/>

	<%@ include file="../includes/head.jsp"%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
	<%@ include file="../includes/header.jsp"%>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper" style="margin-top: 20px">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse">
			<%@ include file="../includes/menu.jsp"%>
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- START MAIN CONTENT -->
		<div class="page-content">

			<!-- BEGIN PAGE HEADER-->
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><i class="fa fa-home"></i> <a href="index.html">Home</a>
							<i class="fa fa-angle-right"></i></li>
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div>
				<h3 class="page-title">
					Dashboard <small>reports & statistics</small>
				</h3>
			<!-- END PAGE HEADER-->

			<!-- Everything is here -->

			<!--End of Everything -->
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
	<%@ include file="../includes/footer.jsp"%>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp"%>
</body>
<!-- END BODY -->
</html>