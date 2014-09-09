class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :user_id, :int
      t.column :answer_id, :int
    end
  end
end
