require 'socket'
require_relative '../io_client'
class Client
  attr_accessor :socket, :port
  def initialize(port = 2002)
    @port = port
    @socket = TCPSocket.open('localhost', port)
  end

  def download
    while line = @socket.gets
      puts line.chop
    end
  end

  def upload(path)
    IoClient.read(path)
  end

  def message(str)
    @socket.puts str
  end

  private

  def close
    @socket.close
    @socket = nil
  end

  def repopen
    @socket = TCPSocket.open('localhost', port)
  end
end
