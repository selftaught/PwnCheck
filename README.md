# PwnCheck

PwnCheck is a command line utility for querying Have I Been Pwned's
API to determine if an email addresses or passwords have been pwned. 
This script implements HIBP API V3.

[![Build Status](https://travis-ci.com/selftaught/PwnCheck.svg?token=Tx7EAKup6EXJbMTwywxS&branch=main)](https://travis-ci.com/selftaught/PwnCheck)

## **Installation**

To run `pwncheck`, first install the required dependencies

    cpanm --quiet --installdeps --notest .

## **Usage**

### **Getting help from CLI**

    ./pwncheck --help

### **Password(s) check**

    ./pwncheck --password-status password
    ./pwncheck --password-status /home/dillan/documents/passwords.txt
    ./pwncheck --password-status https://pastebin.com/raw/Jx5X0xi2

### **Breached Site(s) check**

    ./pwncheck --breached-site adobe
    ./pwncheck --breached-site adobe,facebook

### **Paste(s) check**

    ./pwncheck --pastes selftaught@example.com
    ./pwncheck --pastes selftaught@example.com,dillan@example.com
    ./pwncheck --pastes /home/dillan/documents/emails.txt
    ./pwncheck --pastes https://pastebin.com/raw/1Zb807f5 

### **Breached account(s) check**

    ./pwncheck --breaches selftaught@example.com
    ./pwncheck --breaches selftaught@example.com,dillan@example.com
    ./pwncheck --breaches https://pastebin.com/raw/1Zb807f5

### **Get a list of HIBP data classes**

    ./pwncheck --data-classes

## Environment variables

 - `HIBP_API_KEY` required for some HIBP API endpoints
 - `JSON` set this env var to `1` to format output as JSON
 - `YAML` set this env var to `1` to format output as YAML
 - `PRETTY` set this env var to `1` to print output in pretty format
 - `RAW` set this env var to `1` to print output in raw format
  
## Running in Docker

```
docker build -t pwncheck .
docker run -it pwncheck ./pwncheck --help
```

## Contributing

1. Fork it
2. Create feature branch (`git checkout -b feature/adding-x-and-y`)
3. Make some changes...
4. Commit changes (`git commit -m '...'`)
5. Push changes to remote feature branch (`git push origin feature/adding-x-and-y`)
6. Create PR when feature branch is ready to merge


## License 

    The MIT License (MIT)

    Copyright (C) 2021 by Dillan Hildebrand

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.