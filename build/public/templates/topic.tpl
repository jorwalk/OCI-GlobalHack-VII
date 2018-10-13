<div class="topic">
	<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>
<!-- ENDIF breadcrumbs.length -->


	<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted -->">[[topic:deleted_message]]</div>

	<ul component="topic" id="post-container" class="posts" data-tid="{tid}" data-cid="{cid}">
		<!-- BEGIN posts -->
			<li component="post" class="post-row <!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" data-index="{posts.index}" data-pid="{posts.pid}" data-uid="{posts.uid}" data-timestamp="{posts.timestamp}" data-username="{posts.user.username}" data-userslug="{posts.user.userslug}" itemscope itemtype="http://schema.org/Comment">
				<a component="post/anchor" data-index="{posts.index}" name="{posts.index}"></a>

				<meta itemprop="datePublished" content="{posts.relativeTime}">
				<meta itemprop="dateModified" content="{posts.relativeEditTime}">

				<div class="col-md-1 profile-image-block hidden-xs hidden-sm sub-post">
					<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
						<!-- IF posts.user.picture -->
						<img itemprop="image" component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" align="left" class="img-thumbnail" />
						<!-- ELSE -->
						<div class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
						<!-- ENDIF posts.user.picture -->
						<!-- IF posts.user.banned -->
						<span class="label label-danger">[[user:banned]]</span>
						<!-- ENDIF posts.user.banned -->
					</a>

					<!-- BEGIN posts.user.selectedGroups -->
<!-- IF posts.user.selectedGroups.slug -->
<a href="{config.relative_path}/groups/{posts.user.selectedGroups.slug}"><small class="label group-label inline-block" style="background-color: {posts.user.selectedGroups.labelColor};"><!-- IF posts.user.selectedGroups.icon --><i class="fa {posts.user.selectedGroups.icon}"></i> <!-- ENDIF posts.user.selectedGroups.icon -->{posts.user.selectedGroups.userTitle}</small></a>
<!-- ENDIF posts.user.selectedGroups.slug -->
<!-- END posts.user.selectedGroups -->

				</div>

				<div class="col-md-11 panel panel-default post-block topic-item">

					<a class="main-post avatar" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
						<!-- IF posts.user.picture -->
						<img itemprop="image" component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" align="left" class="img-thumbnail" />
						<!-- ELSE -->
						<div class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
						<!-- ENDIF posts.user.picture -->
					</a>
					<h3 class="main-post">
						<p component="post/header" class="topic-title" itemprop="name"><i class="fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->"></i> <i class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->"></i> <span component="topic/title">{title}</span></p>
					</h3>

					<div class="topic-buttons">

						<div class="btn-group">

							<button class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" type="button" title="<!-- IF posts.user.userslug -->[[topic:posted_by, {posts.user.username}]]<!-- ELSE -->[[topic:posted_by_guest]]<!-- ENDIF posts.user.userslug -->">
								<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>
								<span class="visible-xs-inline">
									<!-- IF posts.user.picture -->
									<img class="" component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" width=18 height=18 />
									<!-- ELSE -->
									<div class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
									<!-- ENDIF posts.user.picture -->
								</span>
								<span href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}&nbsp;</span>
								<span class="caret"></span>
							</button>

						    <ul class="dropdown-menu">
								<li><a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->"><i class="fa fa-user"></i> [[topic:profile]]</a></li>
								<!-- IF !posts.selfPost -->
								<!-- IF posts.user.userslug -->
								<!-- IF loggedIn -->
								<!-- IF !config.disableChat -->
								<li><a href="#" class="chat" component="post/chat"><i class="fa fa-comment"></i> [[topic:chat]]</a></li>
								<!-- ENDIF !config.disableChat -->
								<!-- ENDIF loggedIn -->
								<!-- ENDIF posts.user.userslug -->
								<!-- ENDIF !posts.selfPost -->
						    </ul>
						</div>


						<div class="btn-group">
							<!-- IF !posts.selfPost -->
							<button component="post/flag" class="btn btn-sm btn-default" type="button" title="[[topic:flag_title]]"><i class="fa fa-flag-o"></i></button>
							<!-- ENDIF !posts.selfPost -->
							<button component="post/bookmark" data-bookmarked="{posts.bookmarked}" class="bookmark-tooltip btn btn-sm btn-default <!-- IF posts.bookmarked --> btn-warning <!-- ENDIF posts.bookmarked -->" type="button">
								<span class="bookmark-text">[[topic:bookmark]]</span>
								<span component="post/bookmark-count" class="bookmarkCount" data-bookmarks="{posts.bookmarks}">{posts.bookmarks}</span>&nbsp;

								<i component="post/bookmark/on" class="fa fa-heart <!-- IF !posts.bookmarked -->hidden<!-- ENDIF !posts.bookmarked -->"></i>
								<i component="post/bookmark/off" class="fa fa-heart-o <!-- IF posts.bookmarked -->hidden<!-- ENDIF posts.bookmarked -->"></i>
							</button>
						</div>

						<!-- IF !reputation:disabled -->
						<div class="btn-group">
							<button component="post/upvote" class="upvote btn btn-sm btn-default <!-- IF posts.upvoted --> upvoted btn-primary <!-- ENDIF posts.upvoted -->">
								<i class="fa fa-chevron-up"></i>
							</button>
							<button component="post/vote-count" class="votes btn btn-sm btn-default" data-votes="{posts.votes}">{posts.votes}</button>
							<!-- IF !downvote:disabled -->
							<button component="post/downvote" class="downvote btn btn-sm btn-default <!-- IF posts.downvoted --> downvoted btn-primary <!-- ENDIF posts.downvoted -->">
								<i class="fa fa-chevron-down"></i>
							</button>
							<!-- ENDIF !downvote:disabled -->
						</div>
						<!-- ENDIF !reputation:disabled -->

						<!-- IF privileges.topics:reply -->
						<div class="btn-group">
							<button component="post/quote" class="btn btn-sm btn-default" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i></button>
							<button component="post/reply" class="btn btn-sm btn-primary" type="button">[[topic:reply]] <i class="fa fa-reply"></i></button>
						</div>
						<!-- ENDIF privileges.topics:reply -->

						<div class="pull-right">
	<div component="post/tools" class="dropdown moderator-tools <!-- IF !posts.display_post_menu -->hidden<!-- ENDIF !posts.display_post_menu -->">
		<button title="[[topic:tools]]" class="btn btn-sm btn-default" data-toggle="dropdown" href="#"><i class="fa fa-gear"></i></button>
		<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	</div>
</div>
					</div>

					<div component="post/content" class="post-content" itemprop="text">{posts.content}</div>
					<!-- IF posts.user.signature -->
					<div class="post-signature">{posts.user.signature}</div>
					<!-- ENDIF posts.user.signature -->

					<div class="post-info">
						<span class="pull-right">
							<a class="permalink" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>

							<span component="post/editor" class="<!-- IF !posts.editor.username --> hidden<!-- ENDIF !posts.editor.username -->">| <strong><a href="{config.relative_path}/user/{posts.editor.userslug}">[[global:last_edited_by, {posts.editor.username}]]</a></strong> <span class="timeago" title="{posts.editedISO}"></span></span>
						</span>
						<span class="pull-left">
							[[global:reputation]]: <i class='fa fa-star'></i> <span component="user/reputation" data-reputation="{posts.user.reputation}" data-uid="{posts.uid}" class='formatted-number reputation'>{posts.user.reputation}</span>&nbsp;|&nbsp;[[global:posts]]: <i class='fa fa-pencil'></i> <span class='formatted-number' component="user/postcount" data-uid="{posts.uid}" data-postcount="{posts.user.postcount}">{posts.user.postcount}</span>
							<!-- IF posts.user.custom_profile_info.length -->
								<!-- BEGIN custom_profile_info -->
								| {posts.user.custom_profile_info.content}
								<!-- END custom_profile_info -->
							<!-- ENDIF posts.user.custom_profile_info.length -->
						</span>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div style="clear:both;"></div>
				<!-- IF !posts.index -->
				<div class="post-bar-placeholder"></div>
				<!-- ENDIF !posts.index -->
			</li>
		<!-- END posts -->
	</ul>

	<div class="well col-md-11 col-xs-12 pull-right post-bar">
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
	</div>

	<!-- IF config.usePagination -->
		
<div component="pagination" class="text-center pagination-container<!-- IF !pagination.pages.length --> hidden<!-- ENDIF !pagination.pages.length -->">
	<ul class="pagination">
		<li class="previous pull-left<!-- IF !pagination.prev.active --> disabled<!-- ENDIF !pagination.prev.active -->">
			<a href="?{pagination.prev.qs}" data-page="{pagination.prev.page}"><i class="fa fa-chevron-left"></i> </a>
		</li>

		<!-- BEGIN pagination.pages -->
			<!-- IF pagination.pages.separator -->
			<li component="pagination/select-page" class="page select-page">
				<a href="#"><i class="fa fa-ellipsis-h"></i></a>
			</li>
			<!-- ELSE -->
			<li class="page<!-- IF pagination.pages.active --> active<!-- ELSE --> hidden-xs<!-- ENDIF pagination.pages.active -->" >
				<a href="?{pagination.pages.qs}" data-page="{pagination.pages.page}">{pagination.pages.page}</a>
			</li>
			<!-- ENDIF pagination.pages.separator -->
		<!-- END pagination.pages -->

		<li class="next pull-right<!-- IF !pagination.next.active --> disabled<!-- ENDIF !pagination.next.active -->">
			<a href="?{pagination.next.qs}" data-page="{pagination.next.page}"> <i class="fa fa-chevron-right"></i></a>
		</li>
	</ul>
</div>

	<!-- ENDIF config.usePagination -->

	<div class="visible-xs visible-sm pagination-block text-center">
		<div class="progress-bar"></div>
		<div class="wrapper">
			<i class="fa fa-2x fa-angle-double-up pointer fa-fw pagetop"></i>
			<i class="fa fa-2x fa-angle-up pointer fa-fw pageup"></i>
			<span class="pagination-text"></span>
			<i class="fa fa-2x fa-angle-down pointer fa-fw pagedown"></i>
			<i class="fa fa-2x fa-angle-double-down pointer fa-fw pagebottom"></i>
		</div>
	</div>

</div>

<div widget-area="footer" class="col-xs-12">
	<!-- BEGIN widgets.footer -->
	{{widgets.footer.html}}
	<!-- END widgets.footer -->
</div>

<!-- IF !config.usePagination -->
<noscript>
	
<div component="pagination" class="text-center pagination-container<!-- IF !pagination.pages.length --> hidden<!-- ENDIF !pagination.pages.length -->">
	<ul class="pagination">
		<li class="previous pull-left<!-- IF !pagination.prev.active --> disabled<!-- ENDIF !pagination.prev.active -->">
			<a href="?{pagination.prev.qs}" data-page="{pagination.prev.page}"><i class="fa fa-chevron-left"></i> </a>
		</li>

		<!-- BEGIN pagination.pages -->
			<!-- IF pagination.pages.separator -->
			<li component="pagination/select-page" class="page select-page">
				<a href="#"><i class="fa fa-ellipsis-h"></i></a>
			</li>
			<!-- ELSE -->
			<li class="page<!-- IF pagination.pages.active --> active<!-- ELSE --> hidden-xs<!-- ENDIF pagination.pages.active -->" >
				<a href="?{pagination.pages.qs}" data-page="{pagination.pages.page}">{pagination.pages.page}</a>
			</li>
			<!-- ENDIF pagination.pages.separator -->
		<!-- END pagination.pages -->

		<li class="next pull-right<!-- IF !pagination.next.active --> disabled<!-- ENDIF !pagination.next.active -->">
			<a href="?{pagination.next.qs}" data-page="{pagination.next.page}"> <i class="fa fa-chevron-right"></i></a>
		</li>
	</ul>
</div>

</noscript>
<!-- ENDIF !config.usePagination -->
