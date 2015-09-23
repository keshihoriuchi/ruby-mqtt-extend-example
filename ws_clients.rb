require 'mqtt'
require 'websocketio'

class WebSocketMQTTClient < MQTT::Client
  def create_socket
    tcpsocket = TCPSocket.new('localhost', 3000)
    WebSocketIO::Client.new(tcpsocket,
                            { url: 'ws://localhost:3000' },
                            { write_type: :binary }
                           )
  end

  def peek
    true
  end
end

Thread.new do
  WebSocketMQTTClient.connect('localhost') do |c2|
    loop do
      sleep 0.5
      c2.publish 'test', 'message'
    end
  end
end

WebSocketMQTTClient.connect('localhost') do |c1|
  c1.get('test') do |t, m|
    p m
  end
end
