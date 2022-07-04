# pantheon-codespaces
A GitHub Codespaces setup for use with Pantheon.

[![Unofficial](https://img.shields.io/badge/Pantheon-Unofficial-yellow?logo=pantheon&color=FFDC28)](https://pantheon.io/docs/oss-support-levels#unofficial)

## Secret Configuration
- You can configure Secrets for individual Codespaces, and add Secrets that are org wide across all Codespaces. The following Secrets should be configured to ensure all functionality of pantheon-codespaces:

* `SSH_KEY` - A private SSH key that has a public equivalent added to your Pantheon profile under the "SSH" settings. Pro tip: You can bypass the SSH setup initially, and start up the pantheon-codespace first. We recommend using the PEM format for the key. When the Codespace loads, use the terminal to run `ssh-keygen -m PEM` and generate the SSH key pair on the Codespace itself. Once terminus is configured, you can use `terminus ssh-key:add ~/.ssh/path_to_key.pub` to add the public key to your Pantheon account. Then, use `cat ~/.ssh/path_to_key` to print out the private key, copy it from the terminal, and paste into the `SSH_KEY` Secret configuration in the repo Codespace Secret settings.

## Setup for an existing project.
- Assuming your project is in GitHub and you are configured to run Codespaces. For more information on this, see the Codespaces site regarding setting up Codespaces.
- Once the default Codespace loads up, open the main menu by clicking the icon in the top left. Go to View and click Terminal to open up the terminal. You can clone this repo into your project into the `.devcontainer` folder by typing `git clone [this repo url] .devcontainer`
- This *should* prompt a message allowing you to rebuild the Codespace, which will load the new container configuration defined in the `.devcontainer` folder. If it doesn't, hit `Cmd + Shift + P` to bring up the command pallete, and type "rebuild", and you should see the option to "Codespace: Rebuild Container" selected. Hit enter to kick off the rebuild.
- Once the Codespace loads back up, it should be ready to configure!

## Configuring the environment
- Simply type the shortcut command `pantheon-init` in the terminal to be prompted through some basic configuration for terminus.
- In the terminal, the terminus command line tool is preinstalled, as is composer.
- A `site-config.json` is created in the `src` folder through the `pantheon-init` process which keeps track of the Pantheon site environment associated with the Codespace and repo.

## Where to find, add, and customize terminal commands.
- The `PATH` is set in the container to include commands defined in the `.devcontainer/src/pantheon-commands` folder.

## Setting up Wordpress
- There is a script in the `pantheon-commands` directory called `pantheon-wp-search-replace` that should use the bash environment variables of the Codespace to provide a wp search-replace command. It uses the `site-config.json` in the `.devcontainer` folder to use as the "old" URL to replace with the "new" codespaces URL. So this assumes the flow of `pantheon-db-pull` to bring in the defined site DB, and then the search-replace can run subsequently to swap out the Codespace urls.

## Troubleshooting
- One simple method of troubleshooting is running the `repair-codespace` command in the terminal. This will run the `init-codespace.sh` script, ensuring the Codespace Apache and MySQL processes are running and configured properly.

# Devcontainer development notes
- You can use the Codespaces environment variables to write predictable scripts.
- For instance, to get a reference to the default workspace name - `/workspaces/$(echo $RepositoryName)`
