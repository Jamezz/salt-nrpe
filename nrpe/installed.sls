include:
  - nrpe.server.installed
  - nrpe.plugins.installed

nrpe.installed:
  require:
    - sls: nrpe.server.installed
    - sls: nrpe.plugins.installed
