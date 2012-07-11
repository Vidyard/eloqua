require 'spec_helper'
require 'eloqua/api/action'
require 'ruby-debug'

describe Eloqua::Api::Action do
  subject { Eloqua::Api::Action }
  describe "Eloqua Action" do
    it "should get member count in step by status" do
      result = subject.get_member_count_in_step_by_status(100, 'AwaitingAction')
      result.should exist
    end
  end
end
