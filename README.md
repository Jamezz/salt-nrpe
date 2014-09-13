salt-nrpe
==========

Salt formula to set up and configure [nrpe](http://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details)

Parameters
------------
Please refer to example.pillar.sls for a list of available pillar configuration options

Usage
-----
- Apply state 'nrpe.server.installed' to install nrpe server to target minions
- Apply state 'nrpe.client.installed' to install nrpe client to target minions
- Apply state 'nrpe.server.purged' to remove nrpe server packages and configuration from target minions
- Apply state 'nrpe.server.purged' to remove nrpe client packages and configuration from target minions
- State 'nrpe.installed' is provided as an alias for nrpe.server.installed
- State 'nrpe.purged' is provided as an alias for nrpe.server.purged
- State 'nrpe' is provided as an alias for nrpe.installed

Compatibility
-------------
Ubuntu 13.10, 14.04 and CentOS 6.x
