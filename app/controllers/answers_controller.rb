class AnswersController <ApplicationController

  before_filter :authorize, only: [:create]

  def new
    if params[:answer_id] == nil
      @parent = Question.find(params[:question_id])
    else
      @parent = Answer.find(params[:answer_id])
    end
    @answer = @parent.answers.new

  end

  def create
    if params[:answer_id] == nil
      @parent = Question.find(params[:question_id])
    else
      @parent = Answer.find(params[:answer_id])
    end
    @answer = @parent.answers.new(answer_params)
    @question = @answer.find_top_parent

    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to question_path(params[:question_id])
      flash[:notice] = "Good Answer Bro!"
    else
      redirect_to question_path(params[:question_id])
      flash[:notice] = "Fill in an answer before submitting!"
    end
  end


private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
