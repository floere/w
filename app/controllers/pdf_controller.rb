class PdfController < ApplicationController
  
  def create
    book = Book.find_by_url params[:url]
    
    file_name = "public/pdfs/#{book.url}.pdf"
    
    pdf = self
    Prawn::Document.generate(file_name) do
      # "Bookman Old Style", "Serifa BT", "URW Bookman L", "itc bookman", times, serif
      font "#{Prawn::BASEDIR}/data/fonts/Dustismo_Roman.ttf"
      
      # title
      pad_top 300 do
        horizontal_rule
        h1 book.title
        horizontal_rule
      end
      pad_top 10 do
        text book.subtitle, :align => :center, :size => 20.8
      end
      pad_top 10 do
        text 'by', :align => :center
      end
      pad_top 10 do
        text book.author, :align => :center, :size => 17.6
      end
      
      # content
      start_new_page
      text_options.update :align => :left, :size => 15
      text book.text
      
      # end
      start_new_page
      text_options.update :align => :center, :size => 20.8
      pad_top 350 do
        text 'The End'
        text '❦'
      end
    end
    
    send_file file_name, :type => 'application/pdf'
  end
  
end
