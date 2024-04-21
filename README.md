## deployed-oscript-template
This is an example and template to create InterSystems package manager modules in deployed mode - without source code.

Learn more on deployed mode here.

## Try Deployed Package

Open IRIS terminal and install:

USER>zpm "install deployed-oscript-template"
Module will install two classes:
dc.deployed.ObjectScript and dc.withsource.ObjectScript

To test them run:
```objectscript
USER>Do ##class(dc.deployed.ObjectScript).Test()
```
and then
```objectscript
USER>Do ##class(dc.withsource.ObjectScript).Test()
```
you can check the source code with the following commands:
first deploed mode:
```objectscript
k text do ##class(%Compiler.UDL.TextServices).GetTextAsString($namespace, "dc.deployed.ObjectScript", .text) w text
```
and with source code:
```objectscript
k text do ##class(%Compiler.UDL.TextServices).GetTextAsString($namespace, "dc.withsource.ObjectScript", .text) w text
```


But if you check the source code you'll see it only for dc.withsource.ObjectScript, but dc.deployed.ObjectScript will contain only the signatures of class and methods.

## How It Works?

To make class package or a particlular class being published in registry as deploeyed include Deploy="true" element in a resource. Example.
So when you will publish the package it will be published in a deployed mode.

## what is the idea?

The idea is to be able working with a source code in your repository and publish packages for commercial usage without source code in a deployed mode.
This template illustrates the approach.

When you use load command e.g. to load package into IRIS it loads it with source code. So publish and install command work with a deployed mode.

The workflow looks as following:
use load command to import source code into the development environment
use publish command once module is ready for release to be published in a deployed mode.
users install module without source code using install command.




## What's in?

The module contains two classes:
dc.deployed.ObjectScript and dc.withsource.ObjectScript

# Development environment

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## How to develop with template

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/intersystems-community/objectscript-docker-template.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Open IRIS terminal:

```objectscript
$ docker-compose exec iris iris session iris
USER>write ##class(dc.deployed.ObjectScript).Test()
```
## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.
![docker_compose](https://user-images.githubusercontent.com/2781759/76656929-0f2e5700-6547-11ea-9cc9-486a5641c51d.gif)

