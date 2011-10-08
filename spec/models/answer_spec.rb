require File.dirname(__FILE__) + '/../spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:choice) }
end
