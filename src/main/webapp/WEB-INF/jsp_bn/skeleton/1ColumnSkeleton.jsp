<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<html:base />
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
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Form Actions On Top & Bottom
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<form action="#" class="form-horizontal">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Text</label>
										<div class="col-md-4">
											<input type="text" class="form-control" placeholder="Enter text">
											<span class="help-block">
											A block of help text. </span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Email Address</label>
										<div class="col-md-4">
											<div class="input-group">
												<span class="input-group-addon">
												<i class="fa fa-envelope"></i>
												</span>
												<input type="email" class="form-control" placeholder="Email Address">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Password</label>
										<div class="col-md-4">
											<div class="input-group">
												<input type="password" class="form-control" placeholder="Password">
												<span class="input-group-addon">
												<i class="fa fa-user"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Left Icon</label>
										<div class="col-md-4">
											<div class="input-icon">
												<i class="fa fa-bell-o"></i>
												<input type="text" class="form-control" placeholder="Left icon">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Right Icon</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa fa-microphone"></i>
												<input type="text" class="form-control" placeholder="Right icon">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Input With Spinner</label>
										<div class="col-md-4">
											<input type="password" class="form-control spinner" placeholder="Password">
										</div>
									</div>
									<div class="form-group last">
										<label class="col-md-3 control-label">Static Control</label>
										<div class="col-md-4">
											<p class="form-control-static">
												 email@example.com
											</p>
										</div>
									</div>
								</div>
								<div class="form-actions fluid">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn green">Submit</button>
											<button type="button" class="btn default">Cancel</button>
										</div>
									</div>
								</div>
							</form>
							<!-- END FORM-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END CONTENT -->
	<%--	<%@ include file="../includes/quickSideBar.jsp"%>--%>
	<!-- BEGIN QUICK SIDEBAR -->
	<!-- END QUICK SIDEBAR -->
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