<html>
<head>
<link rel='stylesheet' href='css/bootstrap.min.css'>
<link rel='stylesheet' href='css/bootstrap-theme.min.css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/spacegeek.css'>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
<script src="js/spacegeek.js"></script>
</head>
<body>
	<nav class="nav navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/spacegeek_angularjs">SpaceGeek</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
	      	</div>
	      	<div class="collapse navbar-collapse">
	      		<ul class="nav nav-pills">
	      			<li ng-class="{active:tab.isSelected(1)}"><a href ng-click="tab.selectTab(1)">SpaceX</a></li>
	      			<li ng-class="{active:tab.isSelected(2)}"><a href ng-click="tab.selectTab(2)">ISS</a></li>
	      			<li ng-class="{active:tab.isSelected(3)}"><a href ng-click="tab.selectTab(3)">NASA</a></li>
	      			<li ng-class="{active:tab.isSelected(4)}"><a href ng-click="tab.selectTab(4)">JPL</a></li>
	      			<li ng-class="{active:tab.isSelected(5)}"><a href ng-click="tab.selectTab(5)">ESA</a></li>
	      		</ul>
	      	</div>
		</div>
	</nav>
</body>
</html>