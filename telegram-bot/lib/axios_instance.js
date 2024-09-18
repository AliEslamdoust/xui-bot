var a=require('axios'),b=require('./log_handler'),c=require('fs'),d=require('js-yaml'),e=require('path'),f=e.join('/root/telegram-bot/db/config.yaml');let g;try{g=d.load(c.readFileSync(f));b.log('yamlData was loaded successfully','INFO')}catch(A){b.log(A,'ERROR')}async function h(_,B){try{let C=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[B].address}:${g.credentials[B].port}/api/getClient/${_}`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(_a=>C=_a.data.data).catch(D=>b.log(D,'ERROR'));return{ok:!0,data:C}}catch(_A){b.log(_A,'ERROR');return{ok:!1,msg:_A,data:null}}}async function i(E,_b){try{let aA=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[_b].address}:${g.credentials[_b].port}/api/SIDbyID/${E}`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(aB=>aA=aB.data.data).catch(aC=>b.log(aC,'ERROR'));return{ok:!0,data:aA}}catch(aD){b.log(aD,'ERROR');return{ok:!1,msg:aD,data:null}}}async function j(aE,_B){try{let aF=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[_B].address}:${g.credentials[_B].port}/api/syncClient/${aE}`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(aG=>aF=aG.data.msg).catch(aH=>{b.log(aH,'ERROR');aF=aH});return{ok:!0,msg:aF}}catch(aI){b.log(aI,'ERROR');return{ok:!1,msg:aI}}}async function k(aJ,aK){try{let aL=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[aK].address}:${g.credentials[aK].port}/api/stopClientSyncing/${aJ}`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(aM=>aL=aM.data.msg).catch(aN=>{b.log(aN,'ERROR');aL=aN});return{ok:!0,msg:aL}}catch(aO){b.log(aO,'ERROR');return{ok:!1,msg:aO}}}async function l(aP){try{let aQ=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[aP].address}:${g.credentials[aP].port}/api/getFinishedClient`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(aR=>aQ=aR.data.data).catch(aS=>b.log(aS,'ERROR'));return{ok:!0,data:aQ}}catch(aT){b.log(aT,'ERROR');return{ok:!1,msg:aT,data:null}}}async function m(aU,aV){try{let aW=null;await a.post(`${g.credentials[aV].address}:${g.credentials[aV].port}/api/updateClient`,JSON.stringify({client:aU}),{maxBodyLength:Infinity,headers:{Accept:'application/josn','Content-Type':'application/json',accesscode:g.accesscode}}).then(aX=>aW=aX.data.msg).catch(aY=>b.log(aY,'ERROR'));return{ok:!0,msg:aW}}catch(aZ){b.log(aZ,'ERROR');return{ok:!1,msg:aZ}}}async function n(bA,bB){try{let bC=null;await a.post(`${g.credentials[bB].address}:${g.credentials[bB].port}/api/removeClient`,JSON.stringify({client:bA}),{maxBodyLength:Infinity,headers:{Accept:'application/josn','Content-Type':'application/json',accesscode:g.accesscode}}).then(bD=>bC=bD.msg).catch(bE=>b.log(bE,'ERROR'));return{ok:!0,msg:bC}}catch(bF){b.log(bF,'ERROR');return{ok:!1,msg:bF}}}async function o(bG,bH){try{let bI=null;await a.post(`${g.credentials[bH].address}:${g.credentials[bH].port}/api/addClient`,JSON.stringify({client:bG}),{maxBodyLength:Infinity,headers:{Accept:'application/josn','Content-Type':'application/json',accesscode:g.accesscode}}).then(bJ=>bI=bJ.msg).catch(bK=>b.log(bK,'ERROR'));return{ok:!0,msg:bI}}catch(bL){b.log(bL,'ERROR');return{ok:!1,msg:bL}}}async function p(bM,bN){try{let bO=null;await a.post(`${g.credentials[bN].address}:${g.credentials[bN].port}/api/changeClientUsage`,JSON.stringify({client:bM}),{headers:{'Content-Type':'application/json',accesscode:g.accesscode}}).then(bP=>bO=bP.msg).catch(bQ=>b.log(bQ,'ERROR'));return{ok:!0,msg:bO}}catch(bR){b.log(bR,'ERROR');return{ok:!1,msg:bR}}}async function q(bS,bT){try{let bU=null;!bS&&(bS=10);!bT&&(bT=5);await a.request({method:'get',maxBodyLength:Infinity,url:`https://random-word-api.herokuapp.com/word?number=${bS}&length=${bT}`,headers:{Accept:'application/json'}}).then(bV=>bU=bV.data).catch(bW=>b.log(bW,'ERROR'));return{ok:!0,data:bU}}catch(bX){b.log(bX,'ERROR');return{ok:!1,msg:bX,data:null}}}async function r(bY){try{let bZ=null;await a.request({method:'get',maxBodyLength:Infinity,url:`${g.credentials[bY].address}:${g.credentials[bY].port}/api/restartXray`,headers:{Accept:'application/json',accesscode:g.accesscode}}).then(cA=>bZ=cA.data.msg).catch(cB=>{b.log(cB,'ERROR');bZ=cB});return{ok:!0,msg:bZ}}catch(cC){b.log(cC,'ERROR');return{ok:!1,msg:cC}}}module.exports={getConfigInfo:h,getConfigSubIdBy_uuid:i,getFinishedClients:l,updateClient:m,removeClient:n,addClient:o,changeClientUsage:p,getRandomWords:q,stopClientSync:k,startClientSync:j,restartXray:r};
