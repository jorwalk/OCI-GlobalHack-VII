"use strict";define("admin/appearance/customise",["admin/settings","ace/ace"],function(e,t){var a={};a.init=function(){e.prepare(function(){$("#customCSS").text($("#customCSS-holder").val());$("#customJS").text($("#customJS-holder").val());$("#customHTML").text($("#customHTML-holder").val());var e=t.edit("customCSS");var a=t.edit("customJS");var s=t.edit("customHTML");e.setTheme("ace/theme/twilight");e.getSession().setMode("ace/mode/less");e.on("change",function(){app.flags=app.flags||{};app.flags._unsaved=true;$("#customCSS-holder").val(e.getValue())});a.setTheme("ace/theme/twilight");a.getSession().setMode("ace/mode/javascript");a.on("change",function(){app.flags=app.flags||{};app.flags._unsaved=true;$("#customJS-holder").val(a.getValue())});s.setTheme("ace/theme/twilight");s.getSession().setMode("ace/mode/html");s.on("change",function(){app.flags=app.flags||{};app.flags._unsaved=true;$("#customHTML-holder").val(s.getValue())});$("#save").on("click",function(){if($("#enableLiveReload").is(":checked")){socket.emit("admin.reloadAllSessions")}})})};return a});
//# sourceMappingURL=public/src/admin/appearance/customise.js.map