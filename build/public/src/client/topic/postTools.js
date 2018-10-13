"use strict";define("forum/topic/postTools",["share","navigator","components","translator","forum/topic/votes","forum/topic/move-post","forum/topic/diffs"],function(t,o,a,e,n,i,r){var s={};var p=false;s.init=function(o){p=false;c();d(o);t.addShareHandlers(ajaxify.data.titleRaw);n.addVoteHandler();s.updatePostCount(ajaxify.data.postcount)};function c(){$('[component="topic"]').on("show.bs.dropdown",".moderator-tools",function(){var t=$(this);var o=t.find(".dropdown-menu");if(o.html()){return}var a=t.parents("[data-pid]");var e=a.attr("data-pid");var n=parseInt(a.attr("data-index"),10);socket.emit("posts.loadPostTools",{pid:e,cid:ajaxify.data.cid},function(t,a){if(t){return app.alertError(t.message)}a.posts.display_move_tools=a.posts.display_move_tools&&n!==0;app.parseAndTranslate("partials/topic/post-menu-list",a,function(t){o.html(t);require(["clipboard"],function(t){new t("[data-clipboard-text]")});$(window).trigger("action:post.tools.load")})})})}s.toggle=function(t,o){var e=a.get("post","pid",t);e.find('[component="post/quote"], [component="post/bookmark"], [component="post/reply"], [component="post/flag"], [component="user/chat"]').toggleClass("hidden",o);e.find('[component="post/delete"]').toggleClass("hidden",o);e.find('[component="post/restore"]').toggleClass("hidden",!o);e.find('[component="post/purge"]').toggleClass("hidden",!o);e.find('[component="post/tools"] .dropdown-menu').html("")};s.updatePostCount=function(t){var e=a.get("topic/post-count");e.html(t).attr("title",t);utils.makeNumbersHumanReadable(e);o.setCount(t)};function d(t){var o=a.get("topic");o.on("click",'[component="post/quote"]',function(){u($(this),t)});o.on("click",'[component="post/reply"]',function(){l($(this),t)});$(".topic").on("click",'[component="topic/reply"]',function(o){o.preventDefault();l($(this),t)});$(".topic").on("click",'[component="topic/reply-as-topic"]',function(){e.translate("[[topic:link_back, "+ajaxify.data.titleRaw+", "+config.relative_path+"/topic/"+ajaxify.data.slug+"]]",function(t){$(window).trigger("action:composer.topic.new",{cid:ajaxify.data.cid,body:t})})});o.on("click",'[component="post/bookmark"]',function(){return m($(this),g($(this),"data-pid"))});o.on("click",'[component="post/upvote"]',function(){return n.toggleVote($(this),".upvoted","posts.upvote")});o.on("click",'[component="post/downvote"]',function(){return n.toggleVote($(this),".downvoted","posts.downvote")});o.on("click",'[component="post/vote-count"]',function(){n.showVotes(g($(this),"data-pid"))});o.on("click",'[component="post/flag"]',function(){var t=g($(this),"data-pid");require(["flags"],function(o){o.showFlagModal({type:"post",id:t})})});o.on("click",'[component="post/edit"]',function(){var t=$(this);var o=parseInt(g(t,"data-timestamp"),10);var a=parseInt(ajaxify.data.postEditDuration,10);if(s(a,o,"post-edit-duration-expired")){$(window).trigger("action:composer.post.edit",{pid:g(t,"data-pid")})}});if(config.enablePostHistory&&ajaxify.data.privileges["posts:history"]){o.on("click",'[component="post/view-history"], [component="post/edit-indicator"]',function(){var t=$(this);r.open(g(t,"data-pid"))})}o.on("click",'[component="post/delete"]',function(){var o=$(this);var a=parseInt(g(o,"data-timestamp"),10);var e=parseInt(ajaxify.data.postDeleteDuration,10);if(s(e,a,"post-delete-duration-expired")){h($(this),t)}});function s(t,o,a){if(!ajaxify.data.privileges.isAdminOrMod&&t&&Date.now()-o>t*1e3){var e=Math.floor(t/86400);var n=Math.floor(t%86400/3600);var i=Math.floor(t%86400%3600/60);var r=t%86400%3600%60;var s="[[error:"+a+", "+t+"]]";if(e){if(n){s="[[error:"+a+"-days-hours, "+e+", "+n+"]]"}else{s="[[error:"+a+"-days, "+e+"]]"}}else if(n){if(i){s="[[error:"+a+"-hours-minutes, "+n+", "+i+"]]"}else{s="[[error:"+a+"-hours, "+n+"]]"}}else if(i){if(r){s="[[error:"+a+"-minutes-seconds, "+i+", "+r+"]]"}else{s="[[error:"+a+"-minutes, "+i+"]]"}}app.alertError(s);return false}return true}o.on("click",'[component="post/restore"]',function(){h($(this),t)});o.on("click",'[component="post/purge"]',function(){w($(this),t)});o.on("click",'[component="post/move"]',function(){i.openMovePostModal($(this).parents("[data-pid]"))});o.on("click",'[component="post/ban-ip"]',function(){var t=$(this).attr("data-ip");socket.emit("blacklist.addRule",t,function(t){if(t){return app.alertError(t.message)}app.alertSuccess("[[admin/manage/blacklist:ban-ip]]")})});o.on("click",'[component="post/chat"]',function(){y($(this))})}function l(t,o){var a=f();x(function(){var e=v(t);if(g(t,"data-uid")==="0"||!g(t,"data-userslug")){e=""}var n=t.is('[component="post/reply"]')?g(t,"data-pid"):null;if(a.text&&(!n||!a.pid||n===a.pid)){e=e||a.username;$(window).trigger("action:composer.addQuote",{tid:o,pid:n,topicName:ajaxify.data.titleRaw,username:e,text:a.text,selectedPid:a.pid})}else{$(window).trigger("action:composer.post.new",{tid:o,pid:n,topicName:ajaxify.data.titleRaw,text:e?e+" ":""})}})}function u(t,o){var a=f();x(function(){var e=v(t);var n=g(t,"data-pid");function i(t){$(window).trigger("action:composer.addQuote",{tid:o,pid:n,username:e,topicName:ajaxify.data.titleRaw,text:t})}if(a.text&&n&&n===a.pid){return i(a.text)}socket.emit("posts.getRawPost",n,function(t,o){if(t){return app.alertError(t.message)}i(o)})})}function f(){var t="";var o;var a="";var e=window.getSelection?window.getSelection():document.selection.createRange();var n=$('[component="post"] [component="post/content"]');var i;n.each(function(t,o){if(e&&e.containsNode&&o&&e.containsNode(o,true)){i=o}});if(i){var r=document.createRange();r.selectNodeContents(i);var s=e.getRangeAt(0).cloneRange();if(s.compareBoundaryPoints(Range.START_TO_START,r)<0){s.setStart(r.startContainer,r.startOffset)}if(s.compareBoundaryPoints(Range.END_TO_END,r)>0){s.setEnd(r.endContainer,r.endOffset)}r.detach();t=s.toString();var p=$(i).parents('[component="post"]');o=p.attr("data-pid");a=v($(i));s.detach()}return{text:t,pid:o,username:a}}function m(t,o){var a=t.attr("data-bookmarked")==="false"?"posts.bookmark":"posts.unbookmark";socket.emit(a,{pid:o,room_id:"topic_"+ajaxify.data.tid},function(t){if(t){app.alertError(t.message)}});return false}function g(t,o){return t.parents("[data-pid]").attr(o)}function v(t){var o="";var a=t.parents("[data-pid]");if(t.attr("component")==="topic/reply"){return o}if(a.length){o=a.attr("data-userslug")}if(a.length&&a.attr("data-uid")!=="0"){o="@"+o}return o}function h(t,o){var e=g(t,"data-pid");var n=a.get("post","pid",e);var i=!n.hasClass("deleted")?"delete":"restore";k(i,e,o)}function w(t,o){k("purge",g(t,"data-pid"),o)}function k(t,o,a){e.translate("[[topic:post_"+t+"_confirm]]",function(e){bootbox.confirm(e,function(e){if(!e){return}socket.emit("posts."+t,{pid:o,tid:a},function(t){if(t){app.alertError(t.message)}})})})}function y(t){var o=t.parents("[data-pid]");app.newChat(o.attr("data-uid"));t.parents(".btn-group").find(".dropdown-toggle").click();return false}function x(t){var o=Math.min(Date.now()-1e3*60*60*24*ajaxify.data.topicStaleDays,864e13);if(p||ajaxify.data.lastposttime>=o){return t()}e.translate("[[topic:stale.warning]]",function(o){var a=bootbox.dialog({title:"[[topic:stale.title]]",message:o,buttons:{reply:{label:"[[topic:stale.reply_anyway]]",className:"btn-link",callback:function(){p=true;t()}},create:{label:"[[topic:stale.create]]",className:"btn-primary",callback:function(){e.translate("[[topic:link_back, "+ajaxify.data.title+", "+config.relative_path+"/topic/"+ajaxify.data.slug+"]]",function(t){$(window).trigger("action:composer.topic.new",{cid:ajaxify.data.cid,body:t})})}}}});a.modal()})}return s});
//# sourceMappingURL=public/src/client/topic/postTools.js.map