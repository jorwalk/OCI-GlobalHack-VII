"use strict";define("uploader",["translator","benchpress"],function(e,r){var o={};o.show=function(e,r){var o=e.hasOwnProperty("fileSize")&&e.fileSize!==undefined?parseInt(e.fileSize,10):false;s({showHelp:e.hasOwnProperty("showHelp")&&e.showHelp!==undefined?e.showHelp:true,fileSize:o,title:e.title||"[[global:upload_file]]",description:e.description||"",button:e.button||"[[global:upload]]",accept:e.accept?e.accept.replace(/,/g,"&#44; "):""},function(s){s=$(s);s.modal("show");s.on("hidden.bs.modal",function(){s.remove()});var i=s.find("#uploadForm");i.attr("action",e.route);i.find("#params").val(JSON.stringify(e.params));s.find("#fileUploadSubmitBtn").on("click",function(){$(this).addClass("disabled");i.submit()});i.submit(function(){t(s,o,r);return false})})};o.hideAlerts=function(e){$(e).find("#alert-status, #alert-success, #alert-error, #upload-progress-box").addClass("hide")};function t(e,r,t){function s(r,t){o.hideAlerts(e);if(r==="error"){e.find("#fileUploadSubmitBtn").removeClass("disabled")}e.find("#alert-"+r).translateText(t).removeClass("hide")}s("status","[[uploads:uploading-file]]");e.find("#upload-progress-bar").css("width","0%");e.find("#upload-progress-box").show().removeClass("hide");var a=e.find("#fileInput");if(!a.val()){return s("error","[[uploads:select-file-to-upload]]")}if(!n(a[0],r)){return s("error","[[error:file-too-big, "+r+"]]")}e.find("#uploadForm").ajaxSubmit({headers:{"x-csrf-token":config.csrf_token},error:function(e){e=i(e);s("error",e.responseJSON?e.responseJSON.error||e.statusText:"error uploading, code : "+e.status)},uploadProgress:function(r,o,t,s){e.find("#upload-progress-bar").css("width",s+"%")},success:function(r){r=i(r);if(r.error){return s("error",r.error)}t(r[0].url);s("success","[[uploads:upload-success]]");setTimeout(function(){o.hideAlerts(e);e.modal("hide")},750)}})}function s(o,t){r.parse("partials/modals/upload_file_modal",o,function(r){e.translate(r,t)})}function i(e){if(typeof e==="string"){try{return $.parseJSON(e)}catch(e){return{error:"[[error:parse-error]]"}}}return e}function n(e,r){if(window.FileReader&&r){return e.files[0].size<=r*1e3}return true}return o});
//# sourceMappingURL=public/src/modules/uploader.js.map