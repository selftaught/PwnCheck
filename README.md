# PwnCheck

PwnCheck is a command line utility for querying Have I Been Pwned's
API to determine if an email addresses or passwords have been pwned. 
This script implements HIBP API V3.

[![Build Status](https://travis-ci.com/selftaught/PwnCheck.svg?token=Tx7EAKup6EXJbMTwywxS&branch=main)](https://travis-ci.com/selftaught/PwnCheck)
  
## Running in Docker

```
docker build -t pwncheck .
docker run -it --rm -e HIBP_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx pwncheck -h
```

## **Installation**

To run `pwncheck`, first install the required dependencies

    cpanm --quiet --installdeps --notest .

## **Usage**

### **Getting help from CLI**

    ./pwncheck --help

### **Password(s) check**

    ./pwncheck --password password
    ./pwncheck --password /home/selftaught/documents/pass-list.txt
    ./pwncheck --password https://pastebin.com/raw/Jx5X0xi2

### **Breached Site check**

    ./pwncheck --breached-site adobe

### **List Breached Sites**

    ./pwncheck --breached-sites

### **Paste(s) check**

    ./pwncheck --pastes test@example.com
    ./pwncheck --pastes /home/selftaught/documents/account-list.txt
    ./pwncheck --pastes https://pastebin.com/raw/MxRcjuyW

### **Breached account(s) check**

    ./pwncheck --breaches test@example.com
    ./pwncheck --breaches /home/selftaught/documents/account-list.txt
    ./pwncheck --breaches https://pastebin.com/raw/MxRcjuyW

### **Get a list of HIBP data classes**

    ./pwncheck --data-classes

## Environment variables

 - `HIBP_API_KEY` - required for `--breaches` and `--pastes` options


## Contributing

1. Fork it
2. Create feature branch (`git checkout -b feature/adding-x-and-y`)
3. Make some changes...
4. Commit changes (`git commit -m '...'`)
5. Push changes to remote feature branch (`git push origin feature/adding-x-and-y`)
6. Create PR when feature branch is ready for review

## License 

    The MIT License (MIT)

    Copyright (C) 2021 by Dillan Hildebrand

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
