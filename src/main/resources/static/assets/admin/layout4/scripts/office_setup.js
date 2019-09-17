var OfficeSetup =
        {
            loadOfficeUnits: function (office_id, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeManagement/loadOfficeUnits',
                {'office_id': office_id}, 'html',
                function (response) {
                    $("#" + prefix + "office-unit-id").html(response);
                });
               
            },
            loadOfficeUnitOrganograms: function (office_unit_id, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeManagement/loadOfficeUnitOrganograms',
                        {'office_unit_id': office_unit_id}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-unit-organogram-id", response, "--বাছাই করুন--");
                            if (callback != "")
                            {
                                callback(response);
                            }
                        });
            },
            loadLayers: function (ministryId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadLayersByMinistry',
                        {'office_ministry_id': ministryId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-layer-id", response, "--বাছাই করুন--");
                            if (callback != "")
                            {
                                callback(response);
                            }
                        });
            },
            loadLayersCallback: function (ministryId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadLayersByMinistry',
                        {'office_ministry_id': ministryId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-layer-id", response, "--বাছাই করুন--");
                            callback(response);
                        });
            },
            loadParentOffices: function (ministryId, layerId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadOfficesByMinistryAndLayer',
                        {'office_ministry_id': ministryId, 'office_layer_id': layerId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-parent-id", response, "--বাছাই করুন--");
                            if (callback != "")
                            {
                                callback(response);
                            }
                        });
            },
            loadParentOfficesByMinistry: function (ministryId, prefix)
            {
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadParentOfficesByMinistry',
                        {'office_ministry_id': ministryId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "parent-office-id", response, "--বাছাই করুন--");
                        });
            },
            //Office Origin
            /*
             * For add page: no callback function
             * for edit page: add a callback function for input box previous value selection
             */
            loadParentOfficesAndLayersByMinistry: function (ministryId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadParentOfficesAndLayersByMinistry',
                        {'office_ministry_id': ministryId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-layer-id", response.layers, "--বাছাই করুন--");
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "parent-office-id", response.parents, "--বাছাই করুন--");
                            if (callback != "")
                            {
                                callback();
                            }
                        });
            },
            loadOffices: function (ministryId, layerId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadOfficesByMinistryAndLayer',
                        {'office_ministry_id': ministryId, 'office_layer_id': layerId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-origin-id", response, "--বাছাই করুন--");
                            if (callback != "")
                            {
                                callback();
                            }
                        });
            },
            loadOfficesAndDesignations: function (ministryId, layerId, prefix)
            {
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadOfficesAndDesignationsByMinistryAndLayer',
                        {'office_ministry_id': ministryId, 'office_layer_id': layerId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-id", response.offices, "--বাছাই করুন--", "");
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "superior-designation-id", response.designations, "--বাছাই করুন--", "");

                        });
            },
            loadDistricts: function (divisionId)
            {
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadDistrictsByDivision',
                        {'division_id': divisionId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-district-id", response, "--বাছাই করুন--");
                        });
            },
            loadUpazilas: function (districtId)
            {
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadUpazilasByDistrict',
                        {'district_id': districtId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-upazila-id", response, "--বাছাই করুন--");
                        });
            },
            loadUnions: function (upazilaId)
            {
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeSettings/loadUnionsByUpazila',
                        {'upazila_id': upazilaId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-union-id", response, "--বাছাই করুন--");
                        });
            },
            loadOriginOffices: function (originId, callback, prefix)
            {
                if (typeof (callback) == "undefined")
                    callback = "";
                if (typeof (prefix) == "undefined")
                    prefix = "";
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'officeManagement/loadOriginOffices',
                        {'office_origin_id': originId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#" + prefix + "office-id", response, "--বাছাই করুন--");

                            if (callback != "")
                            {
                                callback(response);
                            }
                        });
            },
            init: function ()
            {
                $("#office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    OfficeSetup.loadLayers(office_ministry_id);
                });

                $("#office-layer-id").bind('change', function ()
                {
                    var office_ministry_id = $("#office-ministry-id").val();
                    var office_layer_id = $(this).val();
                    OfficeSetup.loadOffices(office_ministry_id, office_layer_id);
                });

                $("#OfficeRecordsForm #office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    OfficeSetup.loadParentOfficesAndLayersByMinistry(office_ministry_id);
                });

                $("#OfficeOrganogramsForm #office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    OfficeSetup.loadLayers(office_ministry_id);
                });

                $("#OfficeForm #office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    /* OfficeSetup.loadLayers(office_ministry_id); */
                    OfficeSetup.loadParentOfficesAndLayersByMinistry(office_ministry_id);
                });

                $("#OfficeSettingsForm #office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    OfficeSetup.loadParentOfficesAndLayersByMinistry(office_ministry_id);
                });

                $("#OfficeRecordsForm #office-layer-id").bind('change', function ()
                {
                    var office_ministry_id = $("#office-ministry-id").val();
                    var office_layer_id = $(this).val();
                    OfficeSetup.loadOffices(office_ministry_id, office_layer_id);
                });

                $("#OfficeOrganogramsForm #office-layer-id").bind('change', function ()
                {
                    var office_ministry_id = $("#office-ministry-id").val();
                    var office_layer_id = $(this).val();
                    //OfficeSetup.loadOffices(office_ministry_id, office_layer_id);
                    OfficeSetup.loadOfficesAndDesignations(office_ministry_id, office_layer_id);
                });

                $("#OfficeOrganogramTreeForm #office-ministry-id").bind('change', function ()
                {
                    var office_ministry_id = $(this).val();
                    OfficeSetup.loadLayers(office_ministry_id);
                });

                $("#OfficeOrganogramTreeForm #office-layer-id").bind('change', function ()
                {
                    var office_ministry_id = $("#office-ministry-id").val();
                    var office_layer_id = $(this).val();
                    //OfficeSetup.loadOffices(office_ministry_id, office_layer_id);
                    OfficeSetup.loadOfficesAndDesignations(office_ministry_id, office_layer_id);
                });


                $("#OfficeRecordsForm #geo-division-id").bind('change', function ()
                {
                    var geo_division_id = $(this).val();
                    OfficeSetup.loadDistricts(geo_division_id);
                });

                $("#OfficeRecordsForm #geo-district-id").bind('change', function ()
                {
                    var geo_district_id = $(this).val();
                    OfficeSetup.loadUpazilas(geo_district_id);
                });

                $("#OfficeRecordsForm #geo-upazila-id").bind('change', function ()
                {
                    var geo_upazila_id = $(this).val();
                    OfficeSetup.loadUnions(geo_upazila_id);
                });

            }

        };



