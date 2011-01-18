module Destiny
  def Dice value
    rolls = []
    
    case value
      when /^(\d+)[dD](\d+)$/             # 2d6
        $1.to_i.times { rolls.push 1 + rand($2.to_i) }
        rolls.sum
        
      when /^(\d+)[dD](\d+)\+(\d+)$/      # 2d6+1
        $1.to_i.times { rolls.push 1 + rand($2.to_i) }
        rolls.sum + 1
        
      when /^(\d+)[dD]\((\d+)\+(\d+)\)$/  # 2d(6+1)
        $1.to_i.times { rolls.push 1 + rand($2.to_i) + $3.to_i }
        rolls.sum
        
      else
        raise ArgumentError, "Unknown value format."
      
    end 
  end
end