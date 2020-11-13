const mysql = require('mysql')
console.log(process.env.DB_HOSTNAME)
module.exports = mysql.createConnection({
    host: "db4free.net",
    user: "atearth",
    password: "@earth.pass",
    database: "new_zwallet",
    timezone: "UTC",
    
})

