(function(){
var app = angular.module('spacegeek', []);

var stories = [];

app.config(function(facebookProvider) {
    facebookProvider.setAppID('282870535397392');
});

app.controller('FrontpageController', ['$scope', 'facebook', function($scope, facebook) {
    facebook.login(function (accessToken) {
        facebook.graph('nasa?fields=id,name,posts', function(results){
            
        }).then(function(response){
        	console.log(response.posts.data);
        	$scope.feed = response.posts.data;
        });
    });
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
                    console.log('fb not ready');
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
                    console.log('fb not ready');
                    return;
                }
                FB.login(function(response) {
                    if (response.authResponse) {
                        access_token = FB.getAuthResponse()['accessToken'];
                        FB.api('/me', function(response) {
                            console.log('Good to see you, ' + response.name
                                    + '.');
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