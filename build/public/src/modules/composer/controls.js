"use strict";define("composer/controls",["composer/preview"],function(e){var n={};n.insertIntoTextarea=function(n,t){var r=$(n);var l=r.val();var i=r.parents('[component="composer"]');r.val(l.slice(0,n.selectionStart)+t+l.slice(n.selectionStart));e.render(i)};n.wrapSelectionInTextareaWith=function(e,n,t){if(t===undefined){t=n}var r=$(e);var l=r.val();var i=/^(\s*)([\s\S]*?)(\s*)$/.exec(l.slice(e.selectionStart,e.selectionEnd));if(!i[2]){i=[null,"",l.slice(e.selectionStart,e.selectionEnd),""]}r.val(l.slice(0,e.selectionStart)+i[1]+n+i[2]+t+i[3]+l.slice(e.selectionEnd));return[i[1].length,i[3].length]};n.updateTextareaSelection=function(e,n,t){e.setSelectionRange(n,t);$(e).focus()};n.getBlockData=function(e,n,t){var r=e.value;n=n.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&");var l=new RegExp(n,"g");var i;var a=[];var c;r=r.split("\n").reduce(function(e,n){if(e!==null){return e}e=t<=n.length?n:null;if(e===null){t=t-(n.length+1)}return e},null);while((i=l.exec(r))!==null){a.push(i.index)}c={in:!!(a.reduce(function(e,n){if(t>=n+2){e+=1}return e},0)%2),atEnd:a.reduce(function(e,n){if(e){return e}return t===n},false)};c.atEnd=c.in?c.atEnd:false;return c};return n});
//# sourceMappingURL=node_modules/nodebb-plugin-composer-default/static/lib/composer/controls.js.map