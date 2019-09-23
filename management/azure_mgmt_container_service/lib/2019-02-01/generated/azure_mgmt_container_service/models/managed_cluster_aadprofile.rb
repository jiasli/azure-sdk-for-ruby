# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ContainerService::Mgmt::V2019_02_01
  module Models
    #
    # AADProfile specifies attributes for Azure Active Directory integration.
    #
    class ManagedClusterAADProfile

      include MsRestAzure

      # @return [String] The client AAD application ID.
      attr_accessor :client_app_id

      # @return [String] The server AAD application ID.
      attr_accessor :server_app_id

      # @return [String] The server AAD application secret.
      attr_accessor :server_app_secret

      # @return [String] The AAD tenant ID to use for authentication. If not
      # specified, will use the tenant of the deployment subscription.
      attr_accessor :tenant_id


      #
      # Mapper for ManagedClusterAADProfile class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ManagedClusterAADProfile',
          type: {
            name: 'Composite',
            class_name: 'ManagedClusterAADProfile',
            model_properties: {
              client_app_id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'clientAppID',
                type: {
                  name: 'String'
                }
              },
              server_app_id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'serverAppID',
                type: {
                  name: 'String'
                }
              },
              server_app_secret: {
                client_side_validation: true,
                required: false,
                serialized_name: 'serverAppSecret',
                type: {
                  name: 'String'
                }
              },
              tenant_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tenantID',
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