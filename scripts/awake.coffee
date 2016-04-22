module.exports = (robot) ->
  robot.router.get '/hubot/keepawake', (req, res) ->
    res.writeHead 200, {'Content-Type': 'application/json'}
    res.end 'I\'m awake!\n' 
