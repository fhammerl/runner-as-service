# Installing the actions runner as a service on a linux container

This repo was created to test out the actions runner on a linux container and to explore why it doesn't work.

Start your container with this command: (replace the two environment variables):

```bash
docker build . -t svc-run

docker run -e 'RUNNER_CFG_PAT=ghp_yourpat' -e RUNNER_REPOSITORY='yourorg/yourrepo' -it svc-run /bin/bash
```

It will download the runner, configure it successfully, but fail to register it as a service:

```
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down
Failed: failed to reload daemons
```

(This Stack Overflow link)[https://stackoverflow.com/questions/59466250/docker-system-has-not-been-booted-with-systemd-as-init-system] explains that systemd does not work on unprivileged containers. And since privileged containers have _root capabilities to all devices on the host system_, it's not feasible for most users.