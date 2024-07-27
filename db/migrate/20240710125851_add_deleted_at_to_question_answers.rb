class AddDeletedAtToQuestionAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :question_answers, :deleted_at, :datetime
    add_index :question_answers, :deleted_at
  end
end
