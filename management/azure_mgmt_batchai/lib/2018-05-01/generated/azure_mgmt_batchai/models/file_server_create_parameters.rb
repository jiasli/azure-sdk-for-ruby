# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::BatchAI::Mgmt::V2018_05_01
  module Models
    #
    # File Server creation parameters.
    #
    class FileServerCreateParameters

      include MsRestAzure

      # @return [String] VM size. The size of the virtual machine for the File
      # Server. For information about available VM sizes from the Virtual
      # Machines Marketplace, see Sizes for Virtual Machines (Linux).
      attr_accessor :vm_size

      # @return [SshConfiguration] SSH configuration. SSH configuration for the
      # File Server node.
      attr_accessor :ssh_configuration

      # @return [DataDisks] Data disks. Settings for the data disks which will
      # be created for the File Server.
      attr_accessor :data_disks

      # @return [ResourceId] Subnet identifier. Identifier of an existing
      # virtual network subnet to put the File Server in. If not provided, a
      # new virtual network and subnet will be created.
      attr_accessor :subnet


      #
      # Mapper for FileServerCreateParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FileServerCreateParameters',
          type: {
            name: 'Composite',
            class_name: 'FileServerCreateParameters',
            model_properties: {
              vm_size: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.vmSize',
                type: {
                  name: 'String'
                }
              },
              ssh_configuration: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.sshConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'SshConfiguration'
                }
              },
              data_disks: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.dataDisks',
                type: {
                  name: 'Composite',
                  class_name: 'DataDisks'
                }
              },
              subnet: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.subnet',
                type: {
                  name: 'Composite',
                  class_name: 'ResourceId'
                }
              }
            }
          }
        }
      end
    end
  end
end
