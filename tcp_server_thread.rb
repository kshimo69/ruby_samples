# -*- coding: utf-8 -*-
require 'socket'
server = TCPServer.new(12345)
while true
  Thread.new(server.accept){ |client|
    msg = client.readline
    client.write "You said: #{msg}"
    client.close
  }
end

