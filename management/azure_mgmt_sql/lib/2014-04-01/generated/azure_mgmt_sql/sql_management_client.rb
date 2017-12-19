# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::SQL::Mgmt::V2014_04_01
  #
  # A service client - single point of access to the REST API.
  #
  class SqlManagementClient < MsRestAzure::AzureServiceClient
    include MsRestAzure
    include MsRestAzure::Serialization

    # @return [String] the base URI of the service.
    attr_accessor :base_url

    # @return Credentials needed for the client to connect to Azure.
    attr_reader :credentials

    # @return [String] The subscription ID that identifies an Azure
    # subscription.
    attr_accessor :subscription_id

    # @return [String] The API version to use for the request.
    attr_reader :api_version

    # @return [String] Gets or sets the preferred language for the response.
    attr_accessor :accept_language

    # @return [Integer] Gets or sets the retry timeout in seconds for Long
    # Running Operations. Default value is 30.
    attr_accessor :long_running_operation_retry_timeout

    # @return [Boolean] When set to true a unique x-ms-client-request-id value
    # is generated and included in each request. Default is true.
    attr_accessor :generate_client_request_id

    # @return [DatabaseAdvisors] database_advisors
    attr_reader :database_advisors

    # @return [BackupLongTermRetentionPolicies]
    # backup_long_term_retention_policies
    attr_reader :backup_long_term_retention_policies

    # @return [BackupLongTermRetentionVaults] backup_long_term_retention_vaults
    attr_reader :backup_long_term_retention_vaults

    # @return [RestorePoints] restore_points
    attr_reader :restore_points

    # @return [RecoverableDatabases] recoverable_databases
    attr_reader :recoverable_databases

    # @return [RestorableDroppedDatabases] restorable_dropped_databases
    attr_reader :restorable_dropped_databases

    # @return [Capabilities] capabilities
    attr_reader :capabilities

    # @return [ServerConnectionPolicies] server_connection_policies
    attr_reader :server_connection_policies

    # @return [DatabaseThreatDetectionPolicies]
    # database_threat_detection_policies
    attr_reader :database_threat_detection_policies

    # @return [DataMaskingPolicies] data_masking_policies
    attr_reader :data_masking_policies

    # @return [DataMaskingRules] data_masking_rules
    attr_reader :data_masking_rules

    # @return [TransparentDataEncryptionConfigurations]
    # transparent_data_encryption_configurations
    attr_reader :transparent_data_encryption_configurations

    # @return [FirewallRules] firewall_rules
    attr_reader :firewall_rules

    # @return [GeoBackupPolicies] geo_backup_policies
    attr_reader :geo_backup_policies

    # @return [Databases] databases
    attr_reader :databases

    # @return [ElasticPools] elastic_pools
    attr_reader :elastic_pools

    # @return [Operations] operations
    attr_reader :operations

    # @return [Queries] queries
    attr_reader :queries

    # @return [QueryStatistics] query_statistics
    attr_reader :query_statistics

    # @return [ReplicationLinks] replication_links
    attr_reader :replication_links

    # @return [ServerAzureADAdministrators] server_azure_adadministrators
    attr_reader :server_azure_adadministrators

    # @return [ServerCommunicationLinks] server_communication_links
    attr_reader :server_communication_links

    # @return [Servers] servers
    attr_reader :servers

    # @return [ServiceObjectives] service_objectives
    attr_reader :service_objectives

    # @return [ElasticPoolActivities] elastic_pool_activities
    attr_reader :elastic_pool_activities

    # @return [ElasticPoolDatabaseActivities] elastic_pool_database_activities
    attr_reader :elastic_pool_database_activities

    # @return [RecommendedElasticPools] recommended_elastic_pools
    attr_reader :recommended_elastic_pools

    # @return [ServiceTierAdvisors] service_tier_advisors
    attr_reader :service_tier_advisors

    # @return [TransparentDataEncryptions] transparent_data_encryptions
    attr_reader :transparent_data_encryptions

    # @return [TransparentDataEncryptionActivities]
    # transparent_data_encryption_activities
    attr_reader :transparent_data_encryption_activities

    # @return [ServerTableAuditingPolicies] server_table_auditing_policies
    attr_reader :server_table_auditing_policies

    # @return [DatabaseTableAuditingPolicies] database_table_auditing_policies
    attr_reader :database_table_auditing_policies

    # @return [DatabaseConnectionPolicies] database_connection_policies
    attr_reader :database_connection_policies

    # @return [ServerUsages] server_usages
    attr_reader :server_usages

    # @return [DatabaseUsages] database_usages
    attr_reader :database_usages

    #
    # Creates initializes a new instance of the SqlManagementClient class.
    # @param credentials [MsRest::ServiceClientCredentials] credentials to authorize HTTP requests made by the service client.
    # @param base_url [String] the base URI of the service.
    # @param options [Array] filters to be applied to the HTTP requests.
    #
    def initialize(credentials = nil, base_url = nil, options = nil)
      super(credentials, options)
      @base_url = base_url || 'https://management.azure.com'

      fail ArgumentError, 'invalid type of credentials input parameter' unless credentials.is_a?(MsRest::ServiceClientCredentials) unless credentials.nil?
      @credentials = credentials

      @database_advisors = DatabaseAdvisors.new(self)
      @backup_long_term_retention_policies = BackupLongTermRetentionPolicies.new(self)
      @backup_long_term_retention_vaults = BackupLongTermRetentionVaults.new(self)
      @restore_points = RestorePoints.new(self)
      @recoverable_databases = RecoverableDatabases.new(self)
      @restorable_dropped_databases = RestorableDroppedDatabases.new(self)
      @capabilities = Capabilities.new(self)
      @server_connection_policies = ServerConnectionPolicies.new(self)
      @database_threat_detection_policies = DatabaseThreatDetectionPolicies.new(self)
      @data_masking_policies = DataMaskingPolicies.new(self)
      @data_masking_rules = DataMaskingRules.new(self)
      @transparent_data_encryption_configurations = TransparentDataEncryptionConfigurations.new(self)
      @firewall_rules = FirewallRules.new(self)
      @geo_backup_policies = GeoBackupPolicies.new(self)
      @databases = Databases.new(self)
      @elastic_pools = ElasticPools.new(self)
      @operations = Operations.new(self)
      @queries = Queries.new(self)
      @query_statistics = QueryStatistics.new(self)
      @replication_links = ReplicationLinks.new(self)
      @server_azure_adadministrators = ServerAzureADAdministrators.new(self)
      @server_communication_links = ServerCommunicationLinks.new(self)
      @servers = Servers.new(self)
      @service_objectives = ServiceObjectives.new(self)
      @elastic_pool_activities = ElasticPoolActivities.new(self)
      @elastic_pool_database_activities = ElasticPoolDatabaseActivities.new(self)
      @recommended_elastic_pools = RecommendedElasticPools.new(self)
      @service_tier_advisors = ServiceTierAdvisors.new(self)
      @transparent_data_encryptions = TransparentDataEncryptions.new(self)
      @transparent_data_encryption_activities = TransparentDataEncryptionActivities.new(self)
      @server_table_auditing_policies = ServerTableAuditingPolicies.new(self)
      @database_table_auditing_policies = DatabaseTableAuditingPolicies.new(self)
      @database_connection_policies = DatabaseConnectionPolicies.new(self)
      @server_usages = ServerUsages.new(self)
      @database_usages = DatabaseUsages.new(self)
      @api_version = '2014-04-01'
      @accept_language = 'en-US'
      @long_running_operation_retry_timeout = 30
      @generate_client_request_id = true
      add_telemetry
    end

    #
    # Makes a request and returns the body of the response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Hash{String=>String}] containing the body of the response.
    # Example:
    #
    #  request_content = "{'location':'westus','tags':{'tag1':'val1','tag2':'val2'}}"
    #  path = "/path"
    #  options = {
    #    body: request_content,
    #    query_params: {'api-version' => '2016-02-01'}
    #  }
    #  result = @client.make_request(:put, path, options)
    #
    def make_request(method, path, options = {})
      result = make_request_with_http_info(method, path, options)
      result.body unless result.nil?
    end

    #
    # Makes a request and returns the operation response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [MsRestAzure::AzureOperationResponse] Operation response containing the request, response and status.
    #
    def make_request_with_http_info(method, path, options = {})
      result = make_request_async(method, path, options).value!
      result.body = result.response.body.to_s.empty? ? nil : JSON.load(result.response.body)
      result
    end

    #
    # Makes a request asynchronously.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def make_request_async(method, path, options = {})
      fail ArgumentError, 'method is nil' if method.nil?
      fail ArgumentError, 'path is nil' if path.nil?

      request_url = options[:base_url] || @base_url

      request_headers = @request_headers
      request_headers.merge!({'accept-language' => @accept_language}) unless @accept_language.nil?
      options.merge!({headers: request_headers.merge(options[:headers] || {})})
      options.merge!({credentials: @credentials}) unless @credentials.nil?

      super(request_url, method, path, options)
    end


    private
    #
    # Adds telemetry information.
    #
    def add_telemetry
        sdk_information = 'azure_mgmt_sql'
        sdk_information = "#{sdk_information}/0.15.2"
        add_user_agent_information(sdk_information)
    end
  end
end
