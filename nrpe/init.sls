include:
  - nrpe.server.installed
  - nepr.client.installed

nrpe:
  require:
    - sls: nrpe.server.installed
    - sls: nrpe.client.installed
