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
  elsif @award.name == "Blue First"
    update_blue_first
  end
end

def update_blue_first 
  if @award.expires_in <=0 
    @award.quality += 2
  else 
    @award.quality += 1
  end
end

def update_blue_compare
  if @award.expires_in <= 0 
    @award.quality = 0 
  elsif @award.expires_in <= 5
    @award.quality += 3
  elsif @award.expires_in <= 10
    @award.quality += 2
  else 
    @award.quality += 1
  end
end

def negative_multiplier 
  return 4 if @award.expires_in <= 0 && @award.name == "Blue Star"
  return 2 if @award.expires_in <= 0 || @award.name == "Blue Star"

  1
end

