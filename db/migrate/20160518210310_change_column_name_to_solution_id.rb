class ChangeColumnNameToSolutionId < ActiveRecord::Migration
  def change
  	rename_column :comments, :question_id, :solution_id
  end
end
