class ClientHandler
  @@client_handlers = []
  attr_reader :client_username, :socket

  def initialize(socket)
    @socket = socket
    @client_username = @socket.gets.chomp
    @@client_handlers << self
    broadcastMessage("SERVER: #{@client_username} has entered the chat!\n")
  end

  def run
    begin
      while !socket.closed?
        messageFromClient = @socket.gets
        broadcastMessage(messageFromClient)
      end
    rescue => e
      p "#{e.message}"
    end
  end

  def broadcastMessage(messageToSend)
    @@client_handlers.each do |client_handler|
      if client_handler.client_username != client_username
        client_handler.socket.write("#{messageToSend}")
      end
    end
  end
end
