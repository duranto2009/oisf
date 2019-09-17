/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = angular.module('OfflineDraft', ['ui.tinymce', 'ui.bootstrap', 'ngRoute', 'ngSanitize', 'MassAutoComplete', 'ngFileUpload','angularLocalStorage']);

app.service('ContactService', ['$http', '$q', 'Upload','storage', function ($http, $q, Upload,storage) {

        var contacts = (!storage.get('users')?[]:storage.get('users'));

        var message = '';
        var status = 0;

        this.fetch = function () {
            $http.get('getcontact')
                .success(function (data) {
                    contacts = data;
                    storage.set('users',contacts);
                    return contacts;
                }).error(function (data, status) {
                    storage.set('users',contacts);
                return contacts;
            });

            return contacts;
        }

        //simply search contacts list for given id
        //and returns the contact object if found
        this.get = function (id) {
            for (i in contacts) {
                if (contacts[i].id == id) {
                    return contacts[i];
                }
            }

        }


        //simply returns the contacts list
        this.list = function () {
            return contacts;
        }

        this.getMessage = function () {
            return message;
        }

        this.getStatus = function () {
            return status;
        }

    }]);

app.service('StorageService',['storage',function(storage){
   
    this.set = function (key, value){
        try{
            storage.set(key, value);
        }catch(e){
            
        }
    }
    
    this.get = function (key){
        
        var value = storage.get(key);
        
        if(value === null){
            return [];
        }else{
            return value;
        }
        
    }
}]);

app.controller('OfflineDraftControllers', ['$scope', '$sce', '$q', 'Upload', '$filter', 'ContactService', '$interval','StorageService','$timeout', function ($scope, $sce, $q, Upload, $filter, Contact, $interval,storage,$timeout) {

        var users = (!storage.get('users')?Contact.fetch():storage.get('users'));

        $interval(function () {
            var fetchContact = Contact.fetch();
            users = (fetchContact.length>0?fetchContact:storage.get('users'));
            storage.set('draftMessages',$scope.draftMessages);
            storage.set('tabs',$scope.tabs);
        }, 10000);

        $scope.fetchContact = function () {
            var fetchContact = Contact.fetch();
            users = (fetchContact.length>0?fetchContact:storage.get('users'));
        }

        var counter = (storage.get('counter')>0?storage.get('counter'):0);

        $scope.draftMessages = storage.get('draftMessages');
        $scope.tabs = storage.get('tabs');

        var addTab = function () {
            $scope.tabs.push({tab: counter, title: 'New Draft ' + counter, constTitle: 'New Draft ' + counter, openTab: true, mailTo: ''});
            $scope.tabs[counter].active = true;
            counter++;
            storage.set('counter',counter);
            storage.set('tabs',$scope.tabs);            
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

                    $scope.draftMessages.push({subject: $scope.tabs[index].title, tab: index, saveMessage: false, mailTo: $scope.tabs[index].mailTo, files: $filter('filter')($scope.tabs[index].files, {status: 'done'})});
                }
            
            
            storage.set('draftMessages',$scope.draftMessages);
            storage.set('tabs',$scope.tabs);

        };

        var saveMessage = function (index) {

            if ($scope.tabs[index].mailTo != '') {
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

                    $scope.draftMessages.push({subject: $scope.tabs[index].title, tab: index, saveMessage: true, mailTo: $scope.tabs[index].mailTo});
                } else {
                    $scope.draftMessages[foundIndex].saveMessage = true;
                }
                storage.set('draftMessages',$scope.draftMessages);
                storage.set('tabs',$scope.tabs);
            } else {
                $scope.tabs[index].error = "No recipients is given!";
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
        }

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
        }

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
        }

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
        }

        $scope.remove = function (tabIndex, f) {
            angular.forEach($scope.tabs[tabIndex].files, function (value, key) {
                if (value.$$hashKey == f.$$hashKey) {
                    if ($scope.tabs[tabIndex].files[key].status == 'done') {
                        Upload.http({
                            url: 'remove/' + f.name
                        })
                                .success(function (data, status, headers, config) {
                                });
                    }
                    $scope.tabs[tabIndex].files.splice(key, 1)
                }
            });
        };

        $scope.upload = function (files, index) {
            if (files && files.length) {
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    Upload.upload({
                        url: 'upload',
                        file: file
                    }).progress(function (evt) {
                        var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                        evt.config.file.progressValue = progressPercentage;
                        evt.config.file.progress = progressPercentage + '%';
                        evt.config.file.status = (evt.config.file.progressValue < 100) ? 'progress' : 'done';

                    }).success(function (data, status, headers, config) {
                        if (data != 1) {
                            $scope.tabs[index].error = data;
                            $timeout(function (){
                                $scope.tabs[index].error = '';                                
                            }, 3000);
                            $scope.remove(index, file);
                        } else {
                            $scope.tabs[index].error = '';
                        }
                    });
                }
            }
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



