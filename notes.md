# Easy continuous delivery for Javascript Developers


## About
- Developer @ Sidekick
- Not an expert in Continuous Delivery
- Goal today: Convince you Continuous delivery is easy to start. No expertise required.


## Overview
- Why do continuous delivery?
- Challenges of life without CD
- Discuss technologies to be used in demonstration
- Demonstration
- Tips
- Discussion


## Why do continuous delivery?
- Automatically unit test all your code commits
- Automatically version your project
- Automatically deploy with one click
- Less dependence on any given member of staff
- Eliminate environment specific quirks from your project (local configurations/ssh keys etc..)


## Symptoms of life without Continuous Delivery

### Decentralized deployment and task knowledge
- 'Project *x* needs a fix and redeployment' --> "That's *y*'s area of expertise"
- 'We need to clear the cache' --> "That's *z*'s job"

### Costing developer time to manually deploy
- no centralized knowledge base
- room for error in deployment tasks

### Staging environments are also hassle/not super flexible
- It's just another deployment you are doing manually

### Versioning is manual and arbitrary
- Bumping the version number based on feel
- Possibly forgetting to bump sometimes
- Or maybe just not bothering at all
- No real record of actual releases


## Today's technologies

### Strider CD
- Open source
- Easy to install
	
		$ npm install -g strider
- Equally as simple to set up and get going
- Prepare, Test, Deploy
- Very extendable, write your own plugins

### git
- in particular, some discussion of git workflow and branching

### Grunt
- Task runner
- Helps keep everything we want to do to deploy in javascript	

### Other tech..
- npm
- Yeoman


## Demonstration

### The template
1. Install bare bones template
2. Commit to new git repo on GitHub

### Strider
3. Install Strider
4. Add new Strider user and start Strider
5. Add the git repo, execute first test

### package.json
6. Discuss package.json & `npm test`
7. (optional) Demonstrate some unit testing
8. (optional) Discuss `npm postinstall` and `bower install` example

### Grunt
9. Install grunt and grunt-bump in project
10. Discuss grunt-bump settings

### Back to Strieder
11. Add Custom Scripts Plugin to Strider project
12. Add `grunt bump:minor` to *deploy* of Custom Scripts
13. Demonstrate latest buld passing and 'deployed' i.e. versioned, tagged, and recommited to git

### Deployment
14. (optional) Discuss deployment ideas
	- Strider SSH Deploy plugin
	- node.js projects -> pod
	- static files -> grunt-ssh (also does ftp)
	- WordPress plugins - grunt-wp-deploy
	- Many other options depending on your project

### Refinement
15. (optional) Discuss other useful Strider plugins
	- Strider Environment
	- Strider MetaData
	- Strider SlackHQ
	- Strider Heroku


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

### It starts with _JUST DOING IT_

### Set your project up on an integration server as early as possible
- even if you have no unit tests
- even if you have no deployment procedure
- get used to keeping it green
- keep your project environment agnostic from the start

### Hard version your dependencies

### Automate _all the things_
- anything that happens before or after a commit or deployment can be automated


## Thank you

Slides: 

Github: github.com/bitwit

Twitter: @kylnew

Hiring: http://sidekick.pro
