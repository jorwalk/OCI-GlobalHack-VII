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


	<!-- IF sessions.length -->
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<h4>[[global:sessions]]</h4>
			<ul class="list-group" component="user/sessions">
				<!-- BEGIN sessions -->
				<li class="list-group-item" data-uuid="{../uuid}">
					<div class="pull-right">
						<!-- IF !../current -->
						<button class="btn btn-xs btn-default" type="button" data-action="revokeSession">Revoke Session</button>
						<!-- ENDIF !../current -->
						{function.userAgentIcons}
						<i class="fa fa-circle text-<!-- IF ../current -->success<!-- ELSE -->muted<!-- ENDIF ../current -->"></i>
					</div>
					{../browser} {../version} on {../platform}<br />
					<small class="timeago text-muted" title="{../datetimeISO}"></small>
					<ul>
						<li><strong>[[global:ip_address]]</strong>: {../ip}</li>
					</ul>
				</li>
				<!-- END sessions -->
			</ul>
		</div>
	</div>
	<!-- ENDIF sessions.length -->

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[global:recentips]]</h3>
				</div>
				<div class="panel-body">
					<ul>
						<!-- BEGIN ips -->
						<li>@value</li>
						<!-- END ips -->
					</ul>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[user:info.username-history]]</h3>
				</div>
				<div class="panel-body">
					<ul class="list-group">
						<!-- BEGIN usernames -->
						<li class="list-group-item">
							{../value}
							<small class="pull-right"><span class="timeago" title="{../timestampISO}"></span></small>
						</li>
						<!-- END usernames -->
					</ul>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[user:info.email-history]]</h3>
				</div>
				<div class="panel-body">
					<ul class="list-group">
						<!-- BEGIN emails -->
						<li class="list-group-item">
							{../value}
							<small class="pull-right"><span class="timeago" title="{../timestampISO}"></span></small>
						</li>
						<!-- END emails -->
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[user:info.latest-flags]]</h3>
				</div>
				<div class="panel-body">
					<!-- IF history.flags.length -->
					<ul class="recent-flags">
						<!-- BEGIN history.flags -->
						<li>
							<p>
								<a class="title" href="{config.relative_path}/post/{../pid}">{../title}</a><br />
								<span class="timestamp">Flagged <span class="timeago" title="{../timestampISO}"></span> ({../timestampReadable})</span>
							</p>
						</li>
						<!-- END history.flags -->
					</ul>
					<!-- ELSE -->
					<div class="alert alert-success">[[user:info.no-flags]]</div>
					<!-- ENDIF history.flags.length -->
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						[[user:info.ban-history]]
						<!-- IF !banned -->
						<!-- IF !isSelf -->
						<button class="btn btn-xs pull-right btn-danger" component="account/ban">[[user:ban_account]]</button>
						<!-- ENDIF !isSelf -->
						<!-- ELSE -->
						<!-- IF !isSelf -->
						<button class="btn btn-xs pull-right btn-success" component="account/unban">[[user:unban_account]]</button>
						<!-- ENDIF !isSelf -->
						<!-- ENDIF !banned -->
					</h3>
				</div>
				<div class="panel-body">
					<!-- IF history.bans.length -->
					<ul class="ban-history">
						<!-- BEGIN history.bans -->
						<li>
							<p>
								<span class="timestamp timeago" title="{../timestampISO}"></span> &mdash; {../timestampReadable}<br />
								<!-- IF ../until -->
								<span class="expiry">[[user:info.banned-until, {../untilReadable}]]</span><br />
								<!-- ELSE -->
								<span class="expiry">[[user:info.banned-permanently]]</span><br />
								<!-- ENDIF ../until -->
								<span class="reason"><strong>[[user:info.banned-reason-label]]</strong>: {../reason}</span>
							</p>
						</li>
						<!-- END history.bans -->
					</ul>
					<!-- ELSE -->
					<div class="alert alert-success">[[user:info.no-ban-history]]</div>
					<!-- ENDIF history.bans.length -->
				</div>
			</div>

			<!-- IF isAdminOrGlobalModerator -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[user:info.moderation-note]]</h3>
				</div>
				<div class="panel-body">
					<textarea component="account/moderation-note" class="form-control"></textarea>
					<br/>
					<button class="btn btn-sm pull-right btn-success" component="account/save-moderation-note">[[user:info.moderation-note.add]]</button>
					<br/>
					<div component="account/moderation-note/list">
						<!-- BEGIN moderationNotes -->
						<hr/>

						<div class="clearfix">
							<div class="icon pull-left">
								<a href="<!-- IF moderationNotes.user.userslug -->{config.relative_path}/user/{moderationNotes.user.userslug}<!-- ELSE -->#<!-- ENDIF moderationNotes.user.userslug -->">
									<!-- IF moderationNotes.user.picture -->
									<img class="avatar avatar-sm" component="user/picture" data-uid="{moderationNotes.user.uid}" src="{moderationNotes.user.picture}" align="left" itemprop="image" />
									<!-- ELSE -->
									<div class="avatar avatar-sm" component="user/picture" data-uid="{moderationNotes.user.uid}" style="background-color: {moderationNotes.user.icon:bgColor};">{moderationNotes.user.icon:text}</div>
									<!-- ENDIF moderationNotes.user.picture -->
								</a>
							</div>

							<div class="pull-left">
								<strong>
									<a href="<!-- IF moderationNotes.user.userslug -->{config.relative_path}/user/{moderationNotes.user.userslug}<!-- ELSE -->#<!-- ENDIF moderationNotes.user.userslug -->" itemprop="author" data-username="{moderationNotes.user.username}" data-uid="{moderationNotes.user.uid}">{moderationNotes.user.username}</a>
								</strong>

								<div class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
									<span class="timeago" title="{moderationNotes.timestampISO}"></span>
								</div>
								<br />

								<div class="content">
									{moderationNotes.note}
								</div>
							</div>
						</div>
						<!-- END moderationNotes -->
					</div>
					
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

				</div>
			</div>
			<!-- ENDIF isAdminOrGlobalModerator -->
		</div>
	</div>
</div>