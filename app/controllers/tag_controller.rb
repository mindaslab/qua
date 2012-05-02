class TagController < ApplicationController
  def questions
    begin
      @tag = Tag.find_by_name(params[:name])
      @questions = @tag.questions.paginate(:page => params[:page], :per_page => 50)
    rescue
      redirect_to questions_path, notice: "Sorry the opage you requested seems not to exist"
    end
  end
  
  def search
    @tags = Tag.where("name like ? ", "#{params[:s].downcase}%").order(:name).limit(50)
    render :layout => false
  end
end
