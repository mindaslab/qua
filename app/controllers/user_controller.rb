class UserController < ApplicationController
  def profile
  end

  def questions
    @questions = current_user.questions.order('created_at desc').paginate(:page => params[:page], :per_page => 50)
  end

  def answers
    @answers = current_user.answers.order('created_at desc').paginate(:page => params[:page], :per_page => 20)
  end

  def tags
  end
end
