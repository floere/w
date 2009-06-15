class Prawn::Document
  
  def h1 header
    text header, :align => :center, :size => 32
  end
  
end