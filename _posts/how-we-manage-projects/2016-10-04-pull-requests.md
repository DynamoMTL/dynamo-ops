---
layout: post
title: "A Successful Pull Request"
published: true
tags: code code-quality process
category: how-we-manage-projects
order: 6
---

We have doubled down on code reviews(CR will be used as shorthand) throughout this year and that's simply amazing.
Having another pair of eyes on even the smallest of code changes can initiate a wonderful back-pat or unearth something that needs to be completely refactored.
The hard part about this is actually getting folks to perform the code review.
Here are a few tips to guarentee someone will drop their PSL infused pickles and pencil your review into their day.

Step 1: Is your Code Ready For Code Review?

Does your project have a CI tool that runs on the specific PR (going to go to the shortened form for the rest of this,
a PR === pull request)?
Is the little green button checked at the bottom of the PR or is it red_circle?
If it's red then perhaps there is a little more work to do to green it up.
If for some reason you don't know how to make it green again,
explain so in the PR comment where you ping folks for CR help.

Is there enough context in comments and commits for someone to jump into the PR and know what's going on with minimal digging?
Was there a conversation between folks in comments,
were the commits descriptive or just 'WIP' and is there any link to a Clubhouse or Pivotal ticket?
If not, then perhaps a context paragraph explaining things should be added to the CR request (usually the code review comment in GitHub).

Step 2: Ping People in The Pull Request

GitHub and presumably GitLab,
have wonderful transactional emails that get sent when anyone is pinged in an issue or PR.
A great first request for CR should be pinging people's GitHub usernames in a comment under the PR.
This will initiate GitHub's transactional email rude goldberg machine and
an email will be sent with the comment text to everyone's inbox.
From here those people can pin, snooze, bookmark, forward,
whatever that email so they remind themselves to do it a little later or at worst, tomorrow.

Step 3: Ping The Project's Slack Channel

No one respond yet to the comment mention in GitHub?
Time to bring out some bigger guns.
Grab the URL of the PR and head over to your favorite Slack client.
Jump into the project specific (internal) Slack room and
paste the link along with some helpful content to guide folks who are part of the project but,
might not be clued into what you are working on.
Feel free to mention people who you would like to CR directly in the channel but,
use the channel for communication to clue folks in that you reached out for CR help.

STEP 4: Ping the Code Review Channel

The code review channel should be your best friend,
not where you go to hear the winds of silence blow.
However, the code review channel is your absolute last resort.
You are asking everyone from around the company to take a look at your code.
Those people might never touched the project and have literally no idea what's going on.
However, they have a few minutes before lunch and their last pomodoro so they help out with code reviews from this channel.

To guarentee someone will jump in and help you out with a CR here,
provide them with all the information they may need to grok the PR and make the request 100% async.
Don't ask if anyone has time or if anyone can CR your PR today.
Ask for a PR and provide a link to it in the channel.
If it's time sensitive, say so that people know there is a bit of a timeline to the request.
Feel free to use here/channel or whatever @ mentions you deem necissary.

Step 5: The code Reviewer

It's amazing that you are carving some time out of the day to CR some code.
However, make sure you actively tell the CR requester that you have some time today or you will get to the review tomorrow.
Be proactive and conversational in the PR comments before even starting the review.
Reviews can be very long (another post entirely) and take the whole span of a day.
Inform everyone that you are taking a stab at the CR and will have it done sometime in the future.
Let the CR requester know that their requests did not go by deaf ears.
