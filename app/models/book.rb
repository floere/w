class Book < ActiveRecord::Base
  
  before_save :generate_url, :generate_size
  
  def generate_url
    self.url = urlify self.title
  end
  
  def generate_size
    self.size = self.text.words
  end
  
  def urlify title
    url = title.downcase
    url.gsub! /[\s']/, '-'
    url.gsub! /\?/, '-question-mark'
    url.gsub! /\!/, '-exclamation-mark'
    url.gsub! /\./, '-period'
    url.gsub! /\,/, '-comma'
    url
  end
  
end
