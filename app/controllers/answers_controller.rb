class AnswersController <ApplicationController

  before_filter :authorize, only: [:create, :update]

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    @question = @answer.question
    respond_to do |format|
        format.js
    end
  end

  def update
    @question = Question.find(params[:question_id])
      respond_to do |format|
        format.js
      end
  end

private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
