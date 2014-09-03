include:
  - nrpe.server.purged

nrpe:
  require:
    - sls: nrpe.server.purged
