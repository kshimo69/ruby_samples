# -*- coding: utf-8 -*-
require 'socket'
include Socket::Constants
socket = Socket.new(AF_INET, SOCK_STREAM, 0)
sockaddr = Socket.pack_sockaddr_in(12345, 'localhost')
socket.connect(sockaddr)
socket.puts "Hello from script 2."
puts "The server said, '#{socket.readline.chomp}'"
socket.close
