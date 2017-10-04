# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesSiteRecovery::Api_2016_08_10
  module Models
    #
    # Policy update properties.
    #
    class UpdatePolicyInputProperties

      include MsRestAzure

      include MsRest::JSONable
      # @return [PolicyProviderSpecificInput] The ReplicationProviderSettings.
      attr_accessor :replication_provider_settings


      #
      # Mapper for UpdatePolicyInputProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'UpdatePolicyInputProperties',
          type: {
            name: 'Composite',
            class_name: 'UpdatePolicyInputProperties',
            model_properties: {
              replication_provider_settings: {
                required: false,
                serialized_name: 'replicationProviderSettings',
                type: {
                  name: 'Composite',
                  polymorphic_discriminator: 'instanceType',
                  uber_parent: 'PolicyProviderSpecificInput',
                  class_name: 'PolicyProviderSpecificInput'
                }
              }
            }
          }
        }
      end
    end
  end
end