require 'spec_helper'

describe "Viewing questions" do
  before do
    @question = Question.create body: "How many ounces are there in a pound"

    @answer_a = Answer.create question_id: @question.to_param, body: "12"
    @answer_b = Answer.create question_id: @question.to_param, body: "16"
    @answer_c = Answer.create question_id: @question.to_param, body: "14"
    @answer_d = Answer.create question_id: @question.to_param, body: "10"

    visit '/'
  end

  it "should show all the questions" do
    page.should have_content @question
  end

  it "should have a new question button" do
    page.should have_content "New Question"
  end

  it "should show all the answers for each question" do
    [@answer_a, @answer_b, @answer_c, @answer_d].each do |answer|
      page.should have_content answer
    end  
  end

  it "should show the choice for each answer" do
    [@answer_a, @answer_b, @answer_c, @answer_d].each do |answer|
      page.should have_content answer.choice
    end
  end
end

describe "Adding a new question" do
  before do
    visit '/'
    click_link "New Question"
  end

  it "should allow the user to set the body" do
    page.should have_field "Body"
  end
end