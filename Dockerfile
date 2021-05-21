FROM perl:5.24

ADD . /code

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssl libssl-dev

WORKDIR /code

RUN cpanm --quiet --installdeps --notest .
RUN make && make install
RUN ln -s /code/pwncheck /usr/bin/pwncheck