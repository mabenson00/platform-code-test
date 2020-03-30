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



    # if award.name != 'Blue First' && award.name != 'Blue Compare'
    #   if award.quality > 0
    #     if award.name != 'Blue Distinction Plus'
    #       award.quality -= 1
    #     end
    #   end
    # else
    #   if award.quality < 50
    #     award.quality += 1
    #     if award.name == 'Blue Compare'
    #       if award.expires_in < 11
    #         if award.quality < 50
    #           award.quality += 1
    #         end
    #       end
    #       if award.expires_in < 6
    #         if award.quality < 50
    #           award.quality += 1
    #         end
    #       end
    #     end
    #   end
    # end
    # if award.name != 'Blue Distinction Plus'
    #   award.expires_in -= 1
    # end
    # if award.expires_in < 0
    #   if award.name != 'Blue First'
    #     if award.name != 'Blue Compare'
    #       if award.quality > 0
    #         if award.name != 'Blue Distinction Plus'
    #           award.quality -= 1
    #         end
    #       end
    #     else
    #       award.quality = award.quality - award.quality
    #     end
    #   else
    #     if award.quality < 50
    #       award.quality += 1
    #     end
    #   end
    # end
