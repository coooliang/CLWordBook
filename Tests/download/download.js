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
var url = "https://dict.youdao.com/dictvoice?audio=apple&type=2";
download(url, "apple.mp3")