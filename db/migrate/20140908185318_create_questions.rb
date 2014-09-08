class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :user_id, :int
      t.column :question, :string
      t.timestamps
    end
  end
end
