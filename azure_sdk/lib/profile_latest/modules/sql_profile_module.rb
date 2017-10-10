# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require 'azure_mgmt_sql'

module Azure::Profiles::Management::Profile_Latest
  module SQL
    DatabaseOperations = Azure::ARM::SQL::Api_2017_03_01_preview::DatabaseOperations

    module Models
      DatabaseOperationListResult = Azure::ARM::SQL::Api_2017_03_01_preview::Models::DatabaseOperationListResult
      ProxyResource = Azure::ARM::SQL::Api_2017_03_01_preview::Models::ProxyResource
      DatabaseOperation = Azure::ARM::SQL::Api_2017_03_01_preview::Models::DatabaseOperation
      ManagementOperationState = Azure::ARM::SQL::Api_2017_03_01_preview::Models::ManagementOperationState
    end

    #
    # SQL
    #
    class SQLClass
      attr_reader :database_operations, :configurable, :base_url, :options, :model_classes

      def initialize(configurable, base_url=nil, options=nil)
        @configurable, @base_url, @options = configurable, base_url, options
        client = Azure::ARM::SQL::Api_2017_03_01_preview::SqlManagementClient.new(configurable.credentials, base_url, options)
        if(client.respond_to?(:subscription_id))
          client.subscription_id = configurable.subscription_id
        end
        @database_operations = client.database_operations
        @model_classes = ModelClasses.new
      end

      #
      # Method to get the client object based on the version
      # If the version is invalid, an exception is raised
      #
      # @param version [String] The version of the required
      # client object.
      #
      # @return Client object
      #
      def get_client(version = '2017-03-01-preview')
        case version
          when '2017-03-01-preview'
            client = Azure::ARM::SQL::Api_2017_03_01_preview::SqlManagementClient.new(@configurable.credentials, @base_url, @options)
            client.subscription_id = configurable.subscription_id
            return client
          else
            raise "No client of version #{version} could be found in this profile."
        end
      end

      class ModelClasses
        def database_operation_list_result
          Azure::ARM::SQL::Api_2017_03_01_preview::Models::DatabaseOperationListResult
        end
        def proxy_resource
          Azure::ARM::SQL::Api_2017_03_01_preview::Models::ProxyResource
        end
        def database_operation
          Azure::ARM::SQL::Api_2017_03_01_preview::Models::DatabaseOperation
        end
        def management_operation_state
          Azure::ARM::SQL::Api_2017_03_01_preview::Models::ManagementOperationState
        end
      end
    end
  end
end