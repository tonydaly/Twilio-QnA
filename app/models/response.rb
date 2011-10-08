class Response < ActiveRecord::Base
  attr_accessible :question_id, :answer_id

  belongs_to :question
  belongs_to :answer
end
