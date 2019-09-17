var GeoSetup =
        {
            loadDistricts: function (divisionId, value)
            {
                if (typeof (value) == "undefined") {
                    value = "";
                }
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'geoDistricts/getDistrictsByDivision',
                        {'geo_division_id': divisionId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-district-id", response, "--বাছাই করুন--", value);
                            
                            $('#geo-district-id').trigger('change');

                        });
            },
            loadUpazilas: function (districtId, value)
            {
                if (typeof (value) == "undefined") {
                    value = "";
                }
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'geoUpazilas/getUpazillasByDistrict',
                        {'geo_district_id': districtId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-upazila-id", response, "--বাছাই করুন--", value);
                            $('#geo-upazila-id').trigger('change');
                        });
            },
            loadUnions: function (upazilaId, value)
            {
                if (typeof (value) == "undefined") {
                    value = "";
                }
                PROJAPOTI.ajaxSubmitDataCallback(js_wb_root + 'geoUnions/getUnionsByUpazilla',
                        {'geo_upazila_id': upazilaId}, 'json',
                        function (response)
                        {
                            PROJAPOTI.projapoti_dropdown_map("#geo-union-id", response, "--বাছাই করুন--", value);
                        });
            },
        };



