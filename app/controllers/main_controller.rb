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
    project= Project.find(params[:id])
    gon.project = project.as_json(:include => :project_tasks)
    gon.tasks = Task.all.as_json
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
    ayah = AYAH::Integration.new(77b6a5f210c4459b4571d0c91f351d0e5d1c1e50, a534f43e309a3cf9ae57bccc773413277a7703df)
    @publisher_html = ayah.get_publisher_html
    render :layout => "test"
  end
  
end
