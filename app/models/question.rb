class Question <ActiveRecord::Base

  has_many :answers, as: :comment
  belongs_to :user
  validates_presence_of :question

end
