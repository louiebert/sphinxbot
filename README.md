### Chore Reminder
 * Url to post request to: `/hubot/chores/remind`
 * Request body
   * user: `Slack username` (no quotation marks)
   * chore: `chore title` (no quotation marks)
   * description: `[string array of instructions on how to complete the chore]` (yes quotation marks, for each instruction)
 * Authentication
   * Basic auth - stored in `EXPRESS_USER` and `EXPRESS_PASSWORD` environment variables