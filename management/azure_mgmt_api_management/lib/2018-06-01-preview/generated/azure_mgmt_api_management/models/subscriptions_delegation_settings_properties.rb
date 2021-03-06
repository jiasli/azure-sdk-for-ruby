# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ApiManagement::Mgmt::V2018_06_01_preview
  module Models
    #
    # Subscriptions delegation settings properties.
    #
    class SubscriptionsDelegationSettingsProperties

      include MsRestAzure

      # @return [Boolean] Enable or disable delegation for subscriptions.
      attr_accessor :enabled


      #
      # Mapper for SubscriptionsDelegationSettingsProperties class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SubscriptionsDelegationSettingsProperties',
          type: {
            name: 'Composite',
            class_name: 'SubscriptionsDelegationSettingsProperties',
            model_properties: {
              enabled: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enabled',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
