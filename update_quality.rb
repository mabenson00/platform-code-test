require 'award'
def update_awards(awards)
  awards.each do |award|
    update_award(award)
  end
end

def update_award(award)
  @award = award
  if @award.special?
    update_special_award_quality 
  else 
    update_normal_award_quality
  end 

  @award.finalize
end

def update_normal_award_quality
  @award.quality -= 1*negative_multiplier 
end

def update_special_award_quality 
  if @award.name == "Blue Compare"
    update_blue_compare
  elsif @award.name == "Blue Distinction Plus"
    update_blue_distinction
  end
end

def update_blue_compare
  if @award.expires_in <=0 
    @award.quality = 0 
  elsif @award.expires_in < 6
    @award.quality += 3
  elsif @award.expires_in < 11
    @award.quality += 2
  else 
    @award.quality += 1
  end
end

def update_blue_distinction
  # if @award.expires_in <=0 
  #   @award.quality = 80 
  # elsif @award.expires_in < 6
  #   @award.quality += 2
  # else 
  #   @award.quality += 1
  # end

end

def negative_multiplier 
  return 2 if @award.expires_in <= 0

  1
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