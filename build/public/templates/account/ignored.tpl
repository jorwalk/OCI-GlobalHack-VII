<div class="account">
	
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


<div class="cover" component="account/cover" style="background-image: url({cover:url}); background-position: {cover:position};">
	<!-- IF allowCoverPicture -->
	<div class="controls">
		<span class="upload"><i class="fa fa-fw fa-4x fa-upload"></i></span>
		<span class="resize"><i class="fa fa-fw fa-4x fa-arrows-alt"></i></span>
		<span class="remove"><i class="fa fa-fw fa-4x fa-times"></i></span>
	</div>
	<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
	<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
	<!-- ENDIF allowCoverPicture -->
</div>

<div class="account-username-box" data-userslug="{userslug}" data-uid="{uid}">
	<ul class="nav nav-pills account-sub-links">
		<li>
			<a href="#" type="button" class="dropdown-toggle inline-block" data-toggle="dropdown">
				[[user:more]]
				<span class="caret"></span>
				<span class="sr-only">Toggle Dropdown</span>
			</a>
			<ul class="dropdown-menu pull-right" role="menu">
				<!-- IF !isSelf -->
				<li>
					<a component="account/flag" href="#">[[user:flag-profile]]</a>
				</li>
				<li>
					<a component="account/block" href="#"><!-- IF !../isBlocked -->[[user:block_user]]<!-- ELSE -->[[user:unblock_user]]<!-- END --></a>
				</li>
				<!-- ENDIF !isSelf -->
				<li><a href="{config.relative_path}/user/{userslug}/following"><i class="fa fa-fw fa-users"></i> [[user:following]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/followers"><i class="fa fa-fw fa-users"></i> [[user:followers]]</a></li>
				<!-- IF showHidden -->
				<li><a href="{config.relative_path}/user/{userslug}/blocks"><i class="fa fa-fw fa-ban"></i> [[user:blocks]]</a></li>
				<!-- ENDIF showHidden -->
				<li class="divider"></li>
				<li><a href="{config.relative_path}/user/{userslug}/topics"><i class="fa fa-fw fa-book"></i> [[global:topics]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/posts"><i class="fa fa-fw fa-pencil"></i> [[global:posts]]</a></li>
				<!-- IF !reputation:disabled -->
				<li><a href="{config.relative_path}/user/{userslug}/best"><i class="fa fa-fw fa-star"></i> [[global:best]]</a></li>
				<!-- ENDIF !reputation:disabled -->
				<li><a href="{config.relative_path}/user/{userslug}/groups"><i class="fa fa-fw fa-users"></i> [[global:header.groups]]</a></li>
				<!-- IF showHidden -->
				<li><a href="{config.relative_path}/user/{userslug}/bookmarks"><i class="fa fa-fw fa-heart"></i> [[user:bookmarks]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/watched"><i class="fa fa-fw fa-eye"></i> [[user:watched]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/ignored"><i class="fa fa-fw fa-eye"></i> [[user:ignored]]</a></li>

				<!-- IF !reputation:disabled -->
				<li><a href="{config.relative_path}/user/{userslug}/upvoted"><i class="fa fa-fw fa-chevron-up"></i> [[global:upvoted]]</a></li>
				<!-- IF !downvote:disabled -->
				<li><a href="{config.relative_path}/user/{userslug}/downvoted"><i class="fa fa-fw fa-chevron-down"></i> [[global:downvoted]]</a></li>
				<!-- ENDIF !downvote:disabled -->
				<!-- ENDIF !reputation:disabled -->

				<!-- ENDIF showHidden -->
				<!-- BEGIN profile_links -->
				<!-- IF @first -->
				<li class="divider"></li>
				<!-- ENDIF @first -->
				<li id="{profile_links.id}" class="plugin-link <!-- IF profile_links.public -->public<!-- ELSE -->private<!-- ENDIF profile_links.public -->"><a href="{config.relative_path}/user/{userslug}/{profile_links.route}"><!-- IF ../icon --><i class="fa fa-fw {profile_links.icon}"></i> <!-- END -->{profile_links.name}</a></li>
				<!-- END profile_links -->
			</ul>
		</li>
		<li>
			<a href="{config.relative_path}/user/{userslug}" class="inline-block" id="profile"><i class="fa fa-user"></i> [[user:profile]]</a>
		</li>
		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/edit"><i class="fa fa-pencil-square-o"></i> [[user:edit]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/settings"><i class="fa fa-gear"></i> [[user:settings]]</a></li>
		<!-- ENDIF showHidden -->
	</ul>
</div>


	<!-- IF !topics.length -->
		<div class="alert alert-warning">{noItemsFoundKey}</div>
	<!-- ENDIF !topics.length -->

	<div class="category">
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
</div>
