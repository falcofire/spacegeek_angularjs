<!DOCTYPE html>
<html ng-app="spacegeek">
	<head>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script src="js/spacegeek.js"></script>
		<script>
		</script>
		<title>SpaceGeek</title>
	</head>
	<body background="${pageContext.request.contextPath}/images/space.jpg" style="background-size:100% 100%; background-attachment:fixed;" />
		<div ng-controller="TabController as tab">
			<%@include file="/jsp/meta.jsp" %>
			<%@include file="/jsp/imgModal.jsp"%>
			<br>
			<div id='fb-root'></div>
			<div class="spacegeek-main">
				<div style="text-align:center" ng-hide="tab.notHome()">
					<h2>
						<font color="white">Top Stories</font><br> <br>
					</h2>
					<div class="container-fluid">
						<div class="jumbotron topStories">
							<div ng-controller="FrontpageController as frontCtrl" class="container-fluid" style="display: inline;">
								<div ng-repeat="post in feed.posts.data">
									<div class="feedElement">
										<h2>{{feed.name}}</h2>
										<p>{{post.message}}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel" ng-show="tab.isSelected(1)">
					
				</div>
				<div class="panel" ng-show="tab.isSelected(2)">
				
				</div>
				<div class="panel" ng-show="tab.isSelected(3)">
				
				</div>
				<div class="panel" ng-show="tab.isSelected(4)">
				
				</div>
				<div class="panel" ng-show="tab.isSelected(5)">
				
				</div>
			</div>
		</div>
	</body>
</html>