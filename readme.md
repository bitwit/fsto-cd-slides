# Easy Continuous Delivery for Javascript Developers

By Kyle Newsome

[@kylnew](https://twitter.com/kylnew)


## Agenda
- Introduction (10m)
- Demonstration (30m)
- Discussion/Question (?m)
- Bonus stuff/Tips, time permitting (10m)
- Slide Notes [github.com/bitwit/fsto-cd-slides](https://github.com/bitwit/fsto-cd-slides)


## About me
- Developer @ Sidekick
- Not an expert in Continuous Delivery
- Starting Continuous delivery is easy 
- No expertise required.


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


## Why do continuous delivery?
- Automatically deploy with one click
- Automatically version your project
- Automatically unit test all your code commits
	- Have a pulse on your projects; every branch in progress
- Less dependence on any given member of staff
- Eliminate environment specific quirks from your project 
	- local paths
	- local ssh keys
	- etc..


## Today's technologies

### Strider
- Continuous Delivery server
- Open source
- Self Hosting is cheap (Can use a small Digital Ocean box)
- Easy to install
	
		$ npm install -g strider
- Equally as simple to set up and get going
- Prepare, Test, Deploy
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


## Tips

### Almost any project can fit the mold, not just JS projects
- Strider is, at its simplest, a node application for running terminal commands in the context of a git repo
- Prepare, Test, Deploy

### Try implementing CD bit by bit
- version a project
- then deploy
- then some unit testing
- then some other pre/post deployment tasks

### It happens over time. There's sudden revolution

### Form an opinionated git workflow. Use 'key' branches to dictate types of versioning and deployment.

### It starts with *JUST DOING IT*

### Set your project up on an integration server as early as possible
- even if you have no unit tests
- even if you have no deployment procedure
- get used to keeping it green
- keep your project environment agnostic from the start

### Hard version your dependencies

### Automate _all the things_
- anything that happens before or after a commit or deployment can be automated


## Thank you

Slides: https://github.com/bitwit/fsto-cd-slides

Github: http://github.com/bitwit

Twitter: @kylnew

Hiring: http://sidekick.pro


### Extra Notes
- should install grunt-cli and other builders, package managers globally
	- once your CD stack gets a bit more advanced move to better containerization
	- hosted CD solutions have this benefit
- set up git config
- checks out a commit hash on webhook, on a hitting test checks out a branch
- if you want to deploy on green automatically, you will need to check the branch out before committing 
