class String
  
  def words
    n = 0
    scan(/\b\S+\b/) { n += 1 }
    n
  end 
  
end
