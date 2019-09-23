# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Migrate::Mgmt::V2018_02_02
  module Models
    #
    # List of projects.
    #
    class ProjectResultList

      include MsRestAzure

      # @return [Array<Project>] List of projects.
      attr_accessor :value


      #
      # Mapper for ProjectResultList class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ProjectResultList',
          type: {
            name: 'Composite',
            class_name: 'ProjectResultList',
            model_properties: {
              value: {
                client_side_validation: true,
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ProjectElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'Project'
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