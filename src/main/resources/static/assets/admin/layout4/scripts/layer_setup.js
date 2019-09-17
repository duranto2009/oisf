var LayerSetup =
        {
            superior_layer_id: 0,
            ministry_id: 0,
            selected_node_id: "",
            loadTree: function (element_id)
            {
                $(element_id).jstree("refresh");
                $(element_id).jstree({
                    "core": {
                        "themes": {
                            "variant": "large",
                        },
                        'data': {
                            'url': function (node) {
                                return node.id === '#' ?
                                        js_wb_root + 'officeOriginTree/loadRootNode' : js_wb_root + 'officeOriginTree/loadOfficeLayers';
                            },
                            'data': function (node) {
                                return {'id': node.id, 'type': "data", 'office_ministry_id': $("#layer-form-ministry-id").val()};
                            }
                        }
                    }
                });
            },
            saveLayer: function ()
            {
                LayerSetup.superior_layer_id = $("#office-layer-id").val();
                LayerSetup.ministry_id = $("#layer-form-ministry-id").val();

                var url = js_wb_root + "officeSettings/addLayer";

                PROJAPOTI.ajaxSubmitDataCallback(url, {'formdata': $("#OfficeLayerForm").serialize()}, "json", function (response) {
                    $("#OfficeLayerForm").find("input[type=text], textarea").val("");
                    if (response == 1)
                    {
                        OfficeSetup.loadLayers($("#layer-form-ministry-id").val());
                        $('#tree_panel li').each(function () {
                            var id = $(this).attr('id');
                            var arr = id.split('_');
                            var layer_id = arr.pop();
                            if (layer_id == LayerSetup.superior_layer_id)
                            {
                                $("#tree_panel").jstree("load_node", $('#' + id));
                                $("#tree_panel").jstree("open_node", $('#' + id));
                                LayerSetup.selected_node_id = id;
                                return false;
                            }
                        });

                    } else
                    {
                        alert("Failed to add office layer.");
                    }
                });
            },
            deleteLayer: function ()
            {
                if(confirm("Are you sure want to delete?")){
                    LayerSetup.superior_layer_id = $("#office-layer-id").val();
                    LayerSetup.ministry_id = $("#layer-form-ministry-id").val();
                    var layerId = $("#layer-id").val();

                    var url = js_wb_root + "officeSettings/deleteLayer/" + layerId;

                    PROJAPOTI.ajaxSubmitDataCallback(url, {'id': layerId}, "json", function (response) {
                        $("#OfficeLayerForm").find("input[type=text], textarea").val("");
                        if (response == 1)
                        {
                            $('#tree_panel li').each(function () {
                                var id = $(this).attr('id');
                                var arr = id.split('_');
                                var layer_id = arr.pop();
                                if (layer_id == LayerSetup.superior_layer_id)
                                {
                                    $("#tree_panel").jstree("load_node", $('#' + id));
                                    $("#tree_panel").jstree("open_node", $('#' + id));
                                    LayerSetup.selected_node_id = id;
                                    return false;
                                }
                            });
                        } else
                        {
                            alert("Failed to delete office layer.");
                        }
                    });
                }
            },
            gotoEdit: function (input)
            {
                var node_id = $(input).data('id');
                var layer_id = node_id.split('_').pop();
                var url = js_wb_root + "officeSettings/getLayerById/" + layer_id;
                PROJAPOTI.ajaxSubmitDataCallback(url, '', "json", function (response) {
                    $("#layer-id").val(response.id);
                    $("#layer-form-ministry-id").val(response.office_ministry_id);
                    $("#layer-name-bng").val(response.layer_name_bng);
                    $("#layer-name-eng").val(response.layer_name_eng);
                    $("#layer-level").val(response.layer_level);
                    $("#layer-sequence").val(response.layer_sequence);
                    OfficeSetup.loadLayersCallback(response.office_ministry_id, function (r)
                    {
                        $("#office-layer-id").val(response.parent_layer_id);
                    });
                });
            },
            init: function ()
            {
                LayerSetup.loadTree("#tree_panel");
                $("#layer-form-ministry-id").bind('change',
                        function ()
                        {
                            $("#tree_panel").jstree("load_node", $('#node_0_0_0'));
                            $("#tree_panel").jstree("open_node", $('#node_0_0_0'));
                            LayerSetup.selected_node_id = 'layer_0_0_0';
                            OfficeSetup.loadLayers($(this).val());
                        }
                );
                $("#submitButton").bind('click',
                        function ()
                        {
                            LayerSetup.saveLayer();
                        }
                );
                $("#deleteButton").bind('click',
                        function ()
                        {
                            LayerSetup.deleteLayer();
                        }
                );
            }

        };



