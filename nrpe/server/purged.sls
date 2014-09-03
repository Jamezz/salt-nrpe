include:
  - nrpe.plugins.purged

{% from "nrpe/map.jinja" import nrpe with context %}

{% set server = {
  'package': nrpe.server.package,
  'upgrade': salt['pillar.get']('nrpe:server:package:upgrade', False),
  'config': {
    'manage': salt['pillar.get']('nrpe:server:config:manage', False), 
    'name': nrpe.server.config,
    'source': salt['pillar.get']('nrpe:server:config:source', 'salt://nrpe/conf/server.cfg'),
    },
  'service': {
    'name': nrpe.server.service,
    'manage': salt['pillar.get']('nrpe:server:service:manage', False), 
    'enable': salt['pillar.get']('nrpe:server:service:enable', True), 
  },
} %}

nrpe.server.purged:
  pkg.purged:
    - name: {{ server.package }}
{% if server.config.manage %}
  file.absent:
    - name: {{ server.config.name }}
{% endif %}
  require:
    - nrpe.plugins.purged
