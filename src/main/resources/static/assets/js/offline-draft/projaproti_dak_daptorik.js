/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = angular.module('OfflineDakDaptorik', ['ui.tinymce', 'ui.bootstrap', 'ngRoute', 'ngSanitize', 'MassAutoComplete', 'ngFileUpload','angularLocalStorage']);

app.service('StorageService',['storage',function(storage){
   
    this.set = function (key, value){
        try{
            storage.set(key, value);
        }catch(e){

        }
    };
    
    this.get = function (key){
        
        var value = storage.get(key);
        
        if(value === null){
            return [];
        }else{
            return value;
        }
        
    }
}]);

app.controller('OfflineDakDaptorikControllers', ['$scope', '$sce', '$q', 'Upload', '$filter', '$interval','StorageService','$timeout', function ($scope, $sce, $q, Upload, $filter, $interval,storage,$timeout) {

        var counter = (storage.get('daptorikcounter')>0?storage.get('daptorikcounter'):0);

        $scope.draftMessages = storage.get('daptorikdraftMessages');
        $scope.tabs = storage.get('daptoriktabs');

        var addTab = function () {
            $scope.tabs.push({tab: counter, title: 'নতুন দাকপ্তরিক ডাক ' + counter, constTitle: 'নতুন দাকপ্তরিক ডাক ' + counter, openTab: true, mailTo: ''});
            $scope.tabs[counter].active = true;
            counter++;
            storage.set('daptorikcounter',counter);
            storage.set('daptoriktabs',$scope.tabs);            
        };

        var closeTab = function (event, index) {
            event.preventDefault();
            event.stopPropagation();
            $scope.tabs[index].openTab = false;
            $scope.tabs[index].error = '';
            
            var found = false;
            
            angular.forEach($scope.draftMessages, function (value, key) {
                if(value.tab == index){
                    found = true;
                }
               
            });
            
             if (!found) {
                    angular.forEach($scope.tabs[index].files, function (value, key) {
                        if (value.status != 'done') {
                            $scope.tabs[index].files[key] = [];
                        }
                    });

                    $scope.draftMessages.push({subject: $scope.tabs[index].title, tab: index, saveMessage: false,  files: $filter('filter')($scope.tabs[index].files, {status: 'done'})});
                }
            
            
            storage.set('daptorikdraftMessages',$scope.draftMessages);
            storage.set('daptoriktabs',$scope.tabs);

        };

        var saveMessage = function (index) {

            if ($scope.tabs[index].subject != '') {
                $scope.tabs[index].openTab = false;
                $scope.tabs[index].saveMessage = true;
                $scope.tabs[index].error = '';
                
                var found = false;
                var foundIndex = -1;
                
                angular.forEach($scope.draftMessages, function (value, key) {
                    if (value.tab == index) {
                        found = true;
                        foundIndex = key;
                    }
                });
                
                if (!found) {
                    angular.forEach($scope.tabs[index].files, function (value, key) {
                        if (value.status != 'done') {
                            $scope.tabs[index].files[key] = [];
                        }
                    });
                    $scope.draftMessages.push({subject: $scope.tabs[index].title, tab: index, saveMessage: true});
                } else {
                    $scope.draftMessages[foundIndex].saveMessage = true;
                }
                storage.set('daptorikdraftMessages',$scope.draftMessages);
                storage.set('daptoriktabs',$scope.tabs);
            } else {
                $scope.tabs[index].error = "No subject is given!";
                $timeout(function (){
                    $scope.tabs[index].error = '';                                
                }, 3000);
            }
        };

        var viewTab = function (event, index) {
            event.preventDefault();
            event.stopPropagation();
            var found = false;
            var foundIndex = -1;
            angular.forEach($scope.draftMessages, function (value, key) {
                if (value.tab == index) {
                    found = true;
                    foundIndex = index;
                }
            });
            
            if(found){
                $scope.tabs[foundIndex].openTab = true;
                $scope.tabs[foundIndex].error = '';
            }
        };

        $scope.updateSubject = function (draft, tab) {
            var found = false;
            var foundIndex = -1;
            
            if (tab.subject != '') {
                tab.title = tab.subject;

            } else {
                tab.title = tab.constTitle;
            }
            tab.error = '';
            
            angular.forEach(draft, function (value, key) {
                if (value.tab == tab.tab) {
                    found = true;
                    foundIndex = key;
                }
            });
            
            if (found) {
                draft[foundIndex].subject = tab.title;
            }
        };

        function highlight(str, term) {
            var highlight_regex = new RegExp('(' + term + ')', 'gi');
            return str.replace(highlight_regex,'<span class="highlight">$1</span>');
        }

        function suggest_users(term) {
            if (term.length > 0) {
                var q = term.toLowerCase().trim()
            } else {
                var q = term;
            }
            results = [];
            for (var i = 0; i < users.length; i++) {

                var user = users[i];
                if (user.username.toLowerCase().indexOf(q) !== -1)
                    results.push({
                        value: user.username + ',',
                        // Pass the object as well. Can be any property name.
                        obj: user,
                        label: $sce.trustAsHtml(
                                '  <strong>' + highlight(user.username, term) + '</strong> '
                                )
                    });
            }
            return results;
        }

        function suggest_state_delimited(term) {
            var ix = term.lastIndexOf(','),
                    lhs = term.substring(0, ix + 1),
                    rhs = term.substring(ix + 1),
                    suggestions = suggest_users(rhs);

            suggestions.forEach(function (s) {
                s.value = lhs + s.value;
            });
            return suggestions;
        }
        

        $scope.ac_options_users = {
            suggest: suggest_state_delimited
        };

        $scope.closeTab = closeTab;
        $scope.addTab = addTab;
        $scope.viewTab = viewTab;
        $scope.saveMessage = saveMessage;

        $scope.showSave = function (index) {
            
            var found = false;
            var foundIndex = -1;
            
            angular.forEach($scope.draftMessages, function (value, key) {
                if (value.tab == index) {
                    found = true;
                    foundIndex = key;
                }
            });
            
            
            if (found && $scope.draftMessages[foundIndex].saveMessage == true)
                return false;

            return true;
        };
        
        $scope.checkWords = function (val){
            var str = val.tab.content;
            var text = str.replace(/<[^>]+>/g, '');
            text = text.replace(/&nbsp;/g, ' ');
                // This merges all spaces and tabs following each other into a single space
            text = text.replace(/[\s\t]+/g, ' ');
            // This removes spaces and the begin and end of the text
            text = text.replace(/^\s*/, '').replace(/\s*$/, '');
            
        }
        
        
    }]);

app.directive('tabHighlight', [function () {
        return {
            restrict: 'A',
            link: function (scope, element) {
                var x, y;

                element
                        .removeAttr('style')
                        .mousemove(function (e) {
                            // Add highlight effect on inactive tabs
                            if (!element.hasClass('active'))
                            {
                                x = e.pageX - this.offsetLeft;
                                y = e.pageY - this.offsetTop;

                                element
                                        .css({background: '-moz-radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + initial_background})
                                        .css({background: '-webkit-radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + initial_background})
                                        .css({background: 'radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + initial_background});
                            }
                        })
                        .mouseout(function () {
                            element.removeAttr('style');
                        });
            }
        };
    }]);

// The fileUpload service provides configuration options
        // for the fileUpload directive and default handlers for
        // File Upload events:
        app.provider('fileUpload', function () {
            var scopeEvalAsync = function (expression) {
                    var scope = angular.element(this)
                            .fileupload('option', 'scope');
                    // Schedule a new $digest cycle if not already inside of one
                    // and evaluate the given expression:
                    scope.$evalAsync(expression);
                },
                addFileMethods = function (scope, data) {
                    var files = data.files,
                        file = files[0];
                    angular.forEach(files, function (file, index) {
                        file._index = index;
                        file.$state = function () {
                            return data.state();
                        };
                        file.$processing = function () {
                            return data.processing();
                        };
                        file.$progress = function () {
                            return data.progress();
                        };
                        file.$response = function () {
                            return data.response();
                        };
                    });
                    file.$submit = function () {
                        if (!file.error) {
                            return data.submit();
                        }
                    };
                    file.$cancel = function () {
                        return data.abort();
                    };
                },
                $config;
            $config = this.defaults = {
                handleResponse: function (e, data) {
                    var files = data.result && data.result.files;
                    if (files) {
                        data.scope.replace(data.files, files);
                    } else if (data.errorThrown ||
                            data.textStatus === 'error') {
                        data.files[0].error = data.errorThrown ||
                            data.textStatus;
                    }
                },
                add: function (e, data) {
                    if (e.isDefaultPrevented()) {
                        return false;
                    }
                    var scope = data.scope,
                        filesCopy = [];
                    angular.forEach(data.files, function (file) {
                        filesCopy.push(file);
                    });
                    scope.$parent.$applyAsync(function () {
                        addFileMethods(scope, data);
                        var method = scope.option('prependFiles') ?
                                'unshift' : 'push';
                        Array.prototype[method].apply(scope.queue, data.files);
                    });
                    data.process(function () {
                        return scope.process(data);
                    }).always(function () {
                        scope.$parent.$applyAsync(function () {
                            addFileMethods(scope, data);
                            scope.replace(filesCopy, data.files);
                        });
                    }).then(function () {
                        if ((scope.option('autoUpload') ||
                                data.autoUpload) &&
                                data.autoUpload !== false) {
                            data.submit();
                        }
                    });
                },
                done: function (e, data) {
                    if (e.isDefaultPrevented()) {
                        return false;
                    }
                    var that = this;
                    data.scope.$apply(function () {
                        data.handleResponse.call(that, e, data);
                    });
                },
                fail: function (e, data) {
                    if (e.isDefaultPrevented()) {
                        return false;
                    }
                    var that = this,
                        scope = data.scope;
                    if (data.errorThrown === 'abort') {
                        scope.clear(data.files);
                        return;
                    }
                    scope.$apply(function () {
                        data.handleResponse.call(that, e, data);
                    });
                },
                stop: scopeEvalAsync,
                processstart: scopeEvalAsync,
                processstop: scopeEvalAsync,
                getNumberOfFiles: function () {
                    var scope = this.scope;
                    return scope.queue.length - scope.processing();
                },
                dataType: 'json',
                autoUpload: false
            };
            this.$get = [
                function () {
                    return {
                        defaults: $config
                    };
                }
            ];
        })

        // Format byte numbers to readable presentations:
        .provider('formatFileSizeFilter', function () {
            var $config = {
                // Byte officeunit following the IEC format
                // http://en.wikipedia.org/wiki/Kilobyte
                units: [
                    {size: 1000000000, suffix: ' GB'},
                    {size: 1000000, suffix: ' MB'},
                    {size: 1000, suffix: ' KB'}
                ]
            };
            this.defaults = $config;
            this.$get = function () {
                return function (bytes) {
                    if (!angular.isNumber(bytes)) {
                        return '';
                    }
                    var unit = true,
                        i = 0,
                        prefix,
                        suffix;
                    while (unit) {
                        unit = $config.units[i];
                        prefix = unit.prefix || '';
                        suffix = unit.suffix || '';
                        if (i === $config.units.length - 1 || bytes >= unit.size) {
                            return prefix + (bytes / unit.size).toFixed(2) + suffix;
                        }
                        i += 1;
                    }
                };
            };
        })

        // The FileUploadController initializes the fileupload widget and
        // provides scope methods to control the File Upload functionality:
        .controller('FileUploadController', [
            '$scope', '$element', '$attrs', '$window', 'fileUpload',
            function ($scope, $element, $attrs, $window, fileUpload) {
                var uploadMethods = {
                    progress: function () {
                        return $element.fileupload('progress');
                    },
                    active: function () {
                        return $element.fileupload('active');
                    },
                    option: function (option, data) {
                        if (arguments.length === 1) {
                            return $element.fileupload('option', option);
                        }
                        $element.fileupload('option', option, data);
                    },
                    add: function (data) {
                        return $element.fileupload('add', data);
                    },
                    send: function (data) {
                        return $element.fileupload('send', data);
                    },
                    process: function (data) {
                        return $element.fileupload('process', data);
                    },
                    processing: function (data) {
                        return $element.fileupload('processing', data);
                    }
                };
                $scope.disabled = !$window.jQuery.support.fileInput;
                $scope.queue = $scope.queue || [];
                $scope.clear = function (files) {
                    var queue = this.queue,
                        i = queue.length,
                        file = files,
                        length = 1;
                    if (angular.isArray(files)) {
                        file = files[0];
                        length = files.length;
                    }
                    while (i) {
                        i -= 1;
                        if (queue[i] === file) {
                            return queue.splice(i, length);
                        }
                    }
                };
                $scope.replace = function (oldFiles, newFiles) {
                    var queue = this.queue,
                        file = oldFiles[0],
                        i,
                        j;
                    for (i = 0; i < queue.length; i += 1) {
                        if (queue[i] === file) {
                            for (j = 0; j < newFiles.length; j += 1) {
                                queue[i + j] = newFiles[j];
                            }
                            return;
                        }
                    }
                };
                $scope.applyOnQueue = function (method) {
                    var list = this.queue.slice(0),
                        i,
                        file;
                    for (i = 0; i < list.length; i += 1) {
                        file = list[i];
                        if (file[method]) {
                            file[method]();
                        }
                    }
                };
                $scope.submit = function () {
                    this.applyOnQueue('$submit');
                };
                $scope.cancel = function () {
                    this.applyOnQueue('$cancel');
                };
                // Add upload methods to the scope:
                angular.extend($scope, uploadMethods);
                // The fileupload widget will initialize with
                // the options provided via "data-"-parameters,
                // as well as those given via options object:
                $element.fileupload(angular.extend(
                    {scope: $scope},
                    fileUpload.defaults
                )).on('fileuploadadd', function (e, data) {
                    data.scope = $scope;
                }).on('fileuploadfail', function (e, data) {
                    if (data.errorThrown === 'abort') {
                        return;
                    }
                    if (data.dataType &&
                            data.dataType.indexOf('json') === data.dataType.length - 4) {
                        try {
                            data.result = angular.fromJson(data.jqXHR.responseText);
                        } catch (ignore) {}
                    }
                }).on([
                    'fileuploadadd',
                    'fileuploadsubmit',
                    'fileuploadsend',
                    'fileuploaddone',
                    'fileuploadfail',
                    'fileuploadalways',
                    'fileuploadprogress',
                    'fileuploadprogressall',
                    'fileuploadstart',
                    'fileuploadstop',
                    'fileuploadchange',
                    'fileuploadpaste',
                    'fileuploaddrop',
                    'fileuploaddragover',
                    'fileuploadchunksend',
                    'fileuploadchunkdone',
                    'fileuploadchunkfail',
                    'fileuploadchunkalways',
                    'fileuploadprocessstart',
                    'fileuploadprocess',
                    'fileuploadprocessdone',
                    'fileuploadprocessfail',
                    'fileuploadprocessalways',
                    'fileuploadprocessstop'
                ].join(' '), function (e, data) {
                    $scope.$parent.$applyAsync(function () {
                        if ($scope.$emit(e.type, data).defaultPrevented) {
                            e.preventDefault();
                        }
                    });
                }).on('remove', function () {
                    // Remove upload methods from the scope,
                    // when the widget is removed:
                    var method;
                    for (method in uploadMethods) {
                        if (uploadMethods.hasOwnProperty(method)) {
                            delete $scope[method];
                        }
                    }
                });
                // Observe option changes:
                $scope.$watch(
                    $attrs.fileUpload,
                    function (newOptions) {
                        if (newOptions) {
                            $element.fileupload('option', newOptions);
                        }
                    }
                );
            }
        ])

        // Provide File Upload progress feedback:
        .controller('FileUploadProgressController', [
            '$scope', '$attrs', '$parse',
            function ($scope, $attrs, $parse) {
                var fn = $parse($attrs.fileUploadProgress),
                    update = function () {
                        var progress = fn($scope);
                        if (!progress || !progress.total) {
                            return;
                        }
                        $scope.num = Math.floor(
                            progress.loaded / progress.total * 100
                        );
                    };
                update();
                $scope.$watch(
                    $attrs.fileUploadProgress + '.loaded',
                    function (newValue, oldValue) {
                        if (newValue !== oldValue) {
                            update();
                        }
                    }
                );
            }
        ])

        // Display File Upload previews:
        .controller('FileUploadPreviewController', [
            '$scope', '$element', '$attrs',
            function ($scope, $element, $attrs) {
                $scope.$watch(
                    $attrs.fileUploadPreview + '.preview',
                    function (preview) {
                        $element.empty();
                        if (preview) {
                            $element.append(preview);
                        }
                    }
                );
            }
        ])

        .directive('fileUpload', function () {
            return {
                controller: 'FileUploadController',
                scope: true
            };
        })

        .directive('fileUploadProgress', function () {
            return {
                controller: 'FileUploadProgressController',
                scope: true
            };
        })

        .directive('fileUploadPreview', function () {
            return {
                controller: 'FileUploadPreviewController'
            };
        })

        // Enhance the HTML5 download attribute to
        // allow drag&drop of files to the desktop:
        .directive('download', function () {
            return function (scope, elm) {
                elm.on('dragstart', function (e) {
                    try {
                        e.originalEvent.dataTransfer.setData(
                            'DownloadURL',
                            [
                                'application/octet-stream',
                                elm.prop('download'),
                                elm.prop('href')
                            ].join(':')
                        );
                    } catch (ignore) {}
                });
            };
        });
