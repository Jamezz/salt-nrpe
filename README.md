salt-nrpe
==========

Salt formula to set up and configure [nrpe](http://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details)

Parameters
------------
Please refer to example.pillar.sls for a list of available pillar configuration options

Usage
-----
Apply state 'nrpe.server.install' to install nrpe server to target minions
Apply state 'nrpe.client.install' to install nrpe client to target minions
Apply state 'nrpe.purge' to remove all nrpe packages and configuration from target minions
State 'nrpe' is provided as an alias for nrpe.server.install + nrpe.client.install

Compatibility
-------------
Ubuntu 13.10, 14.04 and CentOS 6.x
