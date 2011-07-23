# -*- coding: utf-8 -*-
require 'socket'
server = TCPServer.new(12345)
clients = []
buffers = {}

while true
  sockets = [server] + clients
  readable, writable = IO.select(sockets)

  readable.each do |sock|
    begin
      if sock == server
        clients << server.accept_nonblock
      else
        client, buf = sock, buffers[sock] ||= ''

        buf << client.read_nonblock(1024)
        if buf =~ /^.+?\r?\n/
          client.write "You said: #{buf}"
          client.close

          buffers.delete(client)
          clients.delete(client)
        end
      end
    rescue Errno::EAGAIN, Errno::EWOULDBLOCK
      # socket would block, try again later
    end
  end
end
