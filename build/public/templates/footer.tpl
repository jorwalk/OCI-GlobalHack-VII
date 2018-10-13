	</div><!-- END container -->
	<!-- IF !isSpider -->
	<div class="topic-search hidden">
		<div class="btn-group">
			<button type="button" class="btn btn-default count"></button>
			<button type="button" class="btn btn-default prev"><i class="fa fa-fw fa-angle-up"></i></button>
			<button type="button" class="btn btn-default next"><i class="fa fa-fw fa-angle-down"></i></button>
		</div>
	</div>

	<div component="toaster/tray" class="alert-window">
		<div id="reconnect-alert" class="alert alert-dismissable alert-warning clearfix hide" component="toaster/toast">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<p>[[global:reconnecting-message, {config.siteTitle}]]</p>
		</div>
	</div>
	<!-- ENDIF !isSpider -->

	<script defer src="{relative_path}/assets/nodebb.min.js?{config.cache-buster}"></script>

	<!-- BEGIN scripts -->
	<script defer type="text/javascript" src="{scripts.src}"></script>
	<!-- END scripts -->

	<script>
		window.addEventListener('load', function () {
			require(['forum/footer']);

			<!-- IF useCustomJS -->
			{{customJS}}
			<!-- END -->
		});
	</script>

	<div class="hide">
	<script>
	window.addEventListener('load', function () {
		define(config.relative_path + '/assets/templates/500.js', function () {
			function compiled(helpers, context, get, iter, helper) {
				return '<div class="alert alert-danger">\n\t<strong>[[global:500.title]]</strong>\n\t<p>[[global:500.message]]</p>\n\t<p>' + 
					helpers.__escape(get(context && context['path'])) + '</p>\n\t' + 
					(get(context && context['error']) ? '<p>' + helpers.__escape(get(context && context['error'])) + '</p>' : '') + '\n\n\t' + 
					(get(context && context['returnLink']) ? '\n\t<p>[[error:goback]]</p>\n\t' : '') + '\n</div>\n';
			}

			return compiled;
		});
	});
</script>
	</div>
</body>
</html>
