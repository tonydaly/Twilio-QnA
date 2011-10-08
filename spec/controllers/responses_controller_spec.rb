require File.dirname(__FILE__) + '/../spec_helper'

describe ResponsesController do
  render_views

  before do
    @question = Question.create body: "How many ounces are there in a pound"
    @answer   = Answer.create body: "12", question_id: @question.to_param
    @myresponse = Response.create :question => @question, :answer => @answer
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @myresponse.to_param
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Response.any_instance.stub(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Response.any_instance.stub(:valid?).and_return(true)
    post :create
    response.should redirect_to(response_url(assigns[:myresponse]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Response.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Response.any_instance.stub(:valid?).and_return(false)
    put :update, :id => Response.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Response.any_instance.stub(:valid?).and_return(true)
    put :update, :id => Response.first
    response.should redirect_to(response_url(assigns[:myresponse]))
  end

  it "destroy action should destroy model and redirect to index action" do
    response = Response.first
    delete :destroy, :id => response
    response.should redirect_to(responses_url)
    Response.exists?(response.id).should be_false
  end
end
