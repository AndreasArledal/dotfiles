#!/usr/bin/env bash

# Make sure we have all the beers that would impress even the average SOFO hipster
brew update

# Also make sure that the current bottles and cans are chilled
brew upgrade --all

# Let's select some bottles from behind the bar
brew tap thoughtbot/formulae
brew install rcm

brew install fasd
brew install tmux

# After party cleanup...
brew cleanup

