class PdfController < ApplicationController
  
  def create
    book = Book.find_by_url params[:url]
    
    file_name = "public/pdfs/#{book.url}.pdf"
    
    Prawn::Document.generate(file_name) do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      text book.text
    end
    
    send_file file_name, :type => 'application/pdf'
  end
  
end
