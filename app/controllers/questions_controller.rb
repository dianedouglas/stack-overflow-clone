class QuestionsController <ApplicationController

  before_filter :authorize, only: [:edit, :update, :new, :destroy]

  def index
    if params[:query]
      @questions = Question.basic_search(params[:query])
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to root_path, notice: "Hi there! You asked a question! Good work!"
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: "Hi there! You updated your question!"
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: "Question removed."
  end

  private
  def question_params
    params.require(:question).permit(:question)
  end

end
