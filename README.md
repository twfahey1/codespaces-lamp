# codespaces-lamp
A template for Codespaces + LAMP stack for running Wordpress / Drupal / PHP apps.

This template provides a basic LAMP setup within a Codespace environment. It can be tweaked as needed through the Dockerfile, and other commands can easily be added as needed.

## How to use
- From a Drupal / WP Repo, clone this repo into `.devcontainer`, and then you can decouple it from this repository by removing the git folder - `git clone https://github.com/twfahey1/codespaces-lamp.git .devcontainer && rm -rf .devcontainer/.git`
- The `init-codespace.sh` script has most of the logic involved in setting up Apache and MySQL, among other tasks.

## Built in commands
- There are some built in commands for working with Pantheon platform, all prefixed with `pantheon-`. From the Codespace terminal, simply type `pantheon` and hit tab a couple times to see the available options.

## Troubleshooting
- Many times, things can be resolved by restarting the Apache / MySQL services - there is a helper command that is added to the `PATH` - `repair-codespaces` - Which will essentially just invoke the `init-codespace.sh` script to reboot and reload everything.
