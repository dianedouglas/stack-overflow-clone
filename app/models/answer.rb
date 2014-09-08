class Answer <ActiveRecord::Base

  belongs_to :comment, polymorphic: true
  # belongs_to :question, as: :comment
  has_many :answers, as: :comment
  belongs_to :user
  validates_presence_of :answer

  def find_parent
    next_level = self.comment
    until next_level.class.to_s == "Question"
      next_level = next_level.comment
    end
    next_level
  end

end
