require 'rails_helper'

describe Answer do

    it {should validate_presence_of :answer}
    it {should belong_to :user}
    it {should belong_to :comment}

  describe 'find_parent' do
    it 'should find the top level of any nested comment.' do
      test_question1 = Question.create(question: "wtf?")
      test_answer1 = test_question1.answers.create(answer: "first level answer")
      test_answer2 = test_answer1.answers.create(answer: "second level answer")
      expect(test_answer2.find_parent).to eq test_question1
    end
  end
end
