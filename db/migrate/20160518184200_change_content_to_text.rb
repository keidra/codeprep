class ChangeContentToText < ActiveRecord::Migration
  def change
  	change_column :questions, :content, :text, :limit => nil
  	change_column :solutions, :content, :text, :limit => nil
  end
end
