# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot who is the best pledge class - informs who the best pledge class is
#   hubot who isn't the best pledge class - informs who the best pledge class isn't
#   hubot the weather - tells the current temperature and high/low for the day in Rolla, MO

module.exports = (robot) ->
  robot.hear /who is the best pledge class\?$/i, (msg) ->
    msg.send "Upsilon is the best pledge class, of course!"

  robot.hear /who isn(’|')t the best pledge class\?$/i, (msg) ->
    msg.send "Who do you think? It's obviously Tau."

  robot.router.post '/sphinxbot/chores/remind', (req, res) ->
    data = if req.body.payload? then JSON.parse req.body.payload else req.body
    message = "Your chore is: ```#{data.chore}```"
    for i in JSON.parse data.description
      item = if i == data.description[0]? then "• #{i}" else "\n• #{i}"
      message = message + item
    robot.messageRoom data.user, message

  robot.respond /the weather$/i, (msg) ->
    current = ""
    high = ""
    low = ""
    robot.http("http://api.openweathermap.org/data/2.5/weather?id=4406282&units=imperial&APPID=878cfdada5727a9ca91f56e2d010c20c")
      .get() (err, resp, body) ->
        if err
          msg.send "Encountered an error: #{err}"
          return
        data = JSON.parse body
        current = data.main.temp
        robot.http("http://api.openweathermap.org/data/2.5/forecast/daily?id=4406282&cnt=1&units=imperial&APPID=878cfdada5727a9ca91f56e2d010c20c")
          .get() (err, resp, body) ->
            if err
              msg.send "Encountered an error: #{err}"
              return
            data = JSON.parse body
            high = data.list[0].temp.max
            low = data.list[0].temp.min
            msg.send "The current temperature in Rolla is #{current}º, the high for today is #{high}º, and the low is #{low}º"