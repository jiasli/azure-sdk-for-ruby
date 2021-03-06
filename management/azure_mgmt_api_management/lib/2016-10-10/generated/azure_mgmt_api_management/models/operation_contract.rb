# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ApiManagement::Mgmt::V2016_10_10
  module Models
    #
    # Api Operation details.
    #
    class OperationContract < OperationEntityBaseContract

      include MsRestAzure

      # @return [String] Uniquely identifies the operation within the current
      # API Management service instance. The value is a valid relative URL in
      # the format of /apis/{aid}/operations/{id} where {aid} is an API
      # identifier and {id} is an operation identifier.
      attr_accessor :id

      # @return [String] Operation Name.
      attr_accessor :name

      # @return [String] A Valid HTTP Operation Method. Typical Http Methods
      # like GET, PUT, POST but not limited by only them.
      attr_accessor :method

      # @return [String] Relative URL template identifying the target resource
      # for this operation. May include parameters. Example:
      # /customers/{cid}/orders/{oid}/?date={date}
      attr_accessor :url_template


      #
      # Mapper for OperationContract class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'OperationContract',
          type: {
            name: 'Composite',
            class_name: 'OperationContract',
            model_properties: {
              template_parameters: {
                client_side_validation: true,
                required: false,
                serialized_name: 'templateParameters',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ParameterContractElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ParameterContract'
                      }
                  }
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                serialized_name: 'description',
                constraints: {
                  MaxLength: 1000
                },
                type: {
                  name: 'String'
                }
              },
              request: {
                client_side_validation: true,
                required: false,
                serialized_name: 'request',
                type: {
                  name: 'Composite',
                  class_name: 'RequestContract'
                }
              },
              responses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'responses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ResultContractElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ResultContract'
                      }
                  }
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                constraints: {
                  MaxLength: 300,
                  MinLength: 1
                },
                type: {
                  name: 'String'
                }
              },
              method: {
                client_side_validation: true,
                required: true,
                serialized_name: 'method',
                type: {
                  name: 'String'
                }
              },
              url_template: {
                client_side_validation: true,
                required: true,
                serialized_name: 'urlTemplate',
                constraints: {
                  MaxLength: 1000,
                  MinLength: 1
                },
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
