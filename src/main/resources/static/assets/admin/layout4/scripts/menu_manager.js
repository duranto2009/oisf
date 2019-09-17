
var MENU_SETUP = {
		setupMainMenu:function()
		{
			PROJAPOTI.ajaxLoadWithRequestData("<?= $this->request->webroot;?>ModuleMenus/add", {"is_ajax":true,"type":1}, "#menu_setup_div");		
		},
		setupSubMenu:function()
		{
			PROJAPOTI.ajaxLoadWithRequestData("<?= $this->request->webroot;?>ModuleMenus/add", {"is_ajax":true,"type":2}, "#menu_setup_div");	
		},
		setupChildMenu:function()
		{
			PROJAPOTI.ajaxLoadWithRequestData("<?= $this->request->webroot;?>ModuleMenus/add", {"is_ajax":true,"type":3}, "#menu_setup_div");	
		},
		getActionList:function($controller)
		{
			PROJAPOTI.ajaxSubmitDataCallback("<?= $this->request->webroot;?>UserRoleActions/getControllerActions",{"controller_name":controller}, function(response){
				PROJAPOTI.projapoti_dropdown("#menu_action", response, "--Select Action--");	
			});		
		}	
};
$(function () {
	// 6 create an instance when the DOM is ready
    
    $('#jstree').jstree({
	  "core" : {
	    "themes" : {
	      "variant" : "large"
	    }
	  }
	});
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
		var selected_node_class = data.node.li_attr.class;
		var selected_node_id = data.selected;
		if(selected_node_class == 'main_menu')
		{
			MENU_SETUP.setupMainMenu(selected_node_id);
		}
		else if(selected_node_class == 'sub_menu')
		{
			MENU_SETUP.setupSubMenu(selected_node_id);
		}
		else
		{
    		MENU_SETUP.setupChildMenu(selected_node_id);	
  		}
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });

    $("#menu_action").bind("change", function(){
    	MENU_SETUP.getActionList($(this).text());    
    });
  });
