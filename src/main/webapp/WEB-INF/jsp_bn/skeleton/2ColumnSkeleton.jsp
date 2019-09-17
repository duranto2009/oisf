


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
							<div class="caption"><i class="fa fa-gift"></i>Form Sample</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="#portlet-config" data-toggle="modal" class="config"></a>
								<a href="javascript:;" class="reload"></a>
								<a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<form action="#" class="form-horizontal">
								<div class="form-body">
									<h3 class="form-section">Person Info</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">First Name</label>
												<div class="col-md-9">
													<input type="text" class="form-control" placeholder="Chee Kin">
													<span class="help-block">
													This is inline help </span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group has-error">
												<label class="control-label col-md-3">Last Name</label>
												<div class="col-md-9">
													<select name="foo" class="select2me form-control">
														<option value="1">Abc</option>
														<option value="1">Abc</option>
														<option value="1">This is a really long value that breaks the fluid design for a select2</option>
													</select>
													<span class="help-block">
													This field has error. </span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Gender</label>
												<div class="col-md-9">
													<select class="form-control">
														<option value="">Male</option>
														<option value="">Female</option>
													</select>
													<span class="help-block">
													Select your gender. </span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Date of Birth</label>
												<div class="col-md-9">
													<input type="text" class="form-control" placeholder="dd/mm/yyyy">
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Category</label>
												<div class="col-md-9">
													<select class="select2_category form-control" data-placeholder="Choose a Category" tabindex="1">
														<option value="Category 1">Category 1</option>
														<option value="Category 2">Category 2</option>
														<option value="Category 3">Category 5</option>
														<option value="Category 4">Category 4</option>
													</select>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Membership</label>
												<div class="col-md-9">
													<div class="radio-list">
														<label class="radio-inline">
														<input type="radio" name="optionsRadios2" value="option1"/>
														Free </label>
														<label class="radio-inline">
														<input type="radio" name="optionsRadios2" value="option2" checked/>
														Professional </label>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<h3 class="form-section">Address</h3>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Address 1</label>
												<div class="col-md-9">
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Address 2</label>
												<div class="col-md-9">
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">City</label>
												<div class="col-md-9">
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">State</label>
												<div class="col-md-9">
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Post Code</label>
												<div class="col-md-9">
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Country</label>
												<div class="col-md-9">
													<select class="form-control">
														<option>Country 1</option>
														<option>Country 2</option>
													</select>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-offset-3 col-md-9">
													<button type="submit" class="btn green">Submit</button>
													<button type="button" class="btn default">Cancel</button>
												</div>
											</div>
										</div>
										<div class="col-md-6">
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
		<%@ include file="../includes/quickSideBar.jsp"%>
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