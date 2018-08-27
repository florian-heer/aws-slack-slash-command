exports.handler = function (event, context, callback) {
    console.log('Received event:', JSON.stringify(event, null, 2));
    var slackVerificationToken = process.env.SLACK_VERIFICATION_TOKEN;
    var slackTeamId = process.env.SLACK_TEAM_ID;
    
    // code...

    callback(null, event);
};
