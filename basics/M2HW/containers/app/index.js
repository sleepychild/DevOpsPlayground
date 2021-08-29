const express = require('express')
const os = require("os");
const app = express()
const port = 3000

app.get('/', (req, res) => res.send(
    `
    <h1>Hello</h1>
    <hr>
    <p>This is not my first container.</p>
    <p>Do I get extra credit for using the vagrant docker provisioner???</p>
    <p>This is container: ${os.hostname()}.</p>
    `
    ));

app.listen(port);


