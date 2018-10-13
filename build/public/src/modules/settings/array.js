"use strict";define("settings/array",function(){var e;var t=null;function a(e){var a=$(t.createElement("button",{class:"btn btn-xs btn-primary remove",title:"Remove Item"},"-"));a.click(function(n){n.preventDefault();e.remove();a.remove();e.each(function(e,a){a=$(a);if(a.is("[data-key]")){t.destructElement(a)}})});return a}function n(e,n,r,i,c,u){r=t.deepClone(r);var d=r["data-type"]||r.type||"text";var o=$(t.createElementOfType(d,r.tagName,r));o.attr("data-parent","_"+n);delete r["data-type"];delete r.tagName;for(var f in r){if(r.hasOwnProperty(f)){var l=r[f];if(f.search("data-")===0){o.data(f.substring(5),l)}else if(f.search("prop-")===0){o.prop(f.substring(5),l)}else{o.attr(f,l)}}}t.fillField(o,i);if($('[data-parent="_'+n+'"]',e).length){u(c)}u(o);u(a(o.add(c)))}function r(e,a,r,i){var c=$(document.createTextNode(" "));var u=e.data("new")||"";var d=$(t.createElement("button",{class:"btn btn-sm btn-primary add",title:"Expand Array"},"+"));d.click(function(t){t.preventDefault();n(e,a,r,u,i.clone(),function(e){c.before(e)})});e.append(c);e.append(d)}e={types:["array","div"],use:function(){t=this.helper},create:function(e,a){return t.createElement(a||"div")},set:function(e,t){var a=e.data("attributes");var i=e.data("key")||e.data("parent");var c=e.data("split")||", ";c=function(){try{return $(c)}catch(e){return $(document.createTextNode(c))}}();if(typeof a!=="object"){a={}}e.empty();if(!(t instanceof Array)){t=[]}for(var u=0;u<t.length;u+=1){n(e,i,a,t[u],c.clone(),function(t){e.append(t)})}r(e,i,a,c)},get:function(e,a,n){var r=e.data("key")||e.data("parent");var i=$('[data-parent="_'+r+'"]',e);var c=[];i.each(function(e,a){a=$(a);var n=t.readValue(a);var r=t.isTrue(a.data("empty"));if(r||n!==undefined&&(n==null||n.length!==0)){return c.push(n)}});if(n||c.length){return c}}};return e});
//# sourceMappingURL=public/src/modules/settings/array.js.map