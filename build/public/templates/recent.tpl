<div class="recent">

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


	<div class="btn-toolbar">
		<div class="pull-left">
			<!-- IF loggedIn -->
			<button component="category/post" id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ELSE -->
			<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
			<!-- ENDIF loggedIn -->
		</div>

		<div component="category/dropdown" class="btn-group pull-right <!-- IF !categories.length -->hidden<!-- ENDIF !categories.length -->">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				<!-- IF selectedCategory --><!-- IF selectedCategory.icon --><span class="fa-stack"><i style="color: {selectedCategory.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {selectedCategory.icon}" style="color: {selectedCategory.color};"></i></span><!-- ENDIF selectedCategory.icon --> {selectedCategory.name}<!-- ELSE -->
				[[unread:all_categories]]<!-- ENDIF selectedCategory --> <span class="caret"></span>
			</button>
			<ul component="category/list" class="dropdown-menu category-dropdown-menu" role="menu">
				<li role="presentation" class="category">
					<a role="menu-item" href="{config.relative_path}/{allCategoriesUrl}"><i class="fa fa-fw <!-- IF !selectedCategory -->fa-check<!-- ENDIF !selectedCategory -->"></i> [[unread:all_categories]]</a>
				</li>
				<!-- BEGIN categories -->
				<li role="presentation" class="category" data-cid="{categories.cid}" data-parent-cid="{categories.parentCid}">
					<a role="menu-item" href="#"><i component="category/select/icon" class="fa fa-fw <!-- IF categories.selected -->fa-check<!-- ENDIF categories.selected -->"></i>{categories.level}<!-- IF categories.icon --><span class="fa-stack"><i style="color: {categories.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {categories.icon}" style="color: {categories.color};"></i></span><!-- ENDIF categories.icon --> {categories.name}</a>
				</li>
				<!-- END categories -->
			</ul>
		</div>

		<div class="btn-group pull-right <!-- IF !filters.length -->hidden<!-- ENDIF !filters.length -->">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			{selectedFilter.name} <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<!-- BEGIN filters -->
				<li role="presentation" class="category">
					<a role="menu-item" href="{config.relative_path}/{filters.url}"><i class="fa fa-fw <!-- IF filters.selected -->fa-check<!-- ENDIF filters.selected -->"></i>{filters.name}</a>
				</li>
				<!-- END filters -->
			</ul>
		</div>
	</div>

	<br/><br/>

	<a href="{config.relative_path}/{selectedFilter.url}">
		<div class="alert alert-warning hide" id="new-topics-alert"></div>
	</a>

	<!-- IF !topics.length -->
	<div class="alert alert-warning" id="category-no-topics">
		<strong>[[recent:no_recent_topics]]</strong>
	</div>
	<!-- ENDIF !topics.length -->

	<div class="category row">
		<div class="col-md-12">
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
	</div>
</div>