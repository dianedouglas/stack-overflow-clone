class AddVotes < ActiveRecord::Migration
  def change
    add_column :answers, :votes, :int
  end
end
