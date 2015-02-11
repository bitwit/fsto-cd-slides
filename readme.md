# Getting Started with Continuous Delivery

By Kyle Newsome

Slides: https://github.com/bitwit/fsto-cd-slides

Twitter: [@kylnew](https://twitter.com/kylnew)


## Agenda
- Why do Continuous Delivery? (10m)
- Demonstration with Node.JS project (30m)
- Challenges of Continous Delivery/Tips (10m)
- Discussion/Questions
- Slide Notes [github.com/bitwit/fsto-cd-slides](https://github.com/bitwit/fsto-cd-slides)


## About me
- Lead Developer @ Sidekick
- Started implementing CD processes over the last 6 months
- We're not experts but we've come a long way
- No expertise required to get started doing CD


## Symptoms of life without Continuous Delivery

### Decentralized deployment and task knowledge
- 'Project *x* needs a fix and redeployment' --> "That's *y*'s area of expertise"

### Costing developer time to manually deploy
- room for error in deployment tasks
- possibly no centralized documentation for deployment

### Staging environments are also hassle/not super flexible
- It's just another deployment you are doing manually

### Versioning is manual and arbitrary
- Bumping the version number based on feel
- No real record of actual release dates, or commits
- Possibly forgetting to bump sometimes
- Or maybe just not bothering at all


## A DevOps Horror Story
http://dougseven.com/2014/04/17/knightmare-a-devops-cautionary-tale/

The story of how Knight Capital Group, with nearly $400 million in assets went bankrupt in 45-minutes because of a failed deployment

### [QUOTE]:

...one of Knight’s technicians did not copy the new code to one of the eight SMARS computer servers. Knight did not have a second technician review this deployment and no one at Knight realized that the Power Peg code had not been removed from the eighth server, nor the new RLP code added. Knight had no written procedures that required such a review.


## Why do continuous delivery?
- Automatically deploy with one click
- Automatically version your project
- Automatically unit test all your code commits
	- Have a pulse on your projects; every branch in progress
- Less dependence on any given member of staff
- Eliminate environment specific quirks from your project 
	- local paths
	- local ssh keys
	- undocumented dependencies
	- etc..
- Deploy with confidence; Sleep better at night


## Today's technologies

### Strider CD
- Continuous Delivery server
- Open source
- Self Hosting is cheap (Can use a small Digital Ocean box)
- Easy to install
	
		$ npm install -g strider
- Equally as simple to set up and get going
- Very extendable, write your own plugins
- Built on MEAN stack

http://stridercd.com/

### git
- Version control system of choice
- tagging, committing, pushing from CD server
- *(time permitting)* git workflow and branching

http://git-scm.com/

Recommended reading:

[A Successful Branching Model](http://nvie.com/posts/a-successful-git-branching-model/)

### Grunt
- Task runner
- Helps keep everything we want to do to deploy in javascript	
- Installed with `npm install -g grunt-cli`

http://gruntjs.com/

### Yeoman
- Webapp template generator
- Great way to get a head start on unit testing structure
- Installed with `npm install -g yo`

http://yeoman.io/


## Demonstration

### The template
- Install a Yeoman template
	- I've picked [generator-node](https://github.com/yeoman/generator-node)
- Discuss package.json & `npm test`
	- See [npm scripts](https://www.npmjs.org/doc/misc/npm-scripts.html)
- Demonstrate some unit testing
- Commit to new git repo on GitHub

### Strider Local
- Install Strider locally
- Add new Strider user and start Strider (localhost:3000)
- Add the git repo, execute first test

### Grunt
- Install grunt and grunt-bump in project
- Discuss grunt-bump settings
- Create a grunt `deploy` task with `bump:minor` included

### Back to Strider Local
- Add Custom Scripts Plugin to Strider project
- Add `grunt deploy` to *deploy* of Custom Scripts
- Demonstrate latest buld passing and 'deployed' i.e. versioned, tagged, and recommited to git

### Deployment
- (optional) Discuss deployment ideas
	- Strider SSH Deploy plugin
	- node.js projects -> [pod](https://github.com/yyx990803/pod)
	- static files -> [grunt-ssh](https://github.com/chuckmo/grunt-ssh) (also does ftp)
	- WordPress plugins - [grunt-wp-deploy](https://github.com/stephenharris/grunt-wp-deploy)
	- Many other options depending on your project

### Refinement
- (optional) Discuss other useful Strider plugins
	- Strider Environment
	- Strider MetaData
	- Strider SlackHQ
	- Strider Heroku

### Strider Remote
- Demonstrate automatic testing on every commit


## Challenges & Tips

### It happens over time. There's no sudden revolution

### Almost any project can fit this mold
- Prepare, Test, Deploy => That's the paradigm
- Strider CD is, at its core, a node application for pulling code and running terminal commands

### Try implementing CD bit by bit
- version a project
- then deploy
- then some unit testing
- then some other pre/post deployment tasks

### Form an opinionated git workflow. Use 'key' branches to dictate types of versioning and deployment.

### Set projects up on a CD server as early as possible
- even if you have no unit tests
- even if you have no deployment procedure
- get used to keeping it green
- keep your project environment agnostic from the start

### Containerize as much as possible
- If possible, avoid too many global dependencies on the CD server
- Hosted CD providers shine at this

### ~~Hard version your dependencies~~ <br/> Manage dependencies with care
- Projects that use loosely versioned dependencies are adding uncertainty to your build
- You can try to fight it, but sub dependencies might have it too
- So monitor and maintain them consciously
- Look for ways to take a snapshot of exact versions at a point in time, such as:
	1. Save the build somewhere
	2. Keep track of exact versions used during build `npm ls --json`
	3. Possibly zip and store dependencies as well?

### Automate _all the things_
- anything that happens before or after a commit or deployment can be automated


## Thanks for listening

Slides: https://github.com/bitwit/fsto-cd-slides

Github: http://github.com/bitwit

Twitter: @kylnew
