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
            xml.:object_type, stepId)
            xml.template!(:object_type, status)
          end
          results = request(:get_member_count_in_step_by_status. xml_query)
        end

      end
    end
  end
end
