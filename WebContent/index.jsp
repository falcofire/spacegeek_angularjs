<!DOCTYPE html>
<html ng-app="spacegeek">
	<head>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script src="js/spacegeek.js"></script>
		<script>
			$(document).ready(function(){
				$('.img-responsive').on('click', function(e) {
					alert('Clicked an image.');
				    $("#modal-img").attr("src", this.src);
				    $("#img-link").attr("href", this.src);
				    $('#imgModal').modal('show');
				});
			});
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
								<div class="row">
									<div ng-repeat="post in feed.posts.data">
										<div class="clearfix" ng-if="$index % 3 == 0"></div>
										<div class="col-md-4 col-md-offset-0">
											<div class="container-fluid">
												<div class="feedElement container">
													Likes: {{post.likes.summary.total_count}}
													<br/>Shares: {{post.shares.count}}
													<p>{{post.message}}</p>
													<img src={{post.full_picture}} class="img-responsive"/>
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
						<h2>
							<font color="white">{{feed.name}} Stories</font><br> <br>
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
														Likes: {{post.likes.summary.total_count}}
														<br/>Shares: {{post.shares.count}}
														<p>{{post.message}}</p>
														<img src={{post.full_picture}} class="img-responsive"/>
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