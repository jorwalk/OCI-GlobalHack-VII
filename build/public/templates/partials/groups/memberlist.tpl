<div class="row">
	<!-- IF group.isOwner -->
	<div class="col-lg-2">
		<button component="groups/members/add" type="button" class="btn btn-primary" title="[[groups:details.add-member]]"><i class="fa fa-user-plus"></i></button>
	</div>
	<!-- ENDIF group.isOwner -->
	<div class="<!-- IF group.isOwner -->col-lg-10<!-- ELSE -->col-lg-12<!-- ENDIF group.isOwner -->">
		<div class="input-group">
			<input class="form-control" type="text" component="groups/members/search" placeholder="[[global:search]]"/>
		</div>
	</div>
</div>

<table component="groups/members" class="table table-striped table-hover" data-nextstart="{group.membersNextStart}">
	<!-- BEGIN group.members -->
	<tr data-uid="{group.members.uid}">
		<td>
			<a href="{config.relative_path}/user/{group.members.userslug}">
				<!-- IF group.members.picture -->
				<img class="avatar avatar-sm" src="{group.members.picture}" />
				<!-- ELSE -->
				<div class="avatar avatar-sm" style="background-color: {group.members.icon:bgColor};">{group.members.icon:text}</div>
				<!-- ENDIF group.members.picture -->
			</a>
		</td>
		<td class="member-name">
			<a href="{config.relative_path}/user/{group.members.userslug}">{group.members.username}</a> <i title="[[groups:owner]]" class="fa fa-star text-warning <!-- IF !group.members.isOwner -->invisible<!-- ENDIF !group.members.isOwner -->"></i>
		</td>
		<!-- IF group.isOwner -->
		<td>
			<div class="btn-group pull-right">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					[[global:more]] <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="#" data-ajaxify="false" data-action="toggleOwnership">
							[[groups:details.grant]]
						</a>
					</li>
					<li>
						<a href="#" data-ajaxify="false" data-action="kick">
							[[groups:details.kick]]
						</a>
					</li>
				</ul>
			</div>
		</td>
		<!-- ENDIF group.isOwner -->
	</tr>
	<!-- END group.members -->
</table>