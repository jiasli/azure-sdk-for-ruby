# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Hdinsight::Mgmt::V2018_06_01_preview
  module Models
    #
    # The cluster create parameters.
    #
    class ClusterCreateProperties

      include MsRestAzure

      # @return [String] The version of the cluster.
      attr_accessor :cluster_version

      # @return [OSType] The type of operating system. Possible values include:
      # 'Windows', 'Linux'
      attr_accessor :os_type

      # @return [Tier] The cluster tier. Possible values include: 'Standard',
      # 'Premium'
      attr_accessor :tier

      # @return [ClusterDefinition] The cluster definition.
      attr_accessor :cluster_definition

      # @return [SecurityProfile] The security profile.
      attr_accessor :security_profile

      # @return [ComputeProfile] The compute profile.
      attr_accessor :compute_profile

      # @return [StorageProfile] The storage profile.
      attr_accessor :storage_profile

      # @return [DiskEncryptionProperties] The disk encryption properties.
      attr_accessor :disk_encryption_properties


      #
      # Mapper for ClusterCreateProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ClusterCreateProperties',
          type: {
            name: 'Composite',
            class_name: 'ClusterCreateProperties',
            model_properties: {
              cluster_version: {
                client_side_validation: true,
                required: false,
                serialized_name: 'clusterVersion',
                type: {
                  name: 'String'
                }
              },
              os_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OSType'
                }
              },
              tier: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tier',
                type: {
                  name: 'Enum',
                  module: 'Tier'
                }
              },
              cluster_definition: {
                client_side_validation: true,
                required: false,
                serialized_name: 'clusterDefinition',
                type: {
                  name: 'Composite',
                  class_name: 'ClusterDefinition'
                }
              },
              security_profile: {
                client_side_validation: true,
                required: false,
                serialized_name: 'securityProfile',
                type: {
                  name: 'Composite',
                  class_name: 'SecurityProfile'
                }
              },
              compute_profile: {
                client_side_validation: true,
                required: false,
                serialized_name: 'computeProfile',
                type: {
                  name: 'Composite',
                  class_name: 'ComputeProfile'
                }
              },
              storage_profile: {
                client_side_validation: true,
                required: false,
                serialized_name: 'storageProfile',
                type: {
                  name: 'Composite',
                  class_name: 'StorageProfile'
                }
              },
              disk_encryption_properties: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diskEncryptionProperties',
                type: {
                  name: 'Composite',
                  class_name: 'DiskEncryptionProperties'
                }
              }
            }
          }
        }
      end
    end
  end
end