{% from "nrpe/map.jinja" import nrpe with context %}

{% set client = {
  'package': nrpe.client.package, 
  'upgrade': salt['pillar.get']('nrpe:client:upgrade', False),
} %}

nrpe.client.installed:
  pkg.{{ 'latest' if client.upgrade else 'installed' }}:
    - name: {{ client.package }}
