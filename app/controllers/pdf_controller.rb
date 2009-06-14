class PdfController < ApplicationController
  
  def create
    book = Book.find_by_url params[:url]
    
    file_name = "public/pdfs/#{book.url}.pdf"
    
    Prawn::Document.generate(file_name) do
      # "Bookman Old Style", "Serifa BT", "URW Bookman L", "itc bookman", times, serif
      font "#{Prawn::BASEDIR}/data/fonts/Dustismo_Roman.ttf"
      text book.title
      text book.subtitle
      text 'by'
      text book.author
      text book.text
    end
    
    send_file file_name, :type => 'application/pdf'
  end
  
end
