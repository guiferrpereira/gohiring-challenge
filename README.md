# GoHiring Documentation Bot

[![Build Status](https://secure.travis-ci.org/guiferrpereira/gohiring-challenge.svg?branch=master)](https://travis-ci.org/guiferrpereira/gohiring-challenge)
[![Code Climate](https://codeclimate.com/github/guiferrpereira/gohiring-challenge.svg)](https://codeclimate.com/github/guiferrpereira/gohiring-challenge)
[![Inline docs](http://inch-ci.org/github/guiferrpereira/gohiring-challenge.svg?branch=master)](http://inch-ci.org/github/guiferrpereira/gohiring-challenge)

The Slack Bot user understand commands from other users and provide documentation for Ruby Core/Standard library from the `ri` command line.

![Example of the bot being used](https://drive.google.com/uc?export=download&id=0B4ovQZZIXuzkTUtlRXhTVU9sS1U)

## Why?

GoHiring ask me for [this](CHALLENGE.md) challenge

## Installation

Documentation Bot requires Ruby version 2.3.1 installed with documentation enabled "RUBY_CONFIGURE_OPTS=--enable-install-doc". The `script/bootstrap` will try install [rbenv](https://github.com/rbenv/rbenv) if you don't have it.

Once Ruby has been installed `script/setup` will get documentation for all gems in system.

## Usage

To start the bot you must provide a Slack API token. This can be done through the `SLACK_API_TOKEN` environment variable.

Starting the documentation bot with:

`SLACK_API_TOKEN=xoxb-79712385281-123456789 script/server`

The bot will join your Slack team and wait for commands!



### Commands

Once the bot is running and has been invited to join a channel you can use it by giving it the name of one Ruby class or method you want to find `ri` documentation for. Assuming the bot's name is _rubydoc_, that would look like this: `@rubydoc: Array`

You can use the following commands:

`@rubydoc Array`

`@rubydoc please explain Array`

If you direct message bot:

`Array`

`please explain Array`

Bot understands `help` command, reminds you how to use bot.

## Tests

The project contains integration and unit tests written in RSpec, they can be run using:

`script/test`

### Code Coverage

This project's code coverage is checked using [SimpleCov](https://github.com/colszowka/simplecov).


## Development

[Read about development](ARCHITECTURE.md)
