class AnswersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_qua, :except=>[:create]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    redirect_to question_path(@question)
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
  
  private
  def find_qua
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end    
end
