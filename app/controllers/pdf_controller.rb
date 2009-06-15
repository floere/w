class PdfController < ApplicationController
  
  def create
    book = Book.find_by_url params[:url]
    
    file_name = "public/pdfs/#{book.url}.pdf"
    
    pdf = self
    Prawn::Document.generate(file_name) do
      # "Bookman Old Style", "Serifa BT", "URW Bookman L", "itc bookman", times, serif
      font "#{Prawn::BASEDIR}/data/fonts/Dustismo_Roman.ttf"
      
      h1 book.title
      text book.subtitle, :align => :center, :size => 20.8
      text 'by', :align => :center
      text book.author, :align => :center, :size => 17.6
      
      text_options.update :align => :left
      text book.text
      
      text_options.update :align => :center
      text 'The End'
      text '❦'
    end
    
    send_file file_name, :type => 'application/pdf'
  end
  
end
