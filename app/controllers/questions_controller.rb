class QuestionsController <ApplicationController

  def index
  end

  def new
    @questions = Question.all
  end

  def create

  end

end
