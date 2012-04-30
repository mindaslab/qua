class CreateQuestionsTagsTable < ActiveRecord::Migration
  def up
    create_table(:questions_tags, :id=>false) do |t|
      t.integer :question_id
      t.integer :tag_id
    end
  end

  def down
    drop_table :questions_tags
  end
end
