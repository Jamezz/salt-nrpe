{% from "nrpe/map.jinja" import nrpe with context %}

{% set client = {
  'package': nrpe.client.package, 
  'upgrade': salt['pillar.get']('nrpe:client:upgrade', False),
} %}

nrpe.client.purged:
  pkg.purged:
    - name: {{ client.package }}
