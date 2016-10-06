<html>
<head>
</head>
<body>
	<nav class="nav navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
				<a class="navbar-brand" href="/spacegeek_angularjs">SpaceGeek</a>
	      	</div>
	      	<div class="navbar-collapse collapse">
	      		<ul class="nav nav-pills">
	      			<li ng-class="{active:tab.isSelected(1)}"><a href ng-click="tab.selectTab(1)">SpaceX</a></li>
	      			<li ng-class="{active:tab.isSelected(2)}"><a href ng-click="tab.selectTab(2)">ISS</a></li>
	      			<li ng-class="{active:tab.isSelected(3)}"><a href ng-click="tab.selectTab(3)">NASA</a></li>
	      			<li ng-class="{active:tab.isSelected(4)}"><a href ng-click="tab.selectTab(4)">JPL</a></li>
	      			<li ng-class="{active:tab.isSelected(5)}"><a href ng-click="tab.selectTab(5)">ESA</a></li>
			   		<li style="float: right;">
			   			<button type="button" class="btn btn-primary" style="margin-top:5px;" ng-click="getFeeds(currentTab)">
			   				<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
			   			</button>
			   		</li>
	      		</ul>
	      	</div>
		</div>
	</nav>
</body>
</html>