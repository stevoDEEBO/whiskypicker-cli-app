class WhiskyPicker::Whisky
  attr_accessor :name, :country, :region, :type, :proof, :description, :rating

  @@all = []

  def initialize(whisky_hash)
    whisky_hash.each {|key, value| self.send(("#{key}="), value)}
    @all << self
  end

  


end
