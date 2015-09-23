## MQTT over WebSocket

### Start server

```shell
npm install
./node_modules/mosca/bin/mosca -v --http-port 3000 --http-bundle --http-static ./
```

### Start client

```shell
bundle install --path .bundle
bundle exec ruby ws_clients.rb
```
