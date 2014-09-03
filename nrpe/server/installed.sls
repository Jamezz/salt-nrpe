include:
  - nrpe.plugins.installed

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

nrpe.server.installed:
  pkg.{{ 'latest' if server.upgrade else 'installed' }}:
    - name: {{ server.package }}
{% if server.service.manage %}
  service.{{ 'running' if server.service.enable else 'dead' }}:
    - name: {{ server.service.name }}
    - require:
      - pkg: nrpe.server.installed
  {% if server.config.manage %}
      - file: nrpe.server.installed
  {% endif %}
      - file: nrpe.plugins.installed
    - watch:
      - pkg: nrpe.server.installed
  {% if server.config.manage %}
      - file: nrpe.server.installed
  {% endif %}
      - file: nrpe.plugins.installed
{% endif %}
{% if server.config.manage %}
  file.managed:
    - name: {{ server.config.name }}
    - source: {{ server.config.source }}
    - template: jinja
{% endif %}
  require:
    - sls: nrpe.plugins.installed
