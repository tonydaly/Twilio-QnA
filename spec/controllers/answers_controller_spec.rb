require File.dirname(__FILE__) + '/../spec_helper'

describe AnswersController do
  render_views

  before do
    @question = Question.create body: "How many ounces are there in a pound"
  end

  it "index action should render index template" do
    get :index, question_id: @question.to_param
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, id: Answer.first, question_id: @question.to_param
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, question_id: @question.to_param
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Answer.any_instance.stub(:valid?).and_return(false)
    post :create, question_id: @question.to_param
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Answer.any_instance.stub(:valid?).and_return(true)
    post :create, question_id: @question.to_param
    response.should redirect_to(question_answer_url(@question, assigns[:answer]))
  end

  it "edit action should render edit template" do
    get :edit, id: Answer.first, question_id: @question.to_param
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Answer.any_instance.stub(:valid?).and_return(false)
    put :update, id: Answer.first, question_id: @question.to_param
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Answer.any_instance.stub(:valid?).and_return(true)
    put :update, id: Answer.first, question_id: @question.to_param
    response.should redirect_to(question_answer_url(@question, assigns[:answer]))
  end

  it "destroy action should destroy model and redirect to index action" do
    answer = Answer.first
    delete :destroy, id: answer, question_id: @question.to_param
    response.should redirect_to(question_answers_url(@question))
    Answer.exists?(answer.id).should be_false
  end
end
