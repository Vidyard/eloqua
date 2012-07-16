require 'spec_helper'
require 'eloqua/api/action'
require 'ruby-debug'

describe Eloqua::Api::Action do
  subject { Eloqua::Api::Action }

  describe "Eloqua Action" do

    it "should get member count in step by status" do
      xml_query = xml! do |xml|
        xml.tag!(:stepId, 100)
        xml.tag!(:status, 'AwaitingAction')
      end
      mock_eloqua_request(:get_member_count_in_step_by_status, :success).\
        with(:action, :get_member_count_in_step_by_status, xml_query).once

      result = subject.get_member_count_in_step_by_status(100, 'AwaitingAction')
      result.should equal(0)
    end

    it "should list members in step by status if there is a membercount higher than 0" do
      xml_query = xml! do |xml|
        xml.tag!(:stepId, 100)
        xml.tag!(:status, 'AwaitingAction')
        xml.tag!(:pageNumber, 0)
        xml.tag!(:pageSize, 100)
      end
      mock_eloqua_request(:list_members_in_step_by_status, :success).\
        with(:action, :list_members_in_step_by_status, xml_query).once
      result = subject.list_members_in_step_by_status(100, 'AwaitingAction', 0, 100)
      #returns with {:i => http://www.w3.org/2001/XMLSchema-instance} as there is no result from the array
      result.should be_instance_of(Hash)
    end
  end
end
