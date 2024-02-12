require 'socket'

class Client
    def initialize(socket, username)
        @socket = socket
        @username = username
    end

    def sendMessage
        @socket.write("#{@username}\n")

        while !@socket.closed?
            message = gets.chomp
            @socket.write("#{@username}: #{message}\n")
        end
    end

    def listenForMessages
        Thread.new {
            while !@socket.closed?
                groupMessage = @socket.gets.chomp
                p groupMessage
            end
        }
    end
end

p 'Enter your username for the group chat'
username = gets.chomp
socket = TCPSocket.new 'host.docker.internal', 5300
client = Client.new(socket, username)
client.listenForMessages
client.sendMessage