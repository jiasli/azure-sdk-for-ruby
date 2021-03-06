# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataMigration::Mgmt::V2018_07_15_preview
  module Models
    #
    # Input for task that migrates SQL Server databases to Azure SQL Database
    # Managed Instance online scenario.
    #
    class SqlServerSqlMISyncTaskInput

      include MsRestAzure

      # @return [Array<MigrateSqlServerSqlMIDatabaseInput>] Databases to
      # migrate
      attr_accessor :selected_databases

      # @return [FileShare] Backup file share information for all selected
      # databases.
      attr_accessor :backup_file_share

      # @return [String] Fully qualified resourceId of storage
      attr_accessor :storage_resource_id

      # @return [SqlConnectionInfo] Connection information for source SQL
      # Server
      attr_accessor :source_connection_info

      # @return [MiSqlConnectionInfo] Connection information for Azure SQL
      # Database Managed Instance
      attr_accessor :target_connection_info

      # @return [AzureActiveDirectoryApp] Azure Active Directory Application
      # the DMS instance will use to connect to the target instance of Azure
      # SQL Database Managed Instance and the Azure Storage Account
      attr_accessor :azure_app


      #
      # Mapper for SqlServerSqlMISyncTaskInput class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SqlServerSqlMISyncTaskInput',
          type: {
            name: 'Composite',
            class_name: 'SqlServerSqlMISyncTaskInput',
            model_properties: {
              selected_databases: {
                client_side_validation: true,
                required: true,
                serialized_name: 'selectedDatabases',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'MigrateSqlServerSqlMIDatabaseInputElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'MigrateSqlServerSqlMIDatabaseInput'
                      }
                  }
                }
              },
              backup_file_share: {
                client_side_validation: true,
                required: false,
                serialized_name: 'backupFileShare',
                type: {
                  name: 'Composite',
                  class_name: 'FileShare'
                }
              },
              storage_resource_id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'storageResourceId',
                type: {
                  name: 'String'
                }
              },
              source_connection_info: {
                client_side_validation: true,
                required: true,
                serialized_name: 'sourceConnectionInfo',
                type: {
                  name: 'Composite',
                  class_name: 'SqlConnectionInfo'
                }
              },
              target_connection_info: {
                client_side_validation: true,
                required: true,
                serialized_name: 'targetConnectionInfo',
                type: {
                  name: 'Composite',
                  class_name: 'MiSqlConnectionInfo'
                }
              },
              azure_app: {
                client_side_validation: true,
                required: true,
                serialized_name: 'azureApp',
                type: {
                  name: 'Composite',
                  class_name: 'AzureActiveDirectoryApp'
                }
              }
            }
          }
        }
      end
    end
  end
end
