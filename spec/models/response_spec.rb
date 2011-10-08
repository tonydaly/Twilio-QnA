require File.dirname(__FILE__) + '/../spec_helper'

describe Response do
  it { should belong_to :question }
  it { should belong_to :answer }
end
