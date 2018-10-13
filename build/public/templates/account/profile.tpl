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


	<div class="row">
		<div class="col-md-5 account-block">

			<div class="account-picture-block panel panel-default">
				<div class="panel-body">
					<div class="text-center">
						<!-- IF picture -->
						<img src="{picture}" class="user-profile-picture" />
						<!-- ELSE -->
						<div class="user-icon user-profile-picture" style="background-color: {icon:bgColor};" title="{username}">{icon:text}</div>
						<!-- ENDIF picture -->
					</div>

					<div>
						<div class="text-center">
							<span>
								<i component="user/status" class="fa fa-circle status {status}" title="[[global:{status}]]"></i>
								<span class="account-username"> {username}</span>
							</span>

							<!-- IF !isSelf -->
							<br/>
							<!-- IF !config.disableChat -->
							<a component="account/chat" href="#" class="btn btn-primary btn-sm">[[user:chat]]</a>
							<!-- ENDIF !config.disableChat -->
 							<a component="account/follow" href="#" class="btn btn-success btn-sm <!-- IF isFollowing -->hide<!-- ENDIF isFollowing -->">[[user:follow]]</a>
 							<a component="account/unfollow" href="#" class="btn btn-warning btn-sm <!-- IF !isFollowing -->hide<!-- ENDIF !isFollowing -->">[[user:unfollow]]</a>

							<!-- IF canBan -->
							<br/><br/>
							<a component="account/ban" href="#" class="btn btn-danger btn-sm <!-- IF banned -->hide<!-- ENDIF banned -->">[[user:ban_account]]</a>
							<a component="account/unban" href="#" class="btn btn-danger btn-sm <!-- IF !banned -->hide<!-- ENDIF !banned -->">[[user:unban_account]]</a>
							<!-- ENDIF canBan -->
							<!-- IF isAdmin -->
							<a component="account/delete" href="#" class="btn btn-danger btn-sm">[[user:delete_account]]</a><br/><br/>
							<!-- ENDIF isAdmin -->
							<!-- ENDIF !isSelf -->

						</div>

						<div id="banLabel" class="text-center <!-- IF !banned -->hide<!-- ENDIF !banned -->">
							<span class="label label-danger">[[user:banned]]</span>
						</div>

						<!-- IF aboutme -->
						<hr/>
						<div component="aboutme" class="text-center">
						{aboutme}
						</div>
						<!-- ENDIF aboutme -->
						<hr/>
						<div class="text-center account-stats">

							<!-- IF !reputation:disabled -->
							<div class="inline-block text-center">
								<span class="human-readable-number" title="{reputation}">{reputation}</span>
								<span class="account-bio-label">[[global:reputation]]</span>
							</div>
							<!-- ENDIF !reputation:disabled -->

							<div class="inline-block text-center">
								<span class="human-readable-number" title="{postcount}">{postcount}</span>
								<span class="account-bio-label">[[global:posts]]</span>
							</div>

							<div class="inline-block text-center">
								<span class="human-readable-number" title="{profileviews}">{profileviews}</span>
								<span class="account-bio-label">[[user:profile_views]]</span>
							</div>
						</div>

					</div>
				</div>
			</div>


			<div class="panel panel-default">
				<div class="panel-body text-center">

					<!-- IF email -->
					<span class="account-bio-label">[[user:email]]</span>
					<span class="account-bio-value"><i class="fa fa-eye-slash {emailClass}" title="[[user:email_hidden]]"></i> {email}</span>
					<!-- ENDIF email -->

					<!-- IF fullname -->
					<span class="account-bio-label">[[user:fullname]]</span>
					<span class="account-bio-value">{fullname}</span>
					<!-- ENDIF fullname -->

					<!-- IF websiteName -->
					<span class="account-bio-label">[[user:website]]</span>
					<span class="account-bio-value"><a href="{websiteLink}" rel="nofollow noopener noreferrer">{websiteName}</a></span>
					<!-- ENDIF websiteName -->

					<!-- IF location -->
					<span class="account-bio-label">[[user:location]]</span>
					<span class="account-bio-value">{location}</span>
					<!-- ENDIF location -->

					<!-- IF age -->
					<span class="account-bio-label">[[user:age]]</span>
					<span class="account-bio-value">{age}</span>
					<!-- ENDIF age -->


					<span class="account-bio-label">[[user:followers]]</span>
					<span class="human-readable-number account-bio-value" title="{followerCount}">{followerCount}</span>

					<span class="account-bio-label">[[user:following]]</span>
					<span class="human-readable-number account-bio-value"  title="{followingCount}">{followingCount}</span>

					<span class="account-bio-label">[[user:joined]]</span>
					<span class="timeago account-bio-value" title="{joindateISO}"></span>

					<span class="account-bio-label">[[user:lastonline]]</span>
					<span class="timeago account-bio-value" title="{lastonlineISO}"></span>

					<!-- IF !disableSignatures -->
					<!-- IF signature -->
					<hr/>
					<span class="account-bio-label">[[user:signature]]</span>
					<div class="post-signature">
						<span id='signature'>{signature}</span>
					</div>
					<!-- ENDIF signature -->
					<!-- ENDIF !disableSignatures -->
				</div>
			</div>

			<!-- IF groups.length -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[groups:groups]]</h3>
				</div>
				<div class="panel-body">
				<!-- BEGIN groups -->
					<a href="{config.relative_path}/groups/{groups.slug}"><span class="label group-label inline-block" style="background-color: {groups.labelColor};"><!-- IF groups.icon --><i class="fa {groups.icon}"></i> <!-- ENDIF groups.icon -->{groups.userTitle}</span></a>
				<!-- END groups -->
				</div>
			</div>
			<!-- ENDIF groups.length -->

		</div>

		<div class="col-md-7">
		<!-- IF !posts.length -->
		<div class="alert alert-warning">[[user:has_no_posts]]</div>
		<!-- ENDIF !posts.length -->
		<ul component="posts" class="posts-list" data-nextstart="{nextStart}">

	<!-- BEGIN posts -->
	<li component="post" class="posts-list-item" data-pid="{posts.pid}" data-uid="{posts.uid}">

		<div class="panel panel-default">
			<div class="panel-body">
				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<!-- IF posts.user.picture -->
					<img title="{posts.user.username}" class="img-rounded user-img" src="{posts.user.picture}">
					<!-- ELSE -->
					<div class="user-icon user-img" style="background-color: {posts.user.icon:bgColor};" title="{posts.user.username}">{posts.user.icon:text}</div>
					<!-- ENDIF posts.user.picture -->
				</a>

				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<strong><span>{posts.user.username}</span></strong>
				</a>
				<div component="post/content" class="content">
					<p>{posts.content}</p>
					<p class="fade-out"></p>
				</div>
				<small>
					<span class="pull-right">
						<a href="{config.relative_path}/category/{posts.category.slug}">[[global:posted_in, {posts.category.name}]] <i class="fa {posts.category.icon}"></i> <span class="timeago" title="{posts.timestampISO}"></span></a> &bull;
						<a href="{config.relative_path}/post/{posts.pid}">[[global:read_more]]</a>
					</span>
				</small>
			</div>
		</div>

	</li>
	<!-- END posts -->
</ul>
<div component="posts/loading" class="loading-indicator text-center hidden">
	<i class="fa fa-refresh fa-spin"></i>
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

	<br/>
	<div id="user-action-alert" class="alert alert-success hide"></div>

</div>
