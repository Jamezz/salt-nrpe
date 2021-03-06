nrpe:
  server:
    package:
      upgrade: False
    service:
      manage: False
      enable: True
    config:
      manage: False
      source: salt://nrpe/conf/server.cfg
      port: 5666
      group: 'nagios'
      allowedhosts: '127.0.0.1',
      dbn: False
      debug: False
      commandtimeout: 60
      connectiontimeout: 300
  plugins:
    package:
      upgrade: False
    config: 
      manage: False
      contents: |

  lookup:
    plugins:
      package: nagios-plugins-all
    server:
      package: nrpe
      service: nrpe
