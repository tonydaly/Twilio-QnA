class Question < ActiveRecord::Base
  attr_accessible :body

  has_many :answers, :dependent => :destroy
  validates_presence_of :body

  def to_s
    body
  end
end
