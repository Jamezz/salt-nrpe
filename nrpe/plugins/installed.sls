{% from "nrpe/map.jinja" import nrpe with context %}

{% set plugins = {
  'package': nrpe.plugins.package,
  'upgrade': salt['pillar.get']('nrpe:plugins:upgrade', False),
  'config': {
    'manage': salt['pillar.get']('nrpe:plugins:config:manage', False), 
    'name': nrpe.server.includedir ~ '/plugins.cfg',
    },
} %}

nrpe.plugins.installed:
  pkg.{{ 'latest' if plugins.upgrade else 'installed' }}:
    - name: {{ plugins.package }}
{% if plugins.config.manage %}
  file.managed:
    - name: {{ plugins.config.name }}
    - contents_pillar: nrpe:plugins:config:contents
{% endif %}
