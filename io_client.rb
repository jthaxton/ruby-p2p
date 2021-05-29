class IoClient
  def self.read(path)
    File.open(path)
      .readlines
      .map(&:chomp)
  end
end
