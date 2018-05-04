# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataLakeStore::Mgmt::V2016_11_01
  module Models
    #
    # Data Lake Store account name availability check parameters.
    #
    class CheckNameAvailabilityParameters

      include MsRestAzure

      # @return [String] The Data Lake Store name to check availability for.
      attr_accessor :name

      # @return [String] The resource type. Note: This should not be set by the
      # user, as the constant value is Microsoft.DataLakeStore/accounts.
      # Default value: 'Microsoft.DataLakeStore/accounts' .
      attr_accessor :type


      #
      # Mapper for CheckNameAvailabilityParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'CheckNameAvailabilityParameters',
          type: {
            name: 'Composite',
            class_name: 'CheckNameAvailabilityParameters',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: true,
                is_constant: true,
                serialized_name: 'type',
                default_value: 'Microsoft.DataLakeStore/accounts',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end