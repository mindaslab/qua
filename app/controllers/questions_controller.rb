class QuestionsController < ApplicationController
  
  before_filter :get_ransak_object
  before_filter :authenticate_user!, :only=>[:new, :edit, :create, :update, :destroy]
  before_filter :question_must_belong_to_user, :except=>[:index, :show, :new, :create, :search]
  # GET /questions
  # GET /questions.json  
  def index
    @questions = Question.order('created_at desc').paginate(:page => params[:page], :per_page => 50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
  
  def search
    @questions = @q.result.paginate(:page => params[:page], :per_page => 50)
  end
  
  private
  def question_must_belong_to_user
    @question = Question.find(params[:id])
    redirect_to(@question, notice: "You cannot edit this question") if(@question.user != current_user)
  end
  
  def get_ransak_object
    @q = Question.search(params[:q])
  end
end
