require 'socket'
require 'byebug'
class Server
  attr_accessor :socket, :port, :clients
  def initialize(port = 2002)
    @port = port
    @socket = TCPServer.open(port)
    @clients = {}
  end

  def listen
    loop do
      Thread.start(socket.accept) do |client|
        @clients << client
        client.puts "Hello !"
        client.puts "Time is #{Time.now}"
        while x = client.gets
          puts x
        end
        client.close
      end
    end
  end

  def message(str)
    @clients.first.puts str
  end

  private

  def close
    @socket.close
    @socket = nil
  end

  def reopen
    @socket = TCPServer.open(port)
  end
end
