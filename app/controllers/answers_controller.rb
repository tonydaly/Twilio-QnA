class AnswersController < ApplicationController
  before_filter :get_question

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      flash[:notice] = "Successfully created answer."
      redirect_to @question
    else
      render :action => 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Successfully updated answer."
      redirect_to question_answer_url(@question)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Successfully destroyed answer."
    redirect_to question_answers_url(@question)
  end

  protected

  def get_question
    @question = Question.find params[:question_id]
  end
end
