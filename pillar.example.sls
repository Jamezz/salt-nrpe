nrpe:
  server:
    upgrade: False
    plugins: 
      manage: False
    config:
      manage: False
      dbn: False
      source: salt://nrpe/conf/server.cfg
  client:
    upgrade: False
  plugins:
    upgrade: False
    config: 
      manage: False
      source: salt://nrpe/conf/plugins.cfg
  lookup:
    plugins:
      package: nagios-plugins-all
    client:
      package: nagios-plugins-nrpe
    server:
      package: nrpe
