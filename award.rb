require 'pry'
SPECIAL_AWARDS = ["Blue Compare", "Blue First", "Blue Distinction Plus"]

Award = Struct.new(:name, :expires_in, :quality) do 
  def special? 
    SPECIAL_AWARDS.include?(name)
  end

  def finalize 
    handle_boundaries 
    advance_expiration_date
  end

  def handle_boundaries
    return if self.name == "Blue Distinction Plus"

    if self.quality > 50 
      self.quality = 50
    elsif self.quality < 0
      self.quality = 0 
    end
  end

  def advance_expiration_date
    self.expires_in -= 1 unless self.name == "Blue Distinction Plus"
  end
end
