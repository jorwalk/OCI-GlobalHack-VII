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

<div class="clearfix">
	<button id="upload" class="btn-success pull-right"><i class="fa fa-upload"></i> [[global:upload]]</button>
</div>

<div class="table-responsive">
	<table class="table table-striped users-table">
		<thead>
			<tr>
				<th>[[admin/manage/uploads:filename]]</th>
				<!-- IF showPids --><th class="text-right">[[admin/manage/uploads:usage]]</th><!-- END -->
				<th class="text-right">[[admin/manage/uploads:size/filecount]]</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<!-- BEGIN files -->
			<tr data-path="{files.path}">
				<!-- IF files.isDirectory -->
				<td class="col-md-6" role="button">
					<i class="fa fa-fw fa-folder-o"></i> <a href="{config.relative_path}/admin/manage/uploads?dir={files.path}">{files.name}</a>
				</td>
				<!-- ENDIF files.isDirectory -->

				<!-- IF files.isFile -->
				<td class="col-md-6">
					<i class="fa fa-fw fa-file-text-o"></i> <a href="{config.relative_path}{files.url}" target="_blank">{files.name}</a>
				</td>
				<!-- ENDIF files.isFile -->

				<!-- IF showPids -->
				<td class="col-md-3 text-right">
					<!-- BEGIN ../inPids -->
					<a target="_blank" href="{config.relative_path}/post/@value"><span class="label label-default">@value</span></a>
					<!-- END -->
					<!-- IF !../inPids.length -->
					<span class="label label-danger">[[admin/manage/uploads:orphaned]]</span>
					<!-- END -->
				</td>
				<!-- END -->

				<td class="col-md-2 text-right"><!-- IF files.isFile -->{files.sizeHumanReadable}<!-- ELSE -->[[admin/manage/uploads:filecount, {files.fileCount}]]<!-- ENDIF files.isFile --></td>

				<td role="button" class="col-md-1 text-right"><i class="delete fa fa-fw fa-trash-o <!-- IF !files.isFile --> hidden<!-- ENDIF !files.isFile -->"></i></td>
			</tr>
			<!-- END files -->
		</tbody>
	</table>
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
