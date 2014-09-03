include:
  - nrpe.server.purged
  - nrpe.plugins.purged

nrpe:
  require:
    - sls: nrpe.server.purged
    - sls: nrpe.plugins.purged
