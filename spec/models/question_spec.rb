require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  it { should have_many(:answers).dependent(:destroy) }
  it { should validate_presence_of(:body) }
end
