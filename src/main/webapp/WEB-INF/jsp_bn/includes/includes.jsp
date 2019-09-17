<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/assets/global/plugins/respond.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/jstree/dist/jstree.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>

<%--commented!!!!!--%>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-titlealert/jquery.titlealert.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/index.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/ui-general.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/ui-toastr.js"></script>


<%--updated bootstrap --%>

<%--end of updated--%>



<%--<script src="static/assets/global/plugins/helium-css-master/helium.js" type="text/javascript"></script>--%>
<style ></style>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo features
   
   $("#fileMessageCounterPulse").pulsate();
   $("#messageCounterPulse, .page-quick-sidebar .badge").pulsate({color:'#FF5722'});

    $(".link").click(
        function()
        {
            postLink = $(this).attr("data-id");
            searchText($(this).attr("data-id"));
        }
    )


});
</script>


<script th:inline="javascript">
    var postLink;
    function loginWithToken(token){
        $("#token").val(token.trim());
        //$("#oisfForm").attr("action","http://162.222.186.235/billing/oisf/testOisf.jsp");
        //$("#oisfForm").attr("action","http://localhost/projapoti_framework/login");
        $("#oisfForm").attr("action",postLink);
        $("#oisfForm").submit();
    }

    $( document ).ready(function() {
        $(".link").click(
            function()
            {
                postLink = $(this).attr("data-id");
                searchText($(this).attr("data-id"));
            }
        )
    });

    function  searchText(url) {
        var search = {
            "pName" : url,
            "lName" :"prasad"
        }
        $.ajax({
            type: "POST",
            contentType : 'application/json; charset=utf-8',
            dataType : 'text',
            url: "/gDirecotry/ajax/searchUserProfiles.htm",
            data: JSON.stringify(search), // Note it is important
            success :function(result) {
                loginWithToken(result.trim());
            }
        })};
</script>



<!-- END JAVASCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/js/menu.js" type="text/javascript"></script>
<!-- socket functions -->
