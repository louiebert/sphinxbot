# Sphinxbot: The chat bot for Delta Sig

## Setup and run locally
1. Make sure you have installed [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. Inside your terminal, navigate to a directory you'd like to have this project live in.
3. Run `git clone https://github.com/louman347/sphinxbot.git`
4. You should now have all the code from the repository and be in the master branch. Now run `git checkout -b <your new branch name>` before you start changing any code. (`<your new branch name>` can be whatever you want it to be).
5. Make sure your computer has [npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm) installed.
6. Check that you are inside the repository's root directory and then run `npm install`. This will get you all the necessary node packages to start working on the project locally.
7. Run `bin/hubot -n sphinxbot` to run the bot in the command line. Run `HUBOT_SLACK_TOKEN=<slack token> bin/hubot -a slack -n sphinxbot` to run the bot inside Slack (replacing `<slack token>` with the token found under the [hubot Slack customization](https://dsp-de.slack.com/services/B0BMHV6DU)). Be aware that running the bot inside Slack will likely produce double messages from the bot in Slack due to the live, remote version and the local version running simultaneously.

## Custom Commands
All the commands that have been added on top of the commands that came with the Hubot project (so far all are in `dsp.coffee`)
### Weather
 * "the weather" - _Doesn't need to be directed at Sphinxbot_
   * Current temperature, and high and low for the day for Rolla, MO
### Best/Worst Pledge Class
 * "who is the best pledge class" - _Needs to be directed at Sphinxbot_
   * "Upsilon is the best pledge class, of course!"
 * "who isn't the best pledge class" - _Needs to be directed at Sphinxbot_
   * "Who do you think? It's obviously Tau."
### Chore Reminder
 * Responds to post requests to the url: `/hubot/chores/remind`
 * Request body
   * user: `Slack username` (no quotation marks)
   * chore: `chore title` (no quotation marks)
   * description: `[string array of instructions on how to complete the chore]` (yes quotation marks, for each instruction)
 * Authentication
   * Basic auth - stored in `EXPRESS_USER` and `EXPRESS_PASSWORD` environment variables