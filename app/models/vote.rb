class Vote <ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :answer_id
  belongs_to :answer
  belongs_to :user
end
