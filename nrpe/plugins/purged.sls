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

nrpe.plugins.purged:
  pkg.purged:
    - name: {{ plugins.package }}
{% if plugins.config.manage %}
  file.absent:
    - name: {{ plugins.config.name }}
{% endif %}
