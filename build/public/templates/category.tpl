
<div class="category row">
	<div class="<!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">

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


		<div class="subcategories row">
			<!-- BEGIN children -->
					<div class="{children.class}" data-cid="{children.cid}" data-numRecentReplies="{children.numRecentReplies}">
			<meta itemprop="name" content="{children.name}">
			<h4 class="category-title">
				<!-- IF !children.link -->
				<span class="badge {children.unread-class}">{children.totalTopicCount} </span>
				<!-- ENDIF !children.link -->

				<!-- IF children.link -->
				<a href="{children.link}" itemprop="url">
				<!-- ELSE -->
				<a href="{config.relative_path}/category/{children.slug}" itemprop="url">
				<!-- ENDIF children.link -->
				{children.name}
				</a>
			</h4>

			<!-- IF children.link -->
			<a style="color: {children.color};" href="{children.link}" itemprop="url">
			<!-- ELSE -->
			<a style="color: {children.color};" href="{config.relative_path}/category/{children.slug}" itemprop="url">
			<!-- ENDIF children.link -->
				<div
					id="category-{children.cid}" class="category-header category-header-image-{children.imageClass}"
					title="{children.description}"
					style="
						<!-- IF children.backgroundImage -->background-image: url({children.backgroundImage});<!-- ENDIF children.backgroundImage -->
						<!-- IF children.bgColor -->background-color: {children.bgColor};<!-- ENDIF children.bgColor -->
					"
				>
					<div id="category-{children.cid}" class="category-slider-{children.numRecentReplies}">
						<!-- IF children.icon -->
						<div class="category-box"><i class="fa {children.icon} fa-4x"></i></div>
						<!-- ENDIF children.icon -->
						<div class="category-box" itemprop="description">{children.description}</div>

						<!-- BEGIN posts -->
						<div class="category-box">
							<div class="post-preview">
								<img src="{children.posts.user.picture}" class="pull-left" />
								<p class=""><strong>{children.posts.user.username}</strong>: {children.posts.content}</p>
							</div>
						</div>
						<!-- END posts -->
						<!-- IF children.icon -->
						<div class="category-box"><i class="fa {children.icon} fa-4x"></i></div>
						<!-- ENDIF children.icon -->
					</div>
				</div>
			</a>
		</div>
			<!-- END children -->
		</div>

		<div class="header category-tools clearfix">
			<!-- IF privileges.topics:create -->
			<button component="category/post" id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ELSE -->
				<!-- IF !loggedIn -->
				<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
				<!-- ENDIF !loggedIn -->
			<!-- ENDIF privileges.topics:create -->

			<span class="pull-right" component="category/controls">
				<!-- IF config.loggedIn -->
<div class="btn-group topic-watch-dropdown" component="topic/watch">

	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">

		<span component="category/watching/menu" <!-- IF isIgnored -->class="hidden"<!-- ENDIF isIgnored -->><i class="fa fa-fw fa-eye"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[category:watching]]</span></span>

		<span component="category/ignoring/menu" <!-- IF !isIgnored -->class="hidden"<!-- ENDIF !isIgnored -->><i class="fa fa-fw fa-eye-slash"></i><span class="visible-sm-inline visible-md-inline visible-lg-inline">[[category:ignoring]]</span></span>

		<span class="caret"></span>
	</button>

	<ul class="dropdown-menu dropdown-menu-right">
		<li><a href="#" component="category/watching"><i component="category/watching/check" class="fa fa-fw <!-- IF !isIgnored -->fa-check<!-- ENDIF !isIgnored -->"></i><i class="fa fa-fw fa-eye"></i> [[category:watching]]<p class="help-text"><small>[[category:watching.description]]</small></p></a></li>
		<li><a href="#" component="category/ignoring"><i component="category/ignoring/check" class="fa fa-fw <!-- IF isIgnored -->fa-check<!-- ENDIF isIgnored -->"></i><i class="fa fa-fw fa-eye-slash"></i> [[category:ignoring]]<p class="help-text"><small>[[category:ignoring.description]]</small></p></a></li>
	</ul>
</div>
<!-- ENDIF config.loggedIn -->

				<!-- IF loggedIn -->
<div class="btn-group" component="thread/sort">
	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
		<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:sort_by]]</span>
		<span class="visible-xs-inline"><i class="fa fa-fw fa-sort"></i></span>
		<span class="caret"></span>
	</button>

	<ul class="dropdown-menu pull-right">
		<li><a href="#" class="newest_to_oldest" data-sort="newest_to_oldest"><i class="fa fa-fw"></i> [[topic:newest_to_oldest]]</a></li>
		<li><a href="#" class="oldest_to_newest" data-sort="oldest_to_newest"><i class="fa fa-fw"></i> [[topic:oldest_to_newest]]</a></li>
		<li><a href="#" class="most_posts" data-sort="most_posts"><i class="fa fa-fw"></i> [[topic:most_posts]]</a></li>
		<li><a href="#" class="most_votes" data-sort="most_votes"><i class="fa fa-fw"></i> [[topic:most_votes]]</a></li>
	</ul>
</div>
<!-- ENDIF loggedIn -->

				<!-- IF privileges.editable -->
<div class="btn-group thread-tools">
	<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
		<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:thread_tools.title]]</span>
		<span class="visible-xs-inline"><i class="fa fa-fw fa-gear"></i></span>
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu pull-right">
		<li>
			<a component="topic/mark-unread-for-all" href="#">
				<i class="fa fa-fw fa-inbox"></i> [[topic:thread_tools.markAsUnreadForAll]]
			</a>
		</li>
		<li>
			<a component="topic/pin" href="#">
				<i class="fa fa-fw fa-thumb-tack"></i> [[topic:thread_tools.pin]]
			</a>
		</li>
		<li>
			<a component="topic/unpin" href="#" class="hidden">
				<i class="fa fa-fw fa-thumb-tack fa-rotate-90"></i> [[topic:thread_tools.unpin]]
			</a>
		</li>

		<li>
			<a component="topic/lock" href="#">
				<i class="fa fa-fw fa-lock"></i> [[topic:thread_tools.lock]]
			</a>
		</li>
		<li>
			<a component="topic/unlock" href="#" class="hidden">
				<i class="fa fa-fw fa-unlock"></i> [[topic:thread_tools.unlock]]
			</a>
		</li>

		<li class="divider"></li>

		<li>
			<a component="topic/move" href="#">
				<i class="fa fa-fw fa-arrows"></i> [[topic:thread_tools.move]]
			</a>
		</li>
		<li>
			<a component="topic/move-all" href="#">
				<i class="fa fa-fw fa-arrows"></i> [[topic:thread_tools.move_all]]
			</a>
		</li>
		<li>
			<a component="topic/merge" href="#">
				<i class="fa fa-fw fa-code-fork"></i> [[topic:thread_tools.merge]]
			</a>
		</li>

		<li class="divider"></li>

		<li>
			<a component="topic/delete" href="#">
				<i class="fa fa-fw fa-trash-o"></i> [[topic:thread_tools.delete]]
			</a>
		</li>
		<li>
			<a component="topic/restore" href="#" class="hidden">
				<i class="fa fa-fw fa-history"></i> [[topic:thread_tools.restore]]
			</a>
		</li>
		<li>
			<a component="topic/purge" href="#" class="hidden">
				<i class="fa fa-fw fa-eraser"></i> [[topic:thread_tools.purge]]
			</a>
		</li>

		<!-- BEGIN thread_tools -->
		<li>
			<a href="#" class="{thread_tools.class}"><i class="fa fa-fw {thread_tools.icon}"></i> {thread_tools.title}</a>
		</li>
		<!-- END thread_tools -->
	</ul>
</div>
<!-- ENDIF privileges.editable -->

			</span>
		</div>

		<!-- IF !topics.length -->
		<!-- IF privileges.topics:create -->
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		<!-- ENDIF privileges.topics:create -->
		<!-- ENDIF !topics.length -->

		<a href="{url}">
			<div class="alert alert-warning hide" id="new-topics-alert"></div>
		</a>

				<ul component="category" id="topics-container" data-nextstart="{nextStart}">
			<!-- BEGIN topics -->
			<li component="category/topic" class="category-item {function.generateTopicClass}" data-tid="{topics.tid}" data-index="{topics.index}" data-cid="{topics.cid}" itemprop="itemListElement">
				<div class="panel panel-default topic-row">

					<!-- IF showSelect -->
					<i class="fa fa-fw fa-square-o pull-left select pointer" component="topic/select"></i>
					<!-- ENDIF showSelect -->

					<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
						<!-- IF topics.thumb -->
						<img src="{topics.thumb}" class="user-img" title="{topics.user.username}" />
						<!-- ELSE -->
						<!-- IF topics.user.picture -->
						<img component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" class="user-img" title="{topics.user.username}" />
						<!-- ELSE -->
						<div class="user-icon" style="background-color: {topics.user.icon:bgColor};" title="{topics.user.username}">{topics.user.icon:text}</div>
						<!-- ENDIF topics.user.picture -->
						<!-- ENDIF topics.thumb -->
					</a>

					<h3>
						<strong>
							<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->"></i>
							<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->"></i>
						</strong>
						<!-- IF !topics.noAnchor -->
						<a href="{config.relative_path}/topic/{topics.slug}">
							<span class="topic-title">{topics.title}</span>
						</a>
						<!-- ELSE -->
						<span class="topic-title">{topics.title}</span>
						<!-- ENDIF !topics.noAnchor -->
					</h3>

					<small>
						<span class="topic-stats stats-votes">
							[[global:votes]]
							<strong class="human-readable-number" title="{topics.votes}">{topics.votes}</strong>
						</span>
						&bull;
						<span class="topic-stats stats-postcount">
							[[global:posts]]
							<strong class="human-readable-number" title="{topics.postcount}">{topics.postcount}</strong>
						</span>
						&bull;
						<span class="topic-stats stats-viewcount">
							[[global:views]]
							<strong class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</strong>
						</span>
						<!-- IF !template.category -->
						&bull;
						<span>
							<a href="{config.relative_path}/category/{topics.category.slug}"><i class="fa {topics.category.icon}"></i> {topics.category.name}</a>
						</span>
						&bull;
						<span>
							<!-- IF topics.user.uid -->
							<a href="{config.relative_path}/user/{topics.user.userslug}">{topics.user.username}</a>
							<!-- ELSE -->
							[[global:guest]]
							<!-- ENDIF topics.user.uid -->
						</span>
						&bull;
						<span class="timeago" title="{topics.timestampISO}"></span>
						<!-- ENDIF !template.category -->

						<span class="pull-right" component="topic/teaser">
							<!-- IF topics.unreplied -->
							<a href="{config.relative_path}/topic/{topics.slug}" itemprop="url">[[category:no_replies]]</a>
							<!-- ELSE -->
							<!-- IF topics.teaser.pid -->
							<a href="<!-- IF topics.teaser.user.userslug -->{config.relative_path}/user/{topics.teaser.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.teaser.user.userslug -->">
								<!-- IF topics.teaser.user.picture -->
								<img class="teaser-pic" src="{topics.teaser.user.picture}" title="{topics.teaser.user.username}"/>
								<!-- ELSE -->
								<div class="teaser-pic user-icon" style="background-color: {topics.teaser.user.icon:bgColor};" title="{topics.teaser.user.username}">{topics.teaser.user.icon:text}</div>
								<!-- ENDIF topics.teaser.user.picture -->
							</a>
							<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
								<span class="timeago" title="{topics.teaser.timestampISO}"></span>
							</a>
							<!-- ENDIF topics.teaser.pid -->
							<!-- ENDIF topics.unreplied -->
						</span>
						<!-- IF topics.tags.length -->
	<!-- BEGIN tags -->
		<a href="{config.relative_path}/tags/{topics.tags.value}"><span class="tag-item" data-tag="{topics.tags.value}" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.valueEscaped}</span><span class="tag-topic-count">{topics.tags.score}</span></a>
	<!-- END tags -->
<!-- ENDIF topics.tags.length -->
					</small>
				</div>
			</li>
			<!-- END topics -->
		</ul>


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
	</div>

	<!-- IF topics.length -->
	<div widget-area="sidebar" class="col-md-3 col-xs-12 category-sidebar <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		<!-- BEGIN widgets.sidebar -->
		{{widgets.sidebar.html}}
		<!-- END widgets.sidebar -->
	</div>
	<!-- ENDIF topics.length -->
</div>

<div id="move_thread_modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="Move Topic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>[[topic:move_topic]]</h3>
			</div>
			<div class="modal-body">
				<div component="category-selector" class="btn-group <!-- IF pullRight -->pull-right<!-- ENDIF pullRight -->">
	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		<span component="category-selector-selected">[[topic:thread_tools.select_category]]</span> <span class="caret"></span>
	</button>
	<ul class="dropdown-menu category-dropdown-menu" role="menu">
		<!-- BEGIN categories -->
		<li role="presentation" class="category <!-- IF categories.disabledClass -->disabled<!-- ENDIF categories.disabledClass -->" data-cid="{categories.cid}" data-name="{categories.name}">
			<a role="menu-item">{categories.level}<span component="category-markup"><!-- IF categories.icon --><span class="fa-stack"><i style="color: {categories.bgColor};" class="fa fa-circle fa-stack-2x"></i><i style="color: {categories.color};" class="fa fa-stack-1x fa-fw {categories.icon}"></i></span><!-- ENDIF categories.icon --> {categories.name}</span></a>
		</li>
		<!-- END categories -->
	</ul>
</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="move_thread_cancel">[[global:buttons.close]]</button>
				<button type="button" class="btn btn-primary" id="move_thread_commit" disabled>[[topic:confirm_move]]</button>
			</div>
		</div>
	</div>
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
