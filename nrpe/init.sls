include:
  - nrpe.installed

nrpe:
  require:
    - sls: nrpe.installed
