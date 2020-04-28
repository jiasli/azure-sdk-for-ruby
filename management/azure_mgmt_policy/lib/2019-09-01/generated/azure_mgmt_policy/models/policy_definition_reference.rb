# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Policy::Mgmt::V2019_09_01
  module Models
    #
    # The policy definition reference.
    #
    class PolicyDefinitionReference

      include MsRestAzure

      # @return [String] The ID of the policy definition or policy set
      # definition.
      attr_accessor :policy_definition_id

      # @return [Hash{String => ParameterValuesValue}] The parameter values for
      # the referenced policy rule. The keys are the parameter names.
      attr_accessor :parameters

      # @return [String] A unique id (within the policy set definition) for
      # this policy definition reference.
      attr_accessor :policy_definition_reference_id

      # @return [Array<String>] The name of the groups that this policy
      # definition reference belongs to.
      attr_accessor :group_names


      #
      # Mapper for PolicyDefinitionReference class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PolicyDefinitionReference',
          type: {
            name: 'Composite',
            class_name: 'PolicyDefinitionReference',
            model_properties: {
              policy_definition_id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'policyDefinitionId',
                type: {
                  name: 'String'
                }
              },
              parameters: {
                client_side_validation: true,
                required: false,
                serialized_name: 'parameters',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ParameterValuesValueElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ParameterValuesValue'
                      }
                  }
                }
              },
              policy_definition_reference_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'policyDefinitionReferenceId',
                type: {
                  name: 'String'
                }
              },
              group_names: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupNames',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end