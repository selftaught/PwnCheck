# PwnCheck

PwnCheck is a command line utility for querying Have I Been Pwned's
API to determine if an email address or a password has been pwned. 
This script implements HIBP API V3.

[![Build Status](https://travis-ci.com/selftaught/PwnCheck.svg?token=Tx7EAKup6EXJbMTwywxS&branch=main)](https://travis-ci.com/selftaught/PwnCheck)

## Installation

To run `pwncheck`, first install the required dependencies

    cpanm --quiet --installdeps --notest .

## Options

     -h, --help
     -d, --data-classes                  prints out a list of data classes
     -p, --password-status   <password>  checks if the password has been pwned
    -ab, --account-breaches  <account>   print a list of breaches found for the account
    -ap, --account-pastes    <account>   print a list of pastes found for the account
    -bs, --breached-site     <site>      print breach details about a specific site
    -bS, --breached-sites                print a list of all known site breaches

## Examples

    ./pwncheck --help
    ./pwncheck --password-status  passw0rd
    ./pwncheck --breached-site    adobe
    ./pwncheck --pastes           your@email.com
    ./pwncheck --breaches         your@email.com
    ./pwncheck --breached-sites
    ./pwncheck --data-classes

## HIBP API key

Some of the HIBP API endpoints require an API key. You can set this with the env var `HIBP_API_KEY=...`.

## Running with Docker

Build the docker image:
```docker build -t pwncheck .```

Run the image
```docker run -it --rm -e HIBP_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx pwncheck -h```

## Development

### Branching

`git checkout main && git pull && git checkout -b feature`

### Unit tests

`prove -v ./t`

