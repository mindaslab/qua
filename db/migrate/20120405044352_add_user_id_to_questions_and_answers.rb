class AddUserIdToQuestionsAndAnswers < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
    
    # now assigning columans as index
    add_index :questions, :user_id
    add_index :answers, :user_id
  end
end
