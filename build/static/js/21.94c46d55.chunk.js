"use strict";(self.webpackChunkpaymof=self.webpackChunkpaymof||[]).push([[21],{21:function(n,e,t){t.r(e),t.d(e,{default:function(){return l}});var a=t(885),c=t(2791),s=t(8617),i=t(9153),o=t(184),l=function(){var n,e=(0,c.useContext)(s.T),t=e.url,l=e.loggedSchool,u=(0,c.useState)(""),d=(0,a.Z)(u,2),r=d[0],h=d[1],p=(0,c.useState)(!1),f=(0,a.Z)(p,2),m=f[0],b=f[1],v=(0,c.useState)(!1),j=(0,a.Z)(v,2),k=j[0],x=j[1];(0,c.useEffect)((function(){fetch("".concat(t,"/main/settings/backup-record"),{method:"GET",headers:{"Content-Type":"application/json"},credentials:"include"}).then((function(n){return n.json()})).then((function(n){var e;null!==n&&void 0!==n&&n.status&&(h(null===n||void 0===n||null===(e=n.message[0])||void 0===e?void 0:e.backup_date),b(!1))})).catch((function(n){console.log(n)}))}),[t,m,k]);return(0,o.jsxs)("div",{className:"__backup",children:[(0,o.jsx)("h2",{children:"Backup Database"}),(0,o.jsxs)("div",{className:"container alert alert-warning backup-cont",children:[(0,o.jsx)("div",{className:"h6",children:(0,o.jsx)("b",{children:l})}),(0,o.jsx)("p",{children:(0,o.jsxs)("small",{children:["last backup:"," ",""!==r?null===(n=new Date(r))||void 0===n?void 0:n.toLocaleDateString():"Nil"]})})]}),(0,o.jsx)("div",{className:"btn-cont",children:(0,o.jsx)("button",{className:"btn btn-primary btn-sm mt-2",onClick:function(){x(!0),fetch("".concat(t,"/main/settings/backup"),{method:"GET",headers:{"Content-Type":"application/json"},credentials:"include"}).then((function(n){return n.json()})).then((function(n){x(!1),null!==n&&void 0!==n&&n.status&&(alert(null===n||void 0===n?void 0:n.message),b(!0))})).catch((function(n){x(!1),console.log(n)}))},disabled:k,children:k?(0,o.jsx)(i.Z.Loader,{}):"Backup"})})]})}}}]);
//# sourceMappingURL=21.94c46d55.chunk.js.map