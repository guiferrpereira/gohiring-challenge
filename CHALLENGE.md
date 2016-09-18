# GoHiring Challenge: Slack Bot

Objective of the challenge is a Slack bot that anyone could ask for Ruby Core/Stdlib documentation. It is always awesome to talk to a robot. Isn't it? :wink:

## Specification

> 1. A robot may not injure a human being or, through inaction, allow a human being to come to harm.
> 2. A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.
> 3. A robot must protect its own existence as long as such protection does not conflict with the First or Second Laws.
>
> -- https://en.wikipedia.org/wiki/Three_Laws_of_Robotics



A Slack bot should be able to connect to a team on Slack using provided access token. It is not necessary to create a Slack app. A custom bot user is what you need to implement.

The bot user should understand commands from other users and provide documentation for Ruby Core/Standard library. It is up to you how these commands might look like, e.g.

```
# direct message command

> user [9:22 AM]
> Array#first

> docbot BOT [9:22 AM]
> # Array#first
> ...
```

or

```
# @-mention command

> user [9:22 AM]
> @docbot: Array#first

> docbot BOT [9:22 AM]
> # Array#first
> ...
```

or

```
# advanced command

> user [9:22 AM]
> @docbot: please explain Array#first

> docbot BOT [9:22 AM]
> # Array#first
> ...
```


In order to provide documentation the bot uses [`ri` CLI tool][ri] that comes with Ruby.

```shell
> ri Array#first
= Array#first

(from ruby core)
------------------------------------------------------------------------------
  ary.first     ->   obj or nil
  ary.first(n)  ->   new_ary

------------------------------------------------------------------------------

Returns the first element, or the first n elements, of the array. If the array
is empty, the first form returns nil, and the second form returns an empty
array. See also Array#last for the opposite effect.

  a = [ "q", "r", "s", "t" ]
  a.first     #=> "q"
  a.first(2)  #=> ["q", "r"]
```

It should be easy to communicate with the bot. In case of an error or unclear command the bot should respond in a good manner.

## Requirements

* The project should be written in Ruby
* You are not allowed to use Rails :wink:
* Provide a good README that explains all important details of your solution to the challenge. We would like to know why certain decisions were made (e.g. why you use specific gem or application server)
* Test your code. Minitest and RSpec work great for us :smile:

## Extra Points

* Automation scripts. You might consider the idea of using [normalized script pattern][normalized-scripts-pattern]
* Make use of environment variables to store configuration data. Please remember environment variables are your good friends :wink:
* Try to use as less external dependecies as possible, but keep healthy balance
* Code documentation. Self-documented code is a myth. It happens a lot when you understand *how* code does work, but do not understand *why* it was implemeted the way it is implemented. Good and appropriate documentation hurts no one

## Recommendations

* If you do not know which format to use for code documentation, you might consider [TomDoc][tomdoc]. It is very easy to understand and use
* Keep balance between features you would like to add to the bot and time you spend implementing everything. The purpose of the challenge to reveal your skills, not to implement [Skynet][skynet]

## How we evaluate your solution

When you are ready, please push your code to a public repo on GitHub and provide us a link. We will clone the repo and run your project locally. Then we will have fun talking to the bot :tada:

Please make sure it is easy to make everything running locally. You might consider a special section in the README that explains how to run the project. Also automated [`script/setup`][script-setup] might be very helpful in this case.

We will use our own Slack access token to configure the bot. So you do not need to provide one.

## Questions?

If you have any questions regarding the challenge, feel free to ask Alex (<alex@gohiring.com>).

[normalized-scripts-pattern]: https://github.com/github/scripts-to-rule-them-all#scripts-to-rule-them-all
[script-setup]: https://github.com/github/scripts-to-rule-them-all#scriptsetup
[ri]: http://www.jstorimer.com/blogs/workingwithcode/7766081-5-reasons-you-should-use-ri-to-read-ruby-documentation
[tomdoc]: http://tomdoc.org
[skynet]: https://en.wikipedia.org/wiki/Skynet_(Terminator)
