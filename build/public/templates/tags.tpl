<div class="tags">
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


	<!-- IF !tags.length -->
	<div class="alert alert-warning">
		<strong>[[tags:no_tags]]</strong>
	</div>
	<!-- ENDIF !tags.length -->

	<!-- IF displayTagSearch -->
	<input class="form-control" type="text" id="tag-search" placeholder="[[global:search]]"/>
	<br/>
	<!-- ENDIF displayTagSearch -->

	<div class="category row">
		<div class="col-md-12 clearfix tag-list" data-nextstart="{nextStart}">
			<!-- BEGIN tags -->
<h3 class="pull-left tag-container">
	<a href="{config.relative_path}/tags/{tags.value}" data-value="{tags.value}"><span class="tag-item" data-tag="{tags.value}" style="<!-- IF tags.color -->color: {tags.color};<!-- ENDIF tags.color --><!-- IF tags.bgColor -->background-color: {tags.bgColor};<!-- ENDIF tags.bgColor -->">{tags.valueEscaped}</span><span class="tag-topic-count">{tags.score}</span></a>
</h3>
<!-- END tags -->
		</div>
	</div>
</div>