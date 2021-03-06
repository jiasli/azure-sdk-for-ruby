# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataFactory::Mgmt::V2018_06_01
  module Models
    #
    # Staging info for execute data flow activity.
    #
    class DataFlowStagingInfo

      include MsRestAzure

      # @return [LinkedServiceReference] Staging linked service reference.
      attr_accessor :linked_service

      # @return [String] Folder path for staging blob.
      attr_accessor :folder_path


      #
      # Mapper for DataFlowStagingInfo class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DataFlowStagingInfo',
          type: {
            name: 'Composite',
            class_name: 'DataFlowStagingInfo',
            model_properties: {
              linked_service: {
                client_side_validation: true,
                required: false,
                serialized_name: 'linkedService',
                type: {
                  name: 'Composite',
                  class_name: 'LinkedServiceReference'
                }
              },
              folder_path: {
                client_side_validation: true,
                required: false,
                serialized_name: 'folderPath',
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
