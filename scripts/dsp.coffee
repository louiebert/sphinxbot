# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot weather - tells the current temperature and high/low for the day in Rolla, MO

module.exports = (robot) ->
  robot.respond /the weather/i, (res) ->
    current = ""
    high = ""
    low = ""
    robot.http("http://api.openweathermap.org/data/2.5/weather?id=4406282&units=imperial&APPID=878cfdada5727a9ca91f56e2d010c20c")
      .get() (err, resp, body) ->
        if err
          res.send "Encountered an error: #{err}"
          return
        data = JSON.parse body
        current = data.main.temp
        robot.http("http://api.openweathermap.org/data/2.5/forecast/daily?id=4406282&cnt=1&units=imperial&APPID=878cfdada5727a9ca91f56e2d010c20c")
          .get() (err, resp, body) ->
            if err
              res.send "Encountered an error: #{err}"
              return
            data = JSON.parse body
            high = data.list[0].temp.max
            low = data.list[0].temp.min
            res.send "The current temperature in Rolla is #{current}º, the high for today is #{high}º, and the low is #{low}º"
        return