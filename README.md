# Open Peer Power Community Add-ons: Bashio

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

[![GitLab CI][gitlabci-shield]][gitlabci]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]

## About

Bashio is a bash function library for use with Open Peer Power add-ons.

It contains a set of commonly used operations and can be used
to be included in add-ons to reduce code duplication across add-ons and
therefore making it easier to develop and maintain add-ons.

Main goals:

- Reduce the number of operations needed in add-ons.
- Reduce the amount of code needed in add-ons.
- Make add-on code more readable.
- Providing a trusted and tested code base.

Quicker add-on development, by allowing you to focus on the add-on logic
instead of other things.

## Installation

The library is installed in the Open Peer Power Community Add-ons base images and
the official Open Peer Power base images.

Currently available base images:

- [Open Peer Power Community Add-ons Alpine Base Image][base-alpine]
- [Open Peer Power Community Add-ons Alpine Python Base Image][base-alpine-python]
- [Open Peer Power Community Add-ons Debian Base Image][base-debian]
- [Open Peer Power Community Add-ons Ubuntu Base Image][base-ubuntu]
- [Official Open Peer Power Alpine Docker Base Image][open-peer-power-base]
- [Official Open Peer Power Alpine Python Docker Base Image][open-peer-power-base]
- [Official Open Peer Power Debian Docker Base Image][open-peer-power-base]
- [Official Open Peer Power Raspbian Docker Base Image][open-peer-power-base]
- [Official Open Peer Power Ubuntu Docker Base Image][open-peer-power-base]

Using those images as the base for your Open Peer Power add-on will provide this
function library out of the box. Our base images are updated frequently and
provide the minimal needed base image for a great add-on.

If you want to add Bashio to your own images, please take a look at the
Dockerfile of the above base images to see how they are added at build time.

## Configuration

Configuring a Bash script to use the Bashio library is fairly easy. Simply
replace the shebang of your script file, from `bash` to `bashio`.

Before example:

```bash
#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

USERNAME=$(jq --raw-output '.username // empty' $CONFIG_PATH)

echo "${USERNAME}"
```

After example with Bashio:

```bash
#!/usr/bin/env bashio

USERNAME=$(bashio::config 'username')

bashio::log.info "${USERNAME}"
```

## Functions

Bashio has more than 250+ functions available: communicating with
the Supervisor API, Have I Been Pwned, file system, logging, configuration handling
and a lot more!

The best way to get around would be by looking at the different modules
available in the [`lib`](lib) folder. Each module has its own file, and each
function has been documented inside the codebase.

Furthermore, Bashio is used by the
[Open Peer Power Community Add-ons project][repository], those add-ons will be
a great resource of practical examples.

## Known issues and limitations

- Some parts of the Supervisor API are not implemented yet.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Open Peer Power Community Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

## License

MIT License

Copyright (c) 2019-2020 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[base-alpine-python]: https://github.com/oppio-addons/addon-base-python
[base-alpine]: https://github.com/oppio-addons/addon-base
[base-debian]: https://github.com/oppio-addons/addon-debian-base
[base-ubuntu]: https://github.com/oppio-addons/addon-ubuntu-base
[commits-shield]: https://img.shields.io/github/commit-activity/y/oppio-addons/bashio.svg
[commits]: https://github.com/oppio-addons/bashio/commits/master
[contributors]: https://github.com/oppio-addons/bashio/graphs/contributors
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/oppioaddons
[frenck]: https://github.com/frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[gitlabci-shield]: https://gitlab.com/oppio-addons/bashio/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/oppio-addons/bashio/pipelines
[open-peer-power-base]: https://github.com/open-peer-power/docker-base
[issue]: https://github.com/oppio-addons/bashio/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/oppio-addons/bashio.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[releases-shield]: https://img.shields.io/github/release/oppio-addons/bashio.svg
[releases]: https://github.com/oppio-addons/bashio/releases
[repository]: https://github.com/oppio-addons/repository
[semver]: http://semver.org/spec/v2.0.0
