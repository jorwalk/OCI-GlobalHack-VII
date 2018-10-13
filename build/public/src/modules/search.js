"use strict";define("search",["navigator","translator","storage"],function(e,t,r){var i={current:{}};i.query=function(e,t){var r=e.term;var s=r.match(/^in:topic-([\d]+) /);if(!s){r=r.replace(/^[ ?#]*/,"");try{r=encodeURIComponent(r)}catch(e){return app.alertError("[[error:invalid-search-term]]")}ajaxify.go("search?"+n(e));t()}else{var a=r.replace(s[0],"");var c=s[1];if(a.length>0){i.queryTopic(c,a,t)}}};function n(e){var t=e.in||"titlesposts";var r=e.by||"";var i={term:e.term,in:t};if(e.matchWords){i.matchWords=e.matchWords}if(r&&r.length&&(t==="posts"||t==="titles"||t==="titlesposts")){i.by=r}if(e.categories&&e.categories.length){i.categories=e.categories;if(e.searchChildren){i.searchChildren=e.searchChildren}}if(e.hasTags&&e.hasTags.length){i.hasTags=e.hasTags}if(parseInt(e.replies,10)>0){i.replies=e.replies;i.repliesFilter=e.repliesFilter||"atleast"}if(e.timeRange){i.timeRange=e.timeRange;i.timeFilter=e.timeFilter||"newer"}if(e.sortBy){i.sortBy=e.sortBy;i.sortDirection=e.sortDirection}if(e.showAs){i.showAs=e.showAs}$(window).trigger("action:search.createQueryString",{query:i,data:e});return decodeURIComponent($.param(i))}i.getSearchPreferences=function(){try{return JSON.parse(r.getItem("search-preferences")||"{}")}catch(e){return{}}};i.queryTopic=function(e,t){socket.emit("topics.search",{tid:e,term:t},function(r,n){if(r){return app.alertError(r.message)}if(Array.isArray(n)){i.current={results:n.sort(function(e,t){return e-t}),tid:e,term:t};i.checkPagePresence(e,function(){i.topicDOM.update(0)})}})};i.checkPagePresence=function(e,t){if(parseInt(ajaxify.data.tid,10)!==parseInt(e,10)){ajaxify.go("topic/"+e,t)}else{t()}};i.topicDOM={active:false};i.topicDOM.prev=function(){i.topicDOM.update(i.current.index===0?i.current.results.length-1:i.current.index-1)};i.topicDOM.next=function(){i.topicDOM.update(i.current.index===i.current.results.length-1?0:i.current.index+1)};i.topicDOM.update=function(r){var n=$(".topic-search");i.current.index=r;i.topicDOM.start();if(i.current.results.length>0){n.find(".count").html(r+1+" / "+i.current.results.length);n.find(".prev, .next").removeAttr("disabled");var s={pid:i.current.results[r],tid:i.current.tid,topicPostSort:config.topicPostSort};socket.emit("posts.getPidIndex",s,function(t,r){if(t){return app.alertError(t.message)}e.scrollToIndex(r,true)})}else{t.translate("[[search:no-matches]]",function(e){n.find(".count").html(e)});n.removeClass("hidden").find(".prev, .next").attr("disabled","disabled")}};i.topicDOM.start=function(){$(".topic-search").removeClass("hidden");if(!i.topicDOM.active){i.topicDOM.active=true;require(["mousetrap"],function(e){e.bind("esc",i.topicDOM.end)})}};i.topicDOM.end=function(){$(".topic-search").addClass("hidden").find(".prev, .next").attr("disabled","disabled");i.topicDOM.active=false;require(["mousetrap"],function(e){e.unbind("esc",i.topicDOM.end)})};return i});
//# sourceMappingURL=public/src/modules/search.js.map