(()=>{var e={108:(e,t,r)=>{const n=r(108),o="0.0.0.0";n.createServer(((e,t)=>{t.statusCode=200,t.setHeader("Content-Type","text/plain"),t.end("Hello Cruel World!")})).listen(3e3,o,(()=>{console.log("Web server running at http://%s:%s",o,3e3)}))}},t={};function r(n){var o=t[n];if(void 0!==o)return o.exports;var s=t[n]={exports:{}};return e[n](s,s.exports,r),s.exports}(()=>{const e=r(108),t="0.0.0.0";e.createServer(((e,t)=>{t.statusCode=200,t.setHeader("Content-Type","text/plain"),t.end("Hello Cruel World!")})).listen(3e3,t,(()=>{console.log("Web server running at http://%s:%s",t,3e3)}))})()})();