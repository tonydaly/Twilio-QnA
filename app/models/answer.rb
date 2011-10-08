class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :choice

  belongs_to :question
  validates_presence_of :body, :choice
  validates_uniqueness_of :choice, :scope => :question_id

  before_validation :set_choice

  def to_s
    body
  end

  protected

  def set_choice
    existing_answers_count = question.answers.count
    self.choice = ("A".."Z").to_a[existing_answers_count]
  end
end
