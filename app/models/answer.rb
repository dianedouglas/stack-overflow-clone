class Answer <ActiveRecord::Base

  belongs_to :question
  belongs_to :user
  validates_presence_of :answer
  has_many :votes

  def self.top
    all.sort_by{|answer| answer.votes.count}.reverse
  end

end
