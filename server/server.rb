require 'socket'
require_relative 'client_handler'

clients = []

server = TCPServer.new('0.0.0.0', 5300)
p 'Server initialized and waiting for client connections'

server.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, true)

begin
    while !server.closed?
        client_socket = server.accept
        Thread.new {
            ClientHandler.new(client_socket).run
        }
        p 'A new client has connected!'
    end
rescue => e
    p "Error: #{e.message}"
ensure
    server.close
end