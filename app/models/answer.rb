class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :choice

  belongs_to :question
  validates_presence_of :body, :choice

  def to_s
    body
  end
end
