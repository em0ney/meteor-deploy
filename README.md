# Meteor-Deploy

This is a project to simplify the process of packaging, copying and deploying a meteor application between your PC and your VPS based environments.

## Overview

Deploying meteor applications can be bothersome.  On the server side, meteor is just a node application.  Currently, you need to bundle your meteor application, copy to your VPS, untar, rebuild fibers (how irritating), set some environment variables and then launch the app. These simple bash scripts automate this process.


## Usage

1. Alter common.conf in the root directory.
2. Alter props.conf in the client and server directories.
3. Copy the contents server directory and common.conf to your application root directory
4. Copy the contents of the client directory and common.conf to your development machine, to your meteor root directory
5. On the server side, make starter.sh executable `chmod 755 starter.sh`
6. Run `deploy.sh` to package and deploy your meteor app


## To Be Implemented
This project is still in development.  Here is a prospective wish-list, feel free to fork and contribute:

- Separate configurations for different environments
- Integration to setup nginx reverse proxy config for first deployment
