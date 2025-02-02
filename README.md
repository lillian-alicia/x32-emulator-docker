# X32 Emulator Docker
A docker container running Patrick-Gilles Maillot's [X-32 Emulator](https://github.com/pmaillot/X32-Behringer), used for development and testing code for the Behringer X-32 mixing desk.

## Original Project
The X32 Emulator was created by Patrick-Gilles Maillot, and can be found on their [github](https://github.com/pmaillot/X32-Behringer), or their [website](https://sites.google.com/site/patrickmaillot/x32). The emulator is hosted on port `10023`.

## Example Compose
``` yaml
services:
    x32-emulator:
        image: ghcr.io/lillian-alicia/x32-emulator-docker
        network_mode: host

        environment:
            X32_IP: xxx.xxx.xxx.xxx # The IP Address to host the X32 Emulator on.
        
        restart: always
```

## Environment
- `X32_IP` - An environment variable providing the IP address to host the emulator on. If left blank, the emulator will attempt to determine its own IP address, although I have not found this to be reliable when running through docker.

