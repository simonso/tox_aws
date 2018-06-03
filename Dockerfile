FROM phusion/baseimage:0.9.22
CMD ["/sbin/my_init"]
CMD ["rm", "-f", "/etc/service/sshd/down"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get install -y wget htop git bzip2

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH /miniconda/bin:$PATH

RUN conda install -c conda-forge flask
RUN conda install -c anaconda protobuf

RUN mkdir tox_aws 
ADD . /tox_aws
WORKDIR tox_aws 

EXPOSE 8888

RUN ["python", "setup.py", "install"]

ENTRYPOINT ["python"]
CMD ["deploy/servers/server.py"]
