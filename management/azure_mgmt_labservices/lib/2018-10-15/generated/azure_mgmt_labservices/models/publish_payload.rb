# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Labservices::Mgmt::V2018_10_15
  module Models
    #
    # Payload for Publish operation on EnvironmentSetting.
    #
    class PublishPayload

      include MsRestAzure

      # @return [Boolean] Whether to use existing VM custom image when
      # publishing.
      attr_accessor :use_existing_image


      #
      # Mapper for PublishPayload class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PublishPayload',
          type: {
            name: 'Composite',
            class_name: 'PublishPayload',
            model_properties: {
              use_existing_image: {
                client_side_validation: true,
                required: false,
                serialized_name: 'useExistingImage',
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