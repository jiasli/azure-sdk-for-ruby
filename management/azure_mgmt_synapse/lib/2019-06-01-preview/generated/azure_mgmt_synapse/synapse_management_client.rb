# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Synapse::Mgmt::V2019_06_01_preview
  #
  # A service client - single point of access to the REST API.
  #
  class SynapseManagementClient < MsRestAzure::AzureServiceClient
    include MsRestAzure
    include MsRestAzure::Serialization

    # @return [String] the base URI of the service.
    attr_accessor :base_url

    # @return Credentials needed for the client to connect to Azure.
    attr_reader :credentials

    # @return [String] The ID of the target subscription.
    attr_accessor :subscription_id

    # @return [String] The API version to use for this operation.
    attr_reader :api_version

    # @return [String] The preferred language for the response.
    attr_accessor :accept_language

    # @return [Integer] The retry timeout in seconds for Long Running
    # Operations. Default value is 30.
    attr_accessor :long_running_operation_retry_timeout

    # @return [Boolean] Whether a unique x-ms-client-request-id should be
    # generated. When set to true a unique x-ms-client-request-id value is
    # generated and included in each request. Default is true.
    attr_accessor :generate_client_request_id

    # @return [BigDataPools] big_data_pools
    attr_reader :big_data_pools

    # @return [Operations] operations
    attr_reader :operations

    # @return [IpFirewallRules] ip_firewall_rules
    attr_reader :ip_firewall_rules

    # @return [SqlPools] sql_pools
    attr_reader :sql_pools

    # @return [SqlPoolMetadataSyncConfigs] sql_pool_metadata_sync_configs
    attr_reader :sql_pool_metadata_sync_configs

    # @return [SqlPoolOperationResults] sql_pool_operation_results
    attr_reader :sql_pool_operation_results

    # @return [SqlPoolGeoBackupPolicies] sql_pool_geo_backup_policies
    attr_reader :sql_pool_geo_backup_policies

    # @return [SqlPoolDataWarehouseUserActivities]
    # sql_pool_data_warehouse_user_activities
    attr_reader :sql_pool_data_warehouse_user_activities

    # @return [SqlPoolRestorePoints] sql_pool_restore_points
    attr_reader :sql_pool_restore_points

    # @return [SqlPoolReplicationLinks] sql_pool_replication_links
    attr_reader :sql_pool_replication_links

    # @return [SqlPoolTransparentDataEncryptions]
    # sql_pool_transparent_data_encryptions
    attr_reader :sql_pool_transparent_data_encryptions

    # @return [SqlPoolBlobAuditingPolicies] sql_pool_blob_auditing_policies
    attr_reader :sql_pool_blob_auditing_policies

    # @return [SqlPoolOperations] sql_pool_operations
    attr_reader :sql_pool_operations

    # @return [SqlPoolUsages] sql_pool_usages
    attr_reader :sql_pool_usages

    # @return [SqlPoolSensitivityLabels] sql_pool_sensitivity_labels
    attr_reader :sql_pool_sensitivity_labels

    # @return [SqlPoolSchemas] sql_pool_schemas
    attr_reader :sql_pool_schemas

    # @return [SqlPoolTables] sql_pool_tables
    attr_reader :sql_pool_tables

    # @return [SqlPoolTableColumns] sql_pool_table_columns
    attr_reader :sql_pool_table_columns

    # @return [SqlPoolConnectionPolicies] sql_pool_connection_policies
    attr_reader :sql_pool_connection_policies

    # @return [SqlPoolVulnerabilityAssessments]
    # sql_pool_vulnerability_assessments
    attr_reader :sql_pool_vulnerability_assessments

    # @return [SqlPoolVulnerabilityAssessmentScans]
    # sql_pool_vulnerability_assessment_scans
    attr_reader :sql_pool_vulnerability_assessment_scans

    # @return [SqlPoolSecurityAlertPolicies] sql_pool_security_alert_policies
    attr_reader :sql_pool_security_alert_policies

    # @return [SqlPoolVulnerabilityAssessmentRuleBaselines]
    # sql_pool_vulnerability_assessment_rule_baselines
    attr_reader :sql_pool_vulnerability_assessment_rule_baselines

    # @return [Workspaces] workspaces
    attr_reader :workspaces

    # @return [WorkspaceAadAdmins] workspace_aad_admins
    attr_reader :workspace_aad_admins

    # @return [WorkspaceManagedIdentitySqlControlSettings]
    # workspace_managed_identity_sql_control_settings
    attr_reader :workspace_managed_identity_sql_control_settings

    #
    # Creates initializes a new instance of the SynapseManagementClient class.
    # @param credentials [MsRest::ServiceClientCredentials] credentials to authorize HTTP requests made by the service client.
    # @param base_url [String] the base URI of the service.
    # @param options [Array] filters to be applied to the HTTP requests.
    #
    def initialize(credentials = nil, base_url = nil, options = nil)
      super(credentials, options)
      @base_url = base_url || 'https://management.azure.com'

      fail ArgumentError, 'invalid type of credentials input parameter' unless credentials.is_a?(MsRest::ServiceClientCredentials) unless credentials.nil?
      @credentials = credentials

      @big_data_pools = BigDataPools.new(self)
      @operations = Operations.new(self)
      @ip_firewall_rules = IpFirewallRules.new(self)
      @sql_pools = SqlPools.new(self)
      @sql_pool_metadata_sync_configs = SqlPoolMetadataSyncConfigs.new(self)
      @sql_pool_operation_results = SqlPoolOperationResults.new(self)
      @sql_pool_geo_backup_policies = SqlPoolGeoBackupPolicies.new(self)
      @sql_pool_data_warehouse_user_activities = SqlPoolDataWarehouseUserActivities.new(self)
      @sql_pool_restore_points = SqlPoolRestorePoints.new(self)
      @sql_pool_replication_links = SqlPoolReplicationLinks.new(self)
      @sql_pool_transparent_data_encryptions = SqlPoolTransparentDataEncryptions.new(self)
      @sql_pool_blob_auditing_policies = SqlPoolBlobAuditingPolicies.new(self)
      @sql_pool_operations = SqlPoolOperations.new(self)
      @sql_pool_usages = SqlPoolUsages.new(self)
      @sql_pool_sensitivity_labels = SqlPoolSensitivityLabels.new(self)
      @sql_pool_schemas = SqlPoolSchemas.new(self)
      @sql_pool_tables = SqlPoolTables.new(self)
      @sql_pool_table_columns = SqlPoolTableColumns.new(self)
      @sql_pool_connection_policies = SqlPoolConnectionPolicies.new(self)
      @sql_pool_vulnerability_assessments = SqlPoolVulnerabilityAssessments.new(self)
      @sql_pool_vulnerability_assessment_scans = SqlPoolVulnerabilityAssessmentScans.new(self)
      @sql_pool_security_alert_policies = SqlPoolSecurityAlertPolicies.new(self)
      @sql_pool_vulnerability_assessment_rule_baselines = SqlPoolVulnerabilityAssessmentRuleBaselines.new(self)
      @workspaces = Workspaces.new(self)
      @workspace_aad_admins = WorkspaceAadAdmins.new(self)
      @workspace_managed_identity_sql_control_settings = WorkspaceManagedIdentitySqlControlSettings.new(self)
      @api_version = '2019-06-01-preview'
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
      if(!options[:headers].nil? && !options[:headers]['Content-Type'].nil?)
        @request_headers['Content-Type'] = options[:headers]['Content-Type']
      end

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
        sdk_information = 'azure_mgmt_synapse'
        sdk_information = "#{sdk_information}/0.17.0"
        add_user_agent_information(sdk_information)
    end
  end
end
