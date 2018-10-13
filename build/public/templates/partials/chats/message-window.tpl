<!-- IF roomId -->
<div component="chat/messages" class="expanded-chat" data-roomid="{roomId}">
	<div component="chat/header">
		<button type="button" class="close" data-action="pop-out"><span aria-hidden="true"><i class="fa fa-compress"></i></span><span class="sr-only">[[modules:chat.pop-out]]</span></button>
		
		<div class="dropdown pull-right">
			<button class="close" data-toggle="dropdown" component="chat/controlsToggle"><i class="fa fa-gear"></i></button>
			<ul class="dropdown-menu dropdown-menu-right pull-right" component="chat/controls">
				<!-- IF users.length -->
				<li class="dropdown-header">[[modules:chat.in-room]]</li>
				<!-- BEGIN users -->
				<li>
					<a href="{config.relative_path}/uid/{../uid}">
						<!-- IF ../picture -->
						<img class="avatar avatar-sm" component="user/picture" src="{../picture}" itemprop="image" />
						<!-- ELSE -->
						<div class="avatar avatar-sm" component="user/picture" style="background-color: {../icon:bgColor};">{../icon:text}</div><!-- END -->{../username}
					</a>
				</li>
				<!-- END -->
				<li role="separator" class="divider"></li>
				<!-- END -->
				<li class="dropdown-header">[[modules:chat.options]]</li>
				<li>
					<a href="#" data-action="members"><i class="fa fa-fw fa-cog"></i> [[modules:chat.manage-room]]</a>
				</li>
				<li>
					<a href="#" data-action="rename"><i class="fa fa-fw fa-edit"></i> [[modules:chat.rename-room]]</a>
				</li>
				<li>
					<a href="#" data-action="leave"><i class="fa fa-fw fa-sign-out"></i> [[modules:chat.leave]]</a>
				</li>
			</ul>
		</div>
		<span class="members">
			[[modules:chat.chatting_with]]:
			<!-- BEGIN users -->
			<a href="{config.relative_path}/uid/{../uid}">{../username}</a><!-- IF !@last -->,<!-- END -->
			<!-- END -->
		</span>
	</div>
	<ul class="chat-content">
		<!-- BEGIN messages -->
<li component="chat/message" class="chat-message clear<!-- IF ../deleted --> deleted<!-- END -->" data-index="{messages.index}" data-mid="{messages.messageId}" data-uid="{messages.fromuid}" data-self="{messages.self}" data-break="{messages.newSet}" data-timestamp="{messages.timestamp}">
	<div class="message-header">
		<a href="{config.relative_path}/user/{messages.fromUser.userslug}">
			<!-- IF messages.fromUser.picture -->
			<img class="chat-user-image not-responsive" src="{messages.fromUser.picture}">
			<!-- ELSE -->
			<div class="user-icon chat-user-image" style="background-color: {messages.fromUser.icon:bgColor};">{messages.fromUser.icon:text}</div>
			<!-- ENDIF messages.fromUser.picture -->
		</a>
		<strong><span class="chat-user">{messages.fromUser.username}</span></strong>
		<span class="chat-timestamp timeago" title="{messages.timestampISO}"></span>
	</div>
	<div component="chat/message/body" class="message-body">
		<!-- IF messages.edited -->
		<small class="text-muted pull-right" title="[[global:edited]] {messages.editedISO}"><i class="fa fa-edit"></i></span></small>
		<!-- ENDIF messages.edited -->
		<!-- IF !config.disableChatMessageEditing -->
		<!-- IF messages.self -->
		<div class="pull-right btn-group controls">
			<button class="btn btn-xs btn-link" data-action="edit"><i class="fa fa-pencil"></i></button>
			<button class="btn btn-xs btn-link" data-action="delete"><i class="fa fa-times"></i></button>
			<button class="btn btn-xs btn-link" data-action="restore"><i class="fa fa-repeat"></i></button>
		</div>
		<!-- ENDIF messages.self -->
		<!-- ENDIF !config.disableChatMessageEditing -->
		{messages.content}
	</div>
</li>
<!-- END messages -->
	</ul>
	<div component="chat/composer">
		<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input mousetrap" rows="2"></textarea>
		<button class="btn btn-primary" type="button" data-action="send"><i class="fa fa-fw fa-2x fa-paper-plane"></i></button>
		<span component="chat/message/remaining">{maximumChatMessageLength}</span>
	</div>
</div>
<!-- ELSE -->
<div class="alert alert-info">
	[[modules:chat.no-messages]]
</div>
<!-- ENDIF roomId -->