[![CircleCI](https://circleci.com/gh/dcycle/doctl-utilities.svg?style=svg)](https://circleci.com/gh/dcycle/doctl-utilities)

Doctl Utilities
-----

[doctl](https://docs.digitalocean.com/reference/doctl/) is a command line to interact with a DigitalOcean account.

DigitalOcean allows for the creation of virtual machines (VMs).

This repo contains a script which allows for the destruction of DigitalOcean VMs.

Typical Usage
-----

You might be using a Jenkins server which has `doctl` installed.

For example, the [DcycleJenkins](https://github.com/dcycle/dcyclejenkins) is a Docker-based project which creates a functional Jenkins environment, including LetsEncrypt encryption, using the [Dcycle Jenkins Docker Image](https://github.com/dcycle/docker-jenkins), which itself has `doctl` installed.

You might be using that server to perform certain actions on new virtual machines which are spun up by `doctl`.

For example, the [Dcycle Jenkins Docker Image](https://github.com/dcycle/docker-jenkins) has a script called [./scripts/jenkins/build.sh](https://github.com/dcycle/docker-jenkins/blob/master/scripts/jenkins/build.sh) which requires the environment variables DIGITALOCEAN_ACCESS_TOKEN and DIGITALOCEAN_SSH_KEY (which is a fingerprint).

Your Jenkins server would then spin up a new VM on DigitalOcean, on which the Jenkins Image is built for both ARM and AMD chips -- Dcycle maintains a Jenkins server which does exactly that and then publishes the updated image, periodically, to [the Docker hub](https://hub.docker.com/r/dcycle/jenkins/tags).

After this build process, there will be a VM running which you will want to destroy to avoid incurring costs.

You might then have your Jenkins job call a downstream job called something like "delete VM", which uses the enclosed `./scripts/delete-vm.sh`:

    ./scripts/delete-vm.sh docker-jenkins

which will delete all images with the name docker-jenkins
