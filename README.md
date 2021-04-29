# Software Version

[![Build Status](https://travis-ci.org/Cyberwatch/sofware-version.svg?branch=master)](https://travis-ci.org/Cyberwatch/sofware-version)

## Description

Compare two software versions with the full pattern for Linux Packages (Centos, Redhat, Arch, Debian Ubuntu) and Windows Applications

## Install

```
gem 'software_version', git: 'https://github.com/Cyberwatch/software-version.git'
```

## Usage

```
SoftwareVersion::Version.new('6:1.5.0-ubuntu1.2~release1804') < SoftwareVersion::Version.new('6:1.5.0-ubuntu1.4~release1804')  
```

## Requirements

- Ruby >= 2.6

## Test

Run :

```
rspec spec/
```

Pacman sort commande line

```sh
cat spec/fixtures/pacman_version.txt | sort | sort --version-sort > spec/fixtures/pacman_version_sort.txt
```

## Note on Patches & Pull Requests

Pull Request are very welcome. Please fork the project, make your feature addition or bug fix
and send a pull request.

## Copyright

Copyright (c) 2018 Florian Wininger. See LICENSE for details.
Copyright (c) 2019 Cyberwatch. See LICENSE for details.
