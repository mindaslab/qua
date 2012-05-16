class AnswersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_qua, :except=>[:create, :show]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    @answer.user = current_user
    if @answer.save
      redirect_to question_answer_path(@question, @answer), notice: "Your answer has been saved successfully"
    else
      redirect_to :back, notice: "Failed saving answer, either has nothing or is too long"
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to @question, notice: "Answer Deleted"
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.update_attributes params[:answer]
    @answer.save
    redirect_to @question, notice: "Answer Updated"
  end
  
  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  
  private
  def find_qua
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    redirect_to :back, "You cannot edit this answer" if @answer.user != current_user
  end
  
end
