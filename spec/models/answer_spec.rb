require File.dirname(__FILE__) + '/../spec_helper'

describe Answer do
  it { should belong_to :question }
  # it { should validate_presence_of(:body) }
  # it { should validate_presence_of(:choice) }
  # it { should validate_uniqueness_of(:body).scoped_to(:question) }
  # it { should validate_uniqueness_of(:choice).scoped_to(:question) }

  describe "#create" do
    before do
      @question = Question.create body: "How many ounces are there in a pound"
    end

    subject { Answer.create body: "12", question_id: @question.to_param }

    its(:choice) { should_not be_nil }

    it "should be in alphabetical order" do
      subject.choice.should == 'A'
    end

    it "should set a unique choice" do
      @answer2 = Answer.create body: "10", question_id: @question.to_param
      subject.choice.should_not == @answer2.choice
    end
  end
end
