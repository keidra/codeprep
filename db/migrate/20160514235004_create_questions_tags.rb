class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
