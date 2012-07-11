require 'eloqua/api'
require 'ruby-debug'

module Eloqua

  class Api
    class Action

      cattr_reader :type_methods
      @@type_methods = [:list_external_action_steps_by_type, :get_member_count_in_step_by_status, :list_members_in_step_by_status, :set_member_status]

      class << self

        delegate :builder, :remote_type, :to => Eloqua::Api

        def get_member_count_in_step_by_status(stepId, status)
          xml_query = builder do |xml|
            debugger
            xml.tag!(:stepId, stepId)
            xml.tag!(:status, status)
          end
          results = request(:get_member_count_in_step_by_status, xml_query)
        end

        def request(*args)
          Eloqua::Api.request(:action, *args)
        end
      end
    end
  end
end
