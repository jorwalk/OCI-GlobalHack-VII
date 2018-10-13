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
		<div class="col-md-2 col-sm-4">
			<div class="account-picture-block text-center">
				<!-- IF picture -->
				<img id="user-current-picture" class="user-profile-picture" src="{picture}" />
				<!-- ELSE -->
				<div class="user-icon user-profile-picture" style="background-color: {icon:bgColor};">{icon:text}</div>
				<!-- ENDIF picture -->
				<ul class="list-group">
					<!-- IF allowProfilePicture -->
					<a id="changePictureBtn" href="#" class="list-group-item">[[user:change_picture]]</a>
					<!-- ENDIF allowProfilePicture -->
					<!-- IF !username:disableEdit -->
					<a href="{config.relative_path}/user/{userslug}/edit/username" class="list-group-item">[[user:change_username]]</a>
					<!-- ENDIF !username:disableEdit -->
					<!-- IF !email:disableEdit -->
					<a href="{config.relative_path}/user/{userslug}/edit/email" class="list-group-item">[[user:change_email]]</a>
					<!-- ENDIF !email:disableEdit -->
					<!-- IF canChangePassword -->
					<a href="{config.relative_path}/user/{userslug}/edit/password" class="list-group-item">[[user:change_password]]</a>
					<!-- ENDIF canChangePassword -->
					<!-- BEGIN editButtons -->
					<a href="{config.relative_path}{editButtons.link}" class="list-group-item">{editButtons.text}</a>
					<!-- END editButtons -->
				</ul>

				<!-- IF config.requireEmailConfirmation -->
				<!-- IF email -->
				<!-- IF isSelf -->
				<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF email -->
				<!-- ENDIF config.requireEmailConfirmation -->

				<!-- IF allowAccountDelete -->
				<!-- IF isSelf -->
				<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF allowAccountDelete -->

			</div>
		</div>

		<div class="col-md-5 col-sm-4">
			<div>
				<form class='form-horizontal'>

					<div class="control-group">
						<label class="control-label" for="inputFullname">[[user:fullname]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputFullname" placeholder="[[user:fullname]]" value="{fullname}">
						</div>
					</div>
					<!-- IF allowWebsite -->
					<div class="control-group">
						<label class="control-label" for="inputWebsite">[[user:website]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputWebsite" placeholder="http://..." value="{website}">
						</div>
					</div>
					<!-- ENDIF allowWebsite -->

					<div class="control-group">
						<label class="control-label" for="inputLocation">[[user:location]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputLocation" placeholder="[[user:location]]" value="{location}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputBirthday">[[user:birthday]]</label>
						<div class="controls">
							<input class="form-control" id="inputBirthday" value="{birthday}" placeholder="yyyy-mm-dd">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="grouptitle">[[user:grouptitle]]</label>
						<div class="controls">
							<select class="form-control" id="groupTitle" data-property="groupTitle" <!-- IF allowMultipleBadges --> multiple<!-- ENDIF allowMultipleBadges -->>
								<option value="">[[user:no-group-title]]</option>
								<!-- BEGIN groups -->
								<!-- IF groups.userTitleEnabled -->
								<option value="{groups.name}" <!-- IF groups.selected -->selected<!-- ENDIF groups.selected -->>{groups.userTitle}</option>
								<!-- ENDIF groups.userTitleEnabled -->
								<!-- END groups -->
							</select>
						</div>
					</div>
					<!-- IF allowAboutMe -->
					<div class="control-group">
						<label class="control-label" for="inputAboutMe">[[user:aboutme]]</label> <small><label id="aboutMeCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputAboutMe" rows="5">{aboutme}</textarea>
						</div>
					</div>
					<!-- ENDIF allowAboutMe -->

					<!-- IF allowSignature -->
					<!-- IF !disableSignatures -->
					<div class="control-group">
						<label class="control-label" for="inputSignature">[[user:signature]]</label> <small><label id="signatureCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputSignature" rows="5">{signature}</textarea>
						</div>
					</div>
					<!-- ENDIF !disableSignatures -->
					<!-- ENDIF allowSignature -->

					<input type="hidden" id="inputUID" value="{uid}"><br />

					<div class="form-actions">
						<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
					</div>

				</form>
			</div>

			<hr class="visible-xs visible-sm"/>
		</div>

		<div class="col-md-5 col-sm-4">
			<!-- IF sso.length -->
			<label class="control-label">[[user:sso.title]]</label>
			<div class="list-group">
				<!-- BEGIN sso -->
				<div class="list-group-item">
					<!-- IF ../deauthUrl -->
					<a class="btn btn-default btn-xs pull-right" href="{../deauthUrl}">[[user:sso.dissociate]]</a>
					<!-- END -->
					<a href="{../url}" target="<!-- IF ../associated -->_blank<!-- ELSE -->_top<!-- ENDIF ../associated -->">
						<!-- IF ../icon --><i class="fa {../icon}"></i><!-- ENDIF ../icon -->
						<!-- IF ../associated -->[[user:sso.associated]]<!-- ELSE -->[[user:sso.not-associated]]<!-- ENDIF ../associated -->
						{../name}
					</a>
				</div>
				<!-- END sso -->
			</div>
			<!-- ENDIF sso.length -->
		</div>
	</div>
</div>

