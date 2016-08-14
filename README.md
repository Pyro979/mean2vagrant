# mean2vagrant

This project is an attempt to have a one-click setup for a MEAN stack with Angular2 on a virtual machine under a Windows environment (parts can likely be re-used under other OSes).

## Why?
I wanted to start writing an app in Angular2, with a MEAN like back-end, but ran into some issues getting my environment setup. Inspired by [this post](http://thejackalofjavascript.com/vagrant-mean-box/), I decided to get this environment setup in a virtual machine. This took me weeks (granted only a few hours per day), because of little issues with the various moving parts. Since it was such a pain I decided to clean it up a bit once it was working and setup this repo, so that others could use this as well.

I chose to set it up on Ubuntu 14.04 so that i can spin up a box on [DigitalOcean (referral link)](https://m.do.co/c/d3f7d84d6b8e) and be able to easily setup the same kind of environment.

## Disclaimer
I'm a developer and so, am not proficient with Linux, Virtual Machines, Vagrant, nginx, etc. Before going to production, I suggest you find someone who is, and have them work on your setup for both performance and security. Also, if you break something, it's not my fault.

## Component Technologies
* Vagrant - To provision the virtual machine, and run the initial setup, as well as be able to run the VM locally when you need to use it.
* Oracle VM VirtualBox - Runs the actual VM (you can set this up with VMWare as well, but VirtualBox is free).
* Ubuntu 14.4 - The OS under which we will run the environment. Chosen specifically to match a DigitalOcean box.
* Node, Express, Mongo (with Mongoose) - back end server. This can be modified to your needs. I chose this setup because it seemed like what I would need, but feel free to modify for your needs (PostgreSQL, MySQL, completely different backend, etc..)
* Angular2 + Webpack based on AngularClass' [Angular 2 Starter kit](https://github.com/AngularClass/angular2-webpack-starter)
    * An Angular 2 Starter kit featuring Angular 2 (Router, Http, Forms, Services, Tests, E2E, Dev/Prod, HMR, Async/Lazy Routes), Material Design, Karma, Protractor, Jasmine, Istanbul, TypeScript, TsLint, Codelyzer, Hot Module Replacement, @types, and Webpack by @AngularClass
* nginx - for allowing us to access the server by a domain name vs IP (in conjunction with a hosts entry)

## Quick Start

### Prerequisites
1. Install [Vagrant](https://www.vagrantup.com/downloads.html). If interested, read their [docs](https://www.vagrantup.com/docs/).
2. Install [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Install
3. Clone this repo to the directory where you will be running everything (e.g. C:\MEAN2VAGRANT\)
4. Run hosts.add.bat - this will add a hosts entry for www.mean2.dev pointing to the vagrant machine's IP (192.168.80.30)
5. Run **_vagrant.Up.bat** or **vagrant up** from command line.

If everything goes right (you may need to run **_vagrant.Reload.bat** or **vagrant reload**, after initial install), you should be able to hit [www.mean2.dev](http://www.mean2.dev) in the browser and see the Angular2 start page. Hit [www.mean2.dev/api/](http://www.mean2.dev/api/) to access Express.

## Want to improve this?
If you know anything about any of the underlying technologies that would improve this setup, feel free to reach out to me or just create a PR. That would be very much appreciated.

## More details

Access the code in **/app/server/** and **/app/client/**. **/app** is a shared folder, accessible in the VM at **/vagrant/app/**. You can access the VM either by using the VirtualBox interface (username: vagrant, password: vagrant) or just by running **_vagrant.SSH.bat**

**nginx.conf** in the main direcory is the nginx configuration file. It will get updated in the VM everytime you run **vagrant up**. If you make changes while the machine is running and you want them applied, run **nginx.UpdateReload.bat**.

**_urlResources** - contains some links I used during this whole process.

**Vagrantfile** contains all the vagrant configuration. It contains some comments about what it's doing.

There is a number of files that run during the provisioning, as well as one file that runs everytime the server gets run:
* **setup.10.base.ps** - Updates Ubuntu and gets git
* **setup.15.nginx.sh** - Installs nginx
* **setup.20.nvm.sh** - Installs NVM (node version manager), NPM (node package manager), and the latest Node
* **setup.40.ServerSide.sh** - Express, Mongo, Mongooose install based on [this post](https://www.airpair.com/javascript/complete-expressjs-nodejs-mongodb-crud-skeleton) - check it out, it's a good read.
* **setup.50.ClientSide.sh** - [Angular 2 Starter kit](https://github.com/AngularClass/angular2-webpack-starter). Had some issues with this, but it seems to work.
* **setup.runServers.sh** (will always run) - update nginx.conf. Used to run servers, but that's separated now.

## _vagrant.runServers.bat
This can run separatly if the servers is already up, but will also run when running _vagrant.DestroyAndUp.bat, _vagrant.Reload.bat or _vagrant.Up.bat. You can stop the window, and rerun it to restart both the backend and the frontend servers.

* Run express server (using **[forever](https://github.com/foreverjs/forever)**)
* Run the angular+webpack server (with hot module replacement; not currently using **forever** because of some issues)