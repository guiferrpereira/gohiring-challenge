## ARCHITECTURE

### Gems Used

#### "slack-ruby-client"

I use this gem to provide me wrapper slack api, i think the propose of challenge wasn't to build the wrapper to the API. Ao i used the most used nowadays

#### "unicorn"

That's my favourite one along with Nginx works great at NDrive, we already try others e.g (puma) and notice some strange events on (NewRelic and Munin) performance charts.

#### "simplecov"

In order get code coverage i used simplecov. Scored: All Files (100.0% covered at 4.06 hits/line)

#### "rubocop"

A Ruby static code analyzer, based on the community Ruby style guide.

#### "yard"

Check my documentation coverage and get pretty html with it!

#### "rake"

Only for travis ci integration.


### External Services

#### Code Climate

Check my Code quality. provides nice badge

#### Inch CI

This project is an attempt to raise the visibility of documentation in Open Source.

#### Travis build

Every push repository tests will be executed  as well as rubocop and yard!


### Reformat Markdown
In requirements i checked that GoHiring as replaced `---` for `---------------------`. So i make some transformations in old markdown to slack markdown.
