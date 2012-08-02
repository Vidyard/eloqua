require 'eloqua/api'

module Eloqua

  class Api
    class Action

      cattr_reader :type_methods
      @@type_methods = [:list_external_action_steps_by_type, :get_member_count_in_step_by_status, :list_members_in_step_by_status, :set_member_status]

      class << self

        delegate :builder, :remote_type, :to => Eloqua::Api

        def get_member_count_in_step_by_status(stepId, status)
          xml_query = builder do |xml|
            xml.tag!(:stepId, stepId)
            xml.tag!(:status, status)
          end
          results = request(:get_member_count_in_step_by_status, xml_query)
          results = results.to_i
        end

        #still seems finicky, returns a funky hash table if there are no members in that step
        def list_members_in_step_by_status(stepId, status, pageNumber, pageSize)
          xml_query = builder do |xml|
            xml.tag!(:stepId, stepId)
            xml.tag!(:status, status)
            xml.tag!(:pageNumber, pageNumber)
            xml.tag!(:pageSize, pageSize)
          end
          results = request(:list_members_in_step_by_status, xml_query)
        end

        def set_member_status(arrayOfMember, status)
          xml_query = builder do |xml|
            xml.tag!("members") do
              xml.template!(:member_array, arrayOfMember)
            end
            xml.tag!(:status, status)
          end
          results = request(:set_member_status, xml_query)
        end

        def request(*args)
          Eloqua::Api.request(:action, *args)
        end
      end
    end
  end
end
