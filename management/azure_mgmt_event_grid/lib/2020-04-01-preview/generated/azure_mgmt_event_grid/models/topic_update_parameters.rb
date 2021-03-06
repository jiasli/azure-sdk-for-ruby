# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::EventGrid::Mgmt::V2020_04_01_preview
  module Models
    #
    # Properties of the Topic update
    #
    class TopicUpdateParameters

      include MsRestAzure

      # @return [Hash{String => String}] Tags of the resource.
      attr_accessor :tags

      # @return [IdentityInfo] Resource identity information.
      attr_accessor :identity

      # @return [PublicNetworkAccess] This determines if traffic is allowed
      # over public network. By default it is enabled.
      # You can further restrict to specific IPs by configuring <seealso
      # cref="P:Microsoft.Azure.Events.ResourceProvider.Common.Contracts.TopicUpdateParameterProperties.InboundIpRules"
      # />. Possible values include: 'Enabled', 'Disabled'
      attr_accessor :public_network_access

      # @return [Array<InboundIpRule>] This can be used to restrict traffic
      # from specific IPs instead of all IPs. Note: These are considered only
      # if PublicNetworkAccess is enabled.
      attr_accessor :inbound_ip_rules

      # @return [ResourceSku] The Sku pricing tier for the topic.
      attr_accessor :sku


      #
      # Mapper for TopicUpdateParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'TopicUpdateParameters',
          type: {
            name: 'Composite',
            class_name: 'TopicUpdateParameters',
            model_properties: {
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              identity: {
                client_side_validation: true,
                required: false,
                serialized_name: 'identity',
                type: {
                  name: 'Composite',
                  class_name: 'IdentityInfo'
                }
              },
              public_network_access: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.publicNetworkAccess',
                type: {
                  name: 'String'
                }
              },
              inbound_ip_rules: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.inboundIpRules',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'InboundIpRuleElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'InboundIpRule'
                      }
                  }
                }
              },
              sku: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sku',
                type: {
                  name: 'Composite',
                  class_name: 'ResourceSku'
                }
              }
            }
          }
        }
      end
    end
  end
end
