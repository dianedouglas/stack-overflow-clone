class Polymorphism < ActiveRecord::Migration
  def change
    add_column :answers, :comment_id, :integer
    add_column :answers, :comment_type, :string
  end
end
