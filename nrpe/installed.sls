include:
  - nrpe.server.installed

nrpe.installed:
  require:
    - sls: nrpe.server.installed
