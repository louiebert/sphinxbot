module.exports = (robot) ->
  robot.router.get '/', (req, res) ->
    res.render('index.html')