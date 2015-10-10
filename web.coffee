coffee  = require("coffee-script")
express = require("express")
http    = require("http")
ws      = require("ws")

app = express()

app.get "/", (req, res) ->
  console.log "#{new Date} Sending index.html"
  res.sendfile "#{__dirname}/index.html"

server = http.createServer(app)

server.listen (process.env.PORT || 5000)

echo = new ws.Server(server:server)

echo.on "connection", (connection) ->
  connection.on "message", (message) ->
    console.log("send #{message}")
    connection.send message

# setInterval(
#   -> console.log(new Date),
#   60000
# )
