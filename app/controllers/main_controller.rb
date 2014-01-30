class MainController < ApplicationController
  def company_home
    @companies = Company.order("updated_at DESC")
  end
  
  def task_home
  end
  
  def project_home
    render :layout => 'projects'
  end
  
  def project_detail
    gon.project= Project.find(params[:id])
  end
  
  def pdf_watermark
    src_filename   = "#{Rails.root}/pdfs/test.pdf"
    dest_filename  = "#{Rails.root}/pdfs/watermark.pdf"
  
    reader = PDF::Reader.new(src_filename)
    page_count = reader.page_count
    
    Prawn::Document.generate(dest_filename, :skip_page_creation => true) do |pdf|
      page_count.times do |page_number|
        pdf.start_new_page(:template => src_filename, :template_page => page_number+1)

        if page_number == 0
          pdf.text "                 Sales information"
          pdf.text "                 Name: " + params[:name]
          pdf.text "                 Company: " + params[:company_name]
          pdf.text "                 Description: " + params[:description]
        end
        
        pdf.rotate(45, :origin => [200,200]) do
          pdf.draw_text "OCEANTIMEMARINE.COM SPECIFIC SALES DOCUMENT IN #{Time.now}", :size => 20, :at => [30, 255]
        end        
      end
    end
    
    send_file(dest_filename, :filename => "watermark_result.pdf")
    #render :text=>"OK"
  end
  
  def sales_input
    render :layout => "test"
  end
  
end
