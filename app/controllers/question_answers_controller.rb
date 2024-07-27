class QuestionAnswersController < ApplicationController
  before_action :set_category
  def index
    @q = @category.question_answers.ransack(params[:q])
    @question_answers = @q.result.paginate(page: params[:page], per_page: 10)
  end

  def show
    
  end

  def new
    @question_answer = @category.question_answers.build
  end

  def create
    
    @question_answer = @category.question_answers.build(question_answer_params)

    unless @question_answer.save
      render :new and return
    end
    
    redirect_to category_question_answers_path(@category), notice: 'Question answer was successfully created.'
  end

  def destroy
    @question_answer = @category.question_answers.find(params[:id])
    @question_answer.destroy
    redirect_to deleted_category_question_answers_path(@category),  notice: 'Question answer was successfully deleted.'   
  end

  def deleted
    @deleted_question_answers = @category.question_answers.only_deleted.paginate(page: params[:page], per_page: 1)  
  end

  def restore
    @question_answer = @category.question_answers.only_deleted.find(params[:id])
    @question_answer.restore
    redirect_to category_question_answers_path(@category)  
  end

  private
    
    def set_category
      @category = Category.find(params[:category_id])
    end

    # def set_question_answer
    #   @question_answer = @category.question_answers.find(params[:id])
    # end

    
    def question_answer_params
      params.require(:question_answer).permit(:question, :answer)
    end
end
