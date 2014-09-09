class AnswersController <ApplicationController

  before_filter :authorize, only: [:create]

  # def index
  #   redirect_to root_path
  # end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = "Good Answer Bro!"
      respond_to do |format|
        # format.html{redirect_to question_path(params[:question_id])}
        format.js
      end
      # redirect_to question_path(params[:question_id])
    else
      flash[:notice] = "Fill in an answer before submitting!"
      @question = @answer.question
      render "questions/show"
    end
  end


private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
