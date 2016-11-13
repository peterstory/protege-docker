# Docker Protégé

Runs the [Protégé](http://protege.stanford.edu) ontology tool in a Docker
container.

## Prerequisites

Your host system needs Docker and an X11 windowing system.

## Setup

Copy the `dot_env_example` file to `.env`. Then, fill in a root password of your
choice.

## Usage

If you're on a Mac, just double-click on the `run_protege.command` script. If
you're on Linux, just run the `run_protege.command` script from the
command-line. If you're on Windows, you'll have to start the Docker container,
then SSH with X11 forwarding.

When prompted, enter the root password that you chose earlier.

To load an ontology, first copy your ontology into the `docker_resources`
folder, which is mapped into the container. Then, within Protégé, navigate to
the `/root/protege/docker_resources` folder.

## Why does this exist?

I created this Docker configuration because the Protégé installation on my Mac somehow got corrupted, and I couldn't figure out how to fix it!
