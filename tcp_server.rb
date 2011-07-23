# -*- coding: utf-8 -*-
require 'socket'
server = TCPServer.new(12345)
while client = server.accept
  msg = client.readline
  client.write "You said: #{msg}"
  client.close
end

