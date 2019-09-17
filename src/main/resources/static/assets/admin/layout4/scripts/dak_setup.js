var DakSetup = 
{
		file_view_index : 1,
		deleted_file_attachment_ids : [],
		addFileUploadView:function()
		{
			DakSetup.file_view_index++;
			var view_str = '<div id="file_view_'+DakSetup.file_view_index+'">'+
					            '<div class="form-group form-horizontal">'+
						            '<div class="form-group">'+
						            	'<div class="col-md-1">'+
						            		'<span class="file_si badge badge-success" id="file_si_'+DakSetup.file_view_index+'">'+DakSetup.file_view_index+'.</span>'+
						            	'</div>'+
						            	'<div class="col-md-7">'+
											'<div class="input File"><input type="file" name="attachment['+DakSetup.file_view_index+'][file_name_file]" class="btn default" id="file-'+DakSetup.file_view_index+'"></div>'+
										'</div>'+
										'<div class="col-md-2">'+
											'<a class="close fileinput-exists" data-file-index="'+DakSetup.file_view_index+'" data-dismiss-view="file_view_'+DakSetup.file_view_index+'" onclick="DakSetup.removeFileView(this)" href="javascript:;"> </a>'+
										'</div>'+
						            '</div>'+
						        '</div>'+
							    '<div class="form-group form-horizontal">'+
							         '<div class="form-group">'+
							           	'<div class="col-md-10">'+
											'<div class="input text"><input type="text" name="attachment['+DakSetup.file_view_index+'][file_description]" class="form-control" placeholder="File Description" id="file-description-'+DakSetup.file_view_index+'"></div>'+
										'</div>'+
									'</div>'+
						        '</div>'+
						        '<input type="hidden" name="attachment['+DakSetup.file_view_index+'][file_dir]">'+            
							'<hr/></div>';
			$("#projapoti_more_file_view").prepend(view_str);
			DakSetup.updateFileIndex();
		},
		
		removeFileView:function(input)
		{
			var data_file_view = $(input).data('dismiss-view');
			var data_file_index = $(input).data('file-index');
			$("#"+data_file_view).hide();
			DakSetup.updateFileIndex();
		},
		
		updateFileIndex:function()
		{
			// Update File Index
			var visible_index = 0;
			for(var i = 1; i <= DakSetup.file_view_index; i++)
			{
				if($("#file_si_"+i).is(':visible'))
				{
					visible_index++;
					$("#file_si_"+i).html(visible_index);
				}
			}
		},
		
		removeFileAttachment:function(dak_attachment_id)
		{
			DakSetup.deleted_file_attachment_ids.push(dak_attachment_id);
			$("#file_enable_div_"+dak_attachment_id).hide('slow');
			$("#file_disable_div_"+dak_attachment_id).show('slow');
			$("#data_"+dak_attachment_id).removeClass('disabled');
			$("#data_"+dak_attachment_id).addClass('disabled');
			$("#deleted_attachments").val(DakSetup.deleted_file_attachment_ids);
		},
		
		enableRemovedFileAttachment:function(dak_attachment_id)
		{
			for(var i in DakSetup.deleted_file_attachment_ids){
		        if(DakSetup.deleted_file_attachment_ids[i]==dak_attachment_id){
		        	DakSetup.deleted_file_attachment_ids.splice(i,1);
		        	$("#file_enable_div_"+dak_attachment_id).show('slow');
					$("#file_disable_div_"+dak_attachment_id).hide('slow');
					$("#data_"+dak_attachment_id).removeClass('disabled');
		            break;
		            }
		    }
			$("#deleted_attachments").val(DakSetup.deleted_file_attachment_ids);
		},
		
		init:function()
		{
			$(".projapoti_add_more_file").bind('click', function(){
				DakSetup.addFileUploadView();
	        });
			$(".reload_trash_attachment").bind('click', function(){
				DakSetup.enableRemovedFileAttachment($(this).data('attachment-id'));
	        });
			$(".trash_attachment").bind('click', function(){
				DakSetup.removeFileAttachment($(this).data('attachment-id'));
	        });
			$(".file_disable_div").hide();
		}
		
};


