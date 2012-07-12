require 'spec_helper'
require 'eloqua/api/action'

describe Eloqua::Api::Action do
  subject { Eloqua::Api::Action }

  describe "Eloqua Action" do
    it "should get member count in step by status" do
      result = subject.get_member_count_in_step_by_status(100, 'AwaitingAction')
      result.should equal(0)
    end

    it "should list members in step by status if there is a membercount higher than 0" do
      result = subject.get_members_count_in_step_by_status(100, 'AwaitingAction')
      if result == 0
        result.should equal(0)
      else
        result = subject.list_members_in_step_by_status(100, 'AwaitingAction', 0, 100)
        result.should exist
      end
    end
  end
end
