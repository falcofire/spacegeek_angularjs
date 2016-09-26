(function(){
var app = angular.module('spacegeek', []);

var stories = [];

app.config(function(facebookProvider) {
    facebookProvider.setAppID('282870535397392');
});

app.controller('FrontpageController', ['$http', '$scope', 'facebook', function($http, $scope, facebook) {
    if (facebook.getLoginStatus(function(result){return result;})) {
    	console.log('Already logged in.');
    } else {
    	facebook.login(function (accessToken) {
            facebook.graph('nasa?fields=id,name,posts{full_picture,message,picture}', function(results){
            }).then(function(response){
            	$http.post('/spacegeek_angularjs/writeJson', {name:'NASA', data:response}).success(function(data){
            	});
            });
            facebook.graph('nasajpl?fields=id,name,posts{full_picture,likes.summary(true).limit(0),message,picture,shares}', function(results){
            }).then(function(response){
            	$http.post('/spacegeek_angularjs/writeJson', {name:'NASAJPL', data:response}).success(function(data){
            	});
            });
            facebook.graph('spacex?fields=id,name,posts{full_picture,likes.summary(true).limit(0),message,picture,shares}', function(results){
            }).then(function(response){
            	$http.post('/spacegeek_angularjs/writeJson', {name:'SpaceX', data:response}).success(function(data){
            	});
            });
            facebook.graph('esa?fields=id,name,posts{full_picture,message,picture}', function(results){
            }).then(function(response){
            	$http.post('/spacegeek_angularjs/writeJson', {name:'ESA', data:response}).success(function(data){
            	});
            });
            facebook.graph('iss?fields=id,name,posts{full_picture,message,picture}', function(results){
            }).then(function(response){
            	$http.post('/spacegeek_angularjs/writeJson', {name:'ISS', data:response}).success(function(data){
            	});
            });
        });
    }
}]);

app.controller('TabController', ['$http', '$scope', function($http, $scope){
	this.tab = 0;
	this.selectTab = function(setTab){
		this.tab = setTab;
		switch(setTab) {
			case 1: 
	            $http.get('/spacegeek_angularjs/writeJson?name=SpaceX').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
			case 2:
	            $http.get('/spacegeek_angularjs/writeJson?name=ISS').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
			case 3:
				$http.get('/spacegeek_angularjs/writeJson?name=NASA').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
			case 4:
				$http.get('/spacegeek_angularjs/writeJson?name=NASAJPL').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
			case 5:
				$http.get('/spacegeek_angularjs/writeJson?name=ESA').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
	        default:
	        	$http.get('/spacegeek_angularjs/writeJson?name=NASA').success(function(results){
	            	$scope.feed = results.data;
	            });
	            break;
		}
	};
	this.isSelected = function(checkTab){
		return this.tab === checkTab;
	};
	this.notHome = function(){
		return (this.tab > 0);
	};
}]);

app.provider('facebook', function() {
    var fbReady = false;
    this.appID = 'Default';

    function fbInit(appID) {
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        window.fbAsyncInit = function() {
            FB.init({
                appId : appID,
                xfbml : true,
                version : 'v2.7'
            });
            fbReady = true;
        }
    }

    this.setAppID = function(appID) {
        this.appID = appID;
    };

    this.$get = function($q) {
        var appID = this.appID;
        var self = this;
        fbInit(appID);

        return {
            graph : function(path, cb) {
    			var deferred = $q.defer();
                FB.api(path, function(response) {
                    var result = response;
                    cb(response);
                }, function(response) {
    				if (!response || response.error) {
    					deferred.reject('Error occured');
    				} else {
    					deferred.resolve(response);
    				}
    			});
    			return deferred.promise;
            },
            getAuth : function() {
                return self.auth;
            },
            getLoginStatus : function(cb) {
                if (!fbReady) {
                    setTimeout(function() {
                        self.$get()['getLoginStatus'](cb);
                    }, 100);
                    return;
                }
                FB.getLoginStatus(function(response) {
                    cb(response);
                });
            },
            login : function(cb) {
                if (!fbReady) {
                    setTimeout(function() {
                        self.$get()['login'](cb);
                    }, 100);
                    return;
                }
                FB.login(function(response) {
                    if (response.authResponse) {
                        access_token = FB.getAuthResponse()['accessToken'];
                        FB.api('/me', function(response) {
                        });
                        self.auth = response.authResponse;
                        cb(access_token);
                    } else {
                        console.log('Facebook login failed', response);
                    }
                });

            },
            logout : function() {
                FB.logout(function(response) {
                    if (response) {
                        self.auth = null;
                    } else {
                        console.log('Facebook logout failed.', response);
                    }

                });
            }
        }
    }
});
})();