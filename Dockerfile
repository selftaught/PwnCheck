FROM perl:5.24

ADD . /code

RUN apt-get update &&\
	apt-get install -y openssl libssl-dev &&\
	rm -rf /var/lib/apt/lists/*

WORKDIR /code

RUN cpanm --quiet --installdeps --notest .
RUN make && make install
RUN ln -s /code/pwncheck /usr/bin/pwncheck

ENTRYPOINT [ "/usr/bin/pwncheck" ]
