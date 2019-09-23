# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::AlertsManagement::Mgmt::V2018_05_05_preview
  module Models
    #
    # Summary of the alerts by monitor condition
    #
    class AlertsSummaryByMonitorCondition

      include MsRestAzure

      # @return [Integer] Count of alerts with monitorCondition 'Fired'
      attr_accessor :fired

      # @return [Integer] Count of alerts with monitorCondition 'Resolved'
      attr_accessor :resolved


      #
      # Mapper for AlertsSummaryByMonitorCondition class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'alertsSummaryByMonitorCondition',
          type: {
            name: 'Composite',
            class_name: 'AlertsSummaryByMonitorCondition',
            model_properties: {
              fired: {
                client_side_validation: true,
                required: false,
                serialized_name: 'fired',
                type: {
                  name: 'Number'
                }
              },
              resolved: {
                client_side_validation: true,
                required: false,
                serialized_name: 'resolved',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end