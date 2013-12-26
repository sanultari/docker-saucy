FROM astral1/saucy:ppa
MAINTAINER Jiung Jeong <ethernuiel@sanultari.com> @astral1

RUN add-apt-repository ppa:saltstack/salt && apt-get update
RUN apt-get -y install python-support salt-minion
ADD ./salt-minion.sh /salt-minion.sh
ENTRYPOINT ["/salt-minion.sh"]
