<!DOCTYPE html>
<html ng-app="spacegeek">
	<head>
		<title>SpaceGeek</title>
		<link rel='stylesheet' href='css/bootstrap.min.css'>
		<link rel='stylesheet' href='css/bootstrap-theme.min.css'>
		<link rel='stylesheet' href='${pageContext.request.contextPath}/css/spacegeek.css'>
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/spacegeek.js"></script>
		<script>
		</script>
	</head>
	<body background="${pageContext.request.contextPath}/images/space.jpg" style="background-size:100% 100%; background-attachment:fixed;" />
		<div ng-controller="TabController as tab">
			<%@include file="/jsp/meta.jsp" %>
			<%@include file="/jsp/imgModal.jsp"%>
			<%@include file="/jsp/vidModal.jsp" %>
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
								<div class="row">
									<div ng-repeat="post in feed.posts.data">
										<div class="clearfix" ng-if="$index % 3 == 0"></div>
										<div class="col-md-4 col-md-offset-0">
											<div class="container-fluid">
												<div class="feedElement container">
													<span class="text-left">
														Likes: <a href="{{post.permalink_url" target="_blank">{{post.likes.summary.total_count}}</a>
														<br/>Shares: {{post.shares.count}}
													</span>
													<p>{{post.message}}</p>
													<img src={{post.full_picture}} class="img-responsive">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="spacegeek-main" ng-hide="!tab.notHome()">
					<div style="text-align:center">
						<div class="container">
							<img src="${pageContext.request.contextPath}/images/{{feed.name}}.png" class="img-responsive pull-right" style="max-width: 40%;" />
						</div>
						<div class="container-fluid">
							<div class="jumbotron">
								<div ng-controller="FrontpageController as frontCtrl" class="container-fluid" style="display: inline;">
									<div class="row">
										<div ng-repeat="post in feed.posts.data">
											<div class="clearfix" ng-if="$index % 3 == 0"></div>
											<div class="col-md-4 col-md-offset-0">
												<div class="container-fluid">
													<div class="feedElement container">
														<span class="pull-left">
															Likes: {{post.likes.summary.total_count}}
															<br/>Shares: {{post.shares.count}}
														</span>
														<span class="pull-right">
															<div ng-bind="post.created_time | date:'MM/dd/yyyy'"></div>
															<b><a href="{{post.permalink_url}}" target="_blank"><div ng-bind="post.created_time | date:'h:mm a'"></div></a></b>
														</span>
														<br/><br/>
														<blockquote>
															<p class="text-left" style="word-wrap: break-word;">{{post.message}}</p>
														</blockquote>
														<div id="photoId" ng-show="post.full_picture">
															<img id="photoId" src={{post.full_picture}} class="img-responsive" ng-click="imgClick(post.full_picture,post.permalink_url,post.source)"/>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>