class AddCorrectAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :comment_id, :int
    remove_column :answers, :comment_type, :string
    remove_column :answers, :votes, :int
    add_column :answers, :correct, :boolean
  end
end
