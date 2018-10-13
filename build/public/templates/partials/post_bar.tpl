<div class="inline-block">

	<span class="tags">
	<!-- BEGIN tags -->
	<a href="{config.relative_path}/tags/{tags.value}"><span class="tag-item" data-tag="{tags.value}" style="<!-- IF tags.color -->color: {tags.color};<!-- ENDIF tags.color --><!-- IF tags.bgColor -->background-color: {tags.bgColor};<!-- ENDIF tags.bgColor -->">{tags.valueEscaped}</span><span class="tag-topic-count">{tags.score}</span></a>
	<!-- END tags -->
	</span>

	<!-- IF tags.length -->
	<span>&bull;</span>
	<!-- ENDIF tags.length -->

	<small class="topic-stats">
		<span>[[global:posts]]</span>
		<strong><span component="topic/post-count" class="human-readable-number" title="{postcount}">{postcount}</span></strong> &bull;
		<span>[[global:views]]</span>
		<strong><span class="human-readable-number" title="{viewcount}">{viewcount}</span></strong>
	</small>
	<span class="browsing-users hidden">
		&bull;
		<small><span>[[category:browsing]]</span></small>
		<div component="topic/browsing/list" class="thread_active_users active-users inline-block"></div>
		<small class="hidden">
			<i class="fa fa-users"></i> <span component="topic/browsing/count" class="user-count"></span>
		</small>
	</span>
</div>

<div class="topic-main-buttons pull-right inline-block">
	<div class="loading-indicator" done="0" style="display:none;">
		<span class="hidden-xs">[[topic:loading_more_posts]]</span> <i class="fa fa-refresh fa-spin"></i>
	</div>

	<div component="topic/reply/container" class="btn-group action-bar <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">
	<button class="btn btn-primary" component="topic/reply">[[topic:reply]]</button>
	<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu pull-right" role="menu">
		<li><a href="#" component="topic/reply-as-topic">[[topic:reply-as-topic]]</a></li>
	</ul>
</div>

<!-- IF loggedIn -->

<!-- IF !privileges.topics:reply -->
<!-- IF locked -->
<a component="topic/reply/locked" class="btn btn-primary" disabled><i class="fa fa-lock"></i> [[topic:locked]]</a>
<!-- ENDIF locked -->
<!-- ENDIF !privileges.topics:reply -->

<!-- IF !locked -->
<a component="topic/reply/locked" class="btn btn-primary hidden" disabled><i class="fa fa-lock"></i> [[topic:locked]]</a>
<!-- ENDIF !locked -->

<!-- ELSE -->

<!-- IF !privileges.topics:reply -->
<a component="topic/reply/guest" href="{config.relative_path}/login" class="btn btn-primary">[[topic:guest-login-reply]]</a>
<!-- ENDIF !privileges.topics:reply -->

<!-- ENDIF loggedIn -->




	<!-- IF loggedIn -->
		<button component="topic/mark-unread" class="btn btn-default">
			<i class="fa fa-envelope"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline"> [[topic:mark_unread]]</span>
		</button>
	<!-- ENDIF loggedIn -->

	<!-- IF config.loggedIn -->
<div class="btn-group topic-watch-dropdown" component="topic/watch">
	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
		<span component="topic/following/menu" <!-- IF !isFollowing -->class="hidden"<!-- ENDIF !isFollowing -->><i class="fa fa-fw fa-bell-o"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:watching]]</span></span>

		<span component="topic/not-following/menu" <!-- IF !isNotFollowing -->class="hidden"<!-- ENDIF !isNotFollowing -->><i class="fa fa-fw fa-bell-slash-o"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:not-watching]]</span></span>

		<span component="topic/ignoring/menu" <!-- IF !isIgnoring -->class="hidden"<!-- ENDIF !isIgnoring -->><i class="fa fa-fw fa-eye-slash"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:ignoring]]</span></span>

		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu dropdown-menu-right">
		<li><a href="#" component="topic/following"><i component="topic/following/check" class="fa fa-fw <!-- IF isFollowing -->fa-check<!-- ENDIF isFollowing -->"></i><i class="fa fa-fw fa-bell-o"></i> [[topic:watching]]<p class="help-text"><small>[[topic:watching.description]]</small></p></a></li>
		<li><a href="#" component="topic/not-following"><i component="topic/not-following/check" class="fa fa-fw <!-- IF isNotFollowing -->fa-check<!-- ENDIF isNotFollowing -->"></i><i class="fa fa-fw fa-bell-slash-o"></i> [[topic:not-watching]]<p class="help-text"><small>[[topic:not-watching.description]]</small></p></a></li>
		<li><a href="#" component="topic/ignoring"><i component="topic/ignoring/check" class="fa fa-fw <!-- IF isIgnoring -->fa-check<!-- ENDIF isIgnoring -->"></i><i class="fa fa-fw fa-eye-slash"></i> [[topic:ignoring]]<p class="help-text"><small>[[topic:ignoring.description]]</small></p></a></li>
	</ul>
</div>
<!-- ENDIF config.loggedIn -->

	<!-- IF loggedIn -->
<div class="btn-group dropup" component="thread/sort">
	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button"><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:sort_by]]</span>
	<span class="visible-xs-inline"><i class="fa fa-fw fa-sort"></i></span> <span class="caret"></span></button>

	<ul class="dropdown-menu pull-right">
		<li><a href="#" class="oldest_to_newest" data-sort="oldest_to_newest"><i class="fa fa-fw"></i> [[topic:oldest_to_newest]]</a></li>
		<li><a href="#" class="newest_to_oldest" data-sort="newest_to_oldest"><i class="fa fa-fw"></i> [[topic:newest_to_oldest]]</a></li>
		<li><a href="#" class="most_votes" data-sort="most_votes"><i class="fa fa-fw"></i> [[topic:most_votes]]</a></li>
	</ul>
</div>
<!-- ENDIF loggedIn -->

	<!-- IF privileges.view_thread_tools -->
<div class="btn-group thread-tools dropup">
	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
		<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:thread_tools.title]]</span>
		<span class="visible-xs-inline"><i class="fa fa-fw fa-gear"></i></span>
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu pull-right"></ul>
</div>
<!-- ENDIF privileges.view_thread_tools -->
</div>
<div style="clear:both;"></div>