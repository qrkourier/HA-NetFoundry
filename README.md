# Home Assistant Add-on: NetFoundry OpenZITI

![Supports aarch64 Architecture][aarch64-shield]

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Find the "NetFoundry OpenZITI" add-on and click it.
3. Click on the "INSTALL" button.

PLEASE NOTE: The install and build process can take around 5 minutes to complete (on RPi).  During this time it may seem like the addon is not installing. Do not navigate away from the installation in the UI.

## How to Use

Regardless of which system controls the endpoint (CloudZITI or OpenZITI) the endpoint must be registered as a valid identity.  If you wish to try out the FREE TEAMS EDITION of CloudZITI, sign up at [CloudZITI](https://nfconsole.io/signup).  

1. Clone and build your own OpenZITI network with [OpenZITI](https://github.com/openziti) or sign up for free to the [CloudZITI](https://nfconsole.io/signup) which automatically deploys all elements for you.  
2. Follow instructions within your chosen path to create a new endpoint (identity) for your Home Assistant.
3. A JWT (Java Web Token) is the output of endpoint creation.  This is a plain ASCII text file generated by your ZITI controller. You will need to copy the text within the JWT file and paste it exactly into the Home Assistant's NetFoundry OpenZITI addon configuration pane "Enrollment JWT" field.
4. Once successfully registered after the application is started (Check Logs), you may remove the JWT text from the field.

You may register more than one identity (once per application startup) if desired, however, at least one identity is required to run.  YES, you CAN enable your Home Assistant to participate as an identity in multiple networks!

For more information, see the open source project page at [OpenZITI](https://github.com/openziti).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
