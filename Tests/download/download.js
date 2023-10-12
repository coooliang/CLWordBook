//node-fetch  https://github.com/bitinn/node-fetch
var fetch = require("node-fetch");
var fs = require("fs");

function download(u, p) {
    return fetch(u, {
        method: 'GET',
        headers: { 'Content-Type': 'application/octet-stream' },
    }).then(res => res.buffer()).then(_ => {
        fs.writeFile(p, _, "binary", function (err) {
            console.log(err || p);
        });
    });
}

let cet46 = ["a","an","abandon","abbreviation","abide","able","ability"];
 
for(index in cet46){
    let w = cet46[index];
    let url = "https://dict.youdao.com/dictvoice?audio=" + w + "&type=2";
    let path = 'mp3/' + w + '.mp3'
    console.log("url = " + url);
    console.log("path = " + path);
    let time = index * 100;
    setTimeout(()=>{
        download(url, path)
    },time)
}