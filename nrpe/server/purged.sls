include:
  - nrpe.plugins.purged

{% from "nrpe/map.jinja" import nrpe with context %}

{% set server = {
  'package': nrpe.server.package,
  'upgrade': salt['pillar.get']('nrpe:server:upgrade', False),
  'config': {
    'manage': salt['pillar.get']('nrpe:server:config:manage', False), 
    'name': nrpe.server.config,
    'source': salt['pillar.get']('nrpe:server:config:source', 'salt://nrpe/conf/nrpe.cfg'),
    },
} %}

nrpe.server.purged:
  pkg.purged:
    - name: {{ server.package }}
{% if server.config.manage %}
  file.absent:
    - name: {{ server.config.name }}
{% endif %}
