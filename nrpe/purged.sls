include:
  - nrpe.server.purged
  - nrpe.client.purged

nrpe:
  require:
    - sls: nrpe.server.purged
    - sls: nrpe.client.purged
