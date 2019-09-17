    angular.module('ui.tinymce', [])
        .value('uiTinymceConfig', {selector: "textarea.composerDes",
            theme: "modern",
            browser_spellcheck: true,
            plugins: [
                "autolink link lists charmap hr anchor pagebreak",
                "searchreplace wordcount code insertdatetime nonbreaking",
                "save table directionality emoticons paste textcolor"
            ],
            statusbar: false,
            menubar: false,
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link forecolor backcolor emoticons | fontselect",
            paste_retain_style_properties: "all",
            font_formats: "Nikosh=Nikosh;Arial=arial;Helvetica=helvetica,Sans-serif=sans-serif;Courier New=courier new;Courier=courier,Monospace=monospace;Comic Sans MS=comic sans ms;Times New Roman=times new roman,times;Kalpurush=kalpurush;Siyamrupali=Siyamrupali;SolaimanLipi=SolaimanLipi;",
            style_formats: [
                {title: 'Bold text', inline: 'b'},
                {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                {title: 'Table styles'},
                {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
            ]})
        .directive('uiTinymce', ['uiTinymceConfig', '$parse', function (uiTinymceConfig, $parse) {
                uiTinymceConfig = uiTinymceConfig || {};
                var generatedIds = 0;
                return {
                    require: 'ngModel',
                    link: function (scope, elm, attrs, ngModel) {
                        var expression, options, tinyInstance;
                        // generate an ID if not present
                        if (!attrs.id) {
                            attrs.$set('id', 'uiTinymce' + generatedIds++);
                        }
                        options = {
                            // Update model when calling setContent (such as from the source editor popup)
                            setup: function (ed) {
                                ed.on('init', function (args) {
                                    ngModel.$render();
                                });
                                // Update model on button click
                                ed.on('ExecCommand', function (e) {
                                    ed.save();
                                    ngModel.$setViewValue(elm.val());
                                    if (!scope.$$phase) {
                                        scope.$apply();
                                    }
                                });
                                // Update model on keypress
                                ed.on('KeyUp', function (e) {
                                    ed.save();
                                    ngModel.$setViewValue(elm.val());
                                    if (!scope.$$phase) {
                                        scope.$apply();
                                    }
                                });
                            },
                            mode: 'exact',
                            elements: attrs.id
                        };
                        if (attrs.uiTinymce) {
                            expression = scope.$eval(attrs.uiTinymce);
                        } else {
                            expression = {};
                        }
                        angular.extend(options, uiTinymceConfig, expression);
                        setTimeout(function () {

                            if ($parse(attrs.ngDisabled)(scope)) {
                                options.readonly = 1;
                            }
                            tinymce.init(options);
                        });


                        ngModel.$render = function () {
                            if (!tinyInstance) {
                                tinyInstance = tinymce.get(attrs.id);
                            }
                            if (tinyInstance) {
                                tinyInstance.setContent(ngModel.$viewValue || '');
                            }
                        };
                    }
                };
            }]); 