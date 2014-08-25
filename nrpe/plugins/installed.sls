{% from "nrpe/map.jinja" import nrpe with context %}

{% set plugins = {
  'package': nrpe.plugins.package,
  'upgrade': salt['pillar.get']('nrpe:plugins:upgrade', False),
  'config': {
    'manage': salt['pillar.get']('nrpe:plugins:config:manage', False), 
    'name': nrpe.plugins.config,
    'source': salt['pillar.get']('nrpe:plugins:config:source', 'salt://nrpe/conf/plugins.cfg'),
    },
} %}

nrpe.plugins.installed:
  pkg.{{ 'latest' if plugins.upgrade else 'installed' }}:
    - name: {{ plugins.package }}
{% if plugins.config.manage %}
  file.managed:
    - name: {{ plugins.config.name }}
    - source: {{ plugins.config.source }}
{% endif %}
