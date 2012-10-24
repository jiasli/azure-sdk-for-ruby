#-------------------------------------------------------------------------
# Copyright (c) Microsoft. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------
require 'azure/storage/service/storage_service'

require 'azure/storage/table/auth/shared_key'

require 'azure/storage/table/serialization'
require 'azure/storage/table/entity'

module Azure
  module Storage
    module Table
      class TableService < Azure::Storage::Service::StorageService

        def initialize
          super(Azure::Storage::Table::Auth::SharedKey.new)
          @host = Azure.config.table_host
          @default_timeout = 30
        end

        # Public: Creates new table in the storage account
        #
        # table_name    - String. The table name
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd135729
        #
        # Returns true on success
        def create_table(table_name)
          body = Azure::Storage::Table::Serialization.hash_to_entry_xml({"TableName" => table_name}).to_xml
          response = call(:post, collection_uri, body)
          response.success?
        end

        # Public: Deletes the specified table and any data it contains.
        #
        # table_name    - String. The table name
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179387
        #
        # Returns true on success
        def delete_table(table_name)
          response = call(:delete, table_uri(table_name))
          response.success?
        end

        # Public: Gets the table.
        #
        # table_name    - String. The table name
        #
        # Returns the last updated time for the table
        def get_table(table_name)
          response = call(:get, table_uri(table_name))
          results = Azure::Storage::Table::Serialization.hash_from_entry_xml(response.body)
          results[:updated] 
        end

        # Public: Gets a list of all tables on the account.
        #
        # continuation_token    - String. A token used to enumerate the next page of results, when the list of tables is
        #                         larger than a single operation can return at once. (optional)
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179405
        #
        # Returns a tuple of (tables, continuation_token) of the table list and possibly a continuation token
        #  tables             - Hash. A hash of tables and the time they were last updated: 
        #                        {
        #                           "TableName"=> "2012-10-03T09:35:31Z"
        #                        }
        #  continuation_token - String. A token used to retrieve subsequent pages, if the result set is too large for a 
        #                       single operation to return 
        #
        def query_tables(next_table_token=nil)
          uri = collection_uri(next_table_token ? { "NextTable" => next_table_token } : {})

          response = call(:get, uri)
          entries = Azure::Storage::Table::Serialization.entries_from_feed_xml(response.body) || []

          results = {}
          entries.each do |entry|
            results[entry[:properties]['TableName']] = entry[:updated]
          end

          return results, response.headers["x-ms-continuation-NextTableName"]
        end

        # Public: Gets the access control list (ACL) for the table.
        #
        # table_name    - String. The table name.
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/jj159100
        #
        # Returns a list of Azure::Entity::SignedIdentifier instances
        def get_table_acl(table_name)
          response = call(:get, table_uri(table_name, {"comp"=>"acl"}))

          signed_identifiers = []
          signed_identifiers = Azure::Storage::Table::Serialization.signed_identifiers_from_xml response.body unless response.body == nil or response.body.length < 1
          signed_identifiers
        end

        # Public: Sets the access control list (ACL) for the table.
        #
        # table_name          - String. The table name.
        # signed_identifiers  - Array. A list of Azure::Entity::SignedIdentifier instances 
        # 
        # See http://msdn.microsoft.com/en-us/library/windowsazure/jj159102
        #
        # Returns true on success
        def set_table_acl(table_name, signed_identifiers=[])
          uri = generate_uri(table_name, {"comp"=>"acl"})
          body = nil
          body = Azure::Storage::Table::Serialization.signed_identifiers_to_xml signed_identifiers if signed_identifiers && signed_identifiers.length > 0

          response = call(:put, uri, body, {})
          response.success?
        end

        # Public: Inserts new entity to the table.
        #
        # table_name    - String. The table name
        # partition_key - String. The partition key
        # row_key       - String. The row key
        # entity_values - Hash. A hash of the name/value pairs for the entity. 
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179433
        #
        # Returns a Azure::Entity::Table::TableEntity
        def insert_entity(table_name, partition_key, row_key, entity_values)
          body = Azure::Storage::Table::Serialization.hash_to_entry_xml({ 
              "PartitionKey" => partition_key, 
              "RowKey" => row_key
            }.merge(entity_values) ).to_xml

          response = call(:post, entities_uri(table_name), body)
          
          result = Azure::Storage::Table::Serialization.hash_from_entry_xml(response.body)

          entity = Azure::Storage::Table::Entity.new
          entity.table = table_name
          entity.partition_key = partition_key
          entity.row_key = row_key
          entity.updated = result[:updated]
          entity.etag = response.headers["etag"] || result[:etag]
          entity.properties = result[:properties]

          entity
        end

        # Public: Queries entities for the given table name
        #
        # table_name    - String. The table name
        # partition_key - String. The partition key (optional)
        # row_key       - String. The row key (optional)
        # select        - Array. An array of property names to return (optional)
        # filter        - String. A filter expression (optional)
        # top           - Integer. A limit for the number of results returned (optional)
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179421
        #
        # Returns a tuple of (results, continuation_token) on success
        #   results             - List. A list of Azure::Entity::Table::TableEntity instances
        #   continuation_token  - Hash. A token used to retrieve subsequent pages, if the result set is too large for a single operation to return 
        def query_entities(table_name, partition_key=nil, row_key=nil, select=nil, filter=nil, top=nil, continuation_token=nil)
          query ={}
          query["$select"] = select.join ',' if select
          query["$filter"] = filter if filter
          query["$top"] = top.to_s if top unless partition_key and row_key
          query["NextPartitionKey"] = continuation_token[:next_partition_key] if continuation_token and continuation_token[:next_partition_key]
          query["NextRowKey"] = continuation_token[:next_row_key] if continuation_token and continuation_token[:next_row_key]

          uri = entities_uri(table_name, partition_key, row_key, query)

          response = call(:get, uri, nil, { "DataServiceVersion" => "2.0;NetFx"})

          entities = []

          results = (partition_key and row_key) ? [Azure::Storage::Table::Serialization.hash_from_entry_xml(response.body)] : Azure::Storage::Table::Serialization.entries_from_feed_xml(response.body)
          
          results.each do |result|
            entity = Azure::Storage::Table::Entity.new
            entity.table = table_name
            entity.partition_key = result[:properties]["PartitionKey"]
            entity.row_key = result[:properties]["RowKey"]
            entity.updated = result[:updated]
            entity.etag = response.headers["etag"] || result[:etag]
            entity.properties = result[:properties].reject { |k,v| ["PartitionKey", "RowKey"].include? k }
            entities.push entity
          end if results

          continuation_token = nil
          continuation_token = { 
            :next_partition_key=> response.headers["x-ms-continuation-NextPartitionKey"], 
            :next_row_key => response.headers["x-ms-continuation-NextRowKey"]
            } if response.headers["x-ms-continuation-NextPartitionKey"]

          return entities, continuation_token 
        end

        # Public: Updates an existing entity in a table. The Update Entity operation replaces 
        # the entire entity and can be used to remove properties.
        #
        # table_name            - String. The table name
        # partition_key         - String. The partition key
        # row_key               - String. The row key
        # entity_values         - Hash. A hash of the name/value pairs for the entity. 
        # if_match              - String. A matching condition which is required for update (optional, Default="*")
        # create_if_not_exists  - Boolean. If true, and partition_key and row_key do not reference and existing entity, 
        #                         that entity will be inserted. If false, the operation will fail. (optional, Default=false)
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179427
        #
        # Returns the ETag for the entity on success 
        def update_entity(table_name, partition_key, row_key, entity_values, if_match="*", create_if_not_exists=false)
          uri = entities_uri(table_name, partition_key, row_key)

          headers = {}
          headers["If-Match"] = if_match || "*" unless create_if_not_exists

          body = Azure::Storage::Table::Serialization.hash_to_entry_xml(entity_values).to_xml

          response = call(:put, uri, body, headers)
          response.headers["etag"]
        end

        # Public: Updates an existing entity by updating the entity's properties. This operation
        # does not replace the existing entity, as the update_entity operation does.
        #
        # table_name            - String. The table name
        # partition_key         - String. The partition key
        # row_key               - String. The row key
        # entity_values         - Hash. A hash of the name/value pairs for the entity. 
        # if_match              - String. A matching condition which is required for update (optional, Default="*")
        # create_if_not_exists  - Boolean. If true, and partition_key and row_key do not reference and existing entity, 
        #                         that entity will be inserted. If false, the operation will fail. (optional, Default=false)
        # 
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd179392
        # 
        # Returns the ETag for the entity on success 
        def merge_entity(table_name, partition_key, row_key, entity_values, if_match="*", create_if_not_exists=false)
          uri = entities_uri(table_name, partition_key, row_key)

          headers = { "X-HTTP-Method"=> "MERGE" }
          headers["If-Match"] = if_match || "*" unless create_if_not_exists

          body = Azure::Storage::Table::Serialization.hash_to_entry_xml(entity_values).to_xml

          response = call(:post, uri, body, headers)
          response.headers["etag"]
        end

        # Public: Inserts or updates an existing entity within a table by merging new property values into the entity.
        #
        # table_name            - String. The table name
        # partition_key         - String. The partition key
        # row_key               - String. The row key
        # entity_values         - Hash. A hash of the name/value pairs for the entity. 
        # if_match              - String. A matching condition which is required for update (optional, Default="*")
        # create_if_not_exists  - Boolean. A matching condition which is required for update (optional, Default=false)
        # 
        # See http://msdn.microsoft.com/en-us/library/windowsazure/hh452241
        # 
        # Returns the ETag for the entity on success 
        def insert_or_merge_entity(table_name, partition_key, row_key, entity_values)
          merge_entity(table_name, partition_key, row_key, entity_values, nil, true)
        end

        # Public: Inserts or updates a new entity into a table.
        #
        # table_name            - String. The table name
        # partition_key         - String. The partition key
        # row_key               - String. The row key
        # entity_values         - Hash. A hash of the name/value pairs for the entity. 
        # 
        # See http://msdn.microsoft.com/en-us/library/windowsazure/hh452242
        #
        # Returns the ETag for the entity on success 
        def insert_or_replace_entity(table_name, partition_key, row_key, entity_values)
          update_entity(table_name, partition_key, row_key, entity_values, nil, true)
        end

        # Public: Deletes an existing entity in the table.
        #
        # table_name    - String. The table name
        # partition_key - String. The partition key
        # row_key       - String. The row key
        # if_match      - String. A matching condition which is required for update (optional, Default="*")
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd135727
        #
        # Returns true on success
        def delete_entity(table_name, partition_key, row_key, if_match=nil)
          response = call(:delete, entities_uri(table_name, partition_key, row_key), nil, {"If-Match"=> if_match || "*"})
          response.success?
        end

        # Public: Executes a batch of operations.
        #
        # batch         - The Azure::Storage::Table::Batch instance to execute.
        #
        # See http://msdn.microsoft.com/en-us/library/windowsazure/dd894038
        #
        # Returns an array of results, one for each operation in the batch
        def execute_batch(batch)
          headers = {
            "Content-Type"=> "multipart/mixed; boundary=#{batch.batch_id}",
            "Accept"=> 'application/atom+xml,application/xml',
            'Accept-Charset'=> 'UTF-8'
          }
          body = batch.to_body
          response = call(:post, generate_uri("/$batch"), body, headers)
          batch.parse_response(response)
        end

        # Public: Gets an existing entity in the table.
        #
        # table_name    - String. The table name
        # partition_key - String. The partition key
        # row_key       - String. The row key
        #
        # Returns an Azure::Storage::Table::Entity instance on success
        def get_entity(table_name, partition_key, row_key)
          results, _ = query_entities(table_name, partition_key, row_key)
          results.length > 0 ? results[0] : nil
        end

        # Public: Generate the URI for the collection of tables.
        #
        # Returns a URI
        def collection_uri(query={})
          generate_uri("Tables", query)
        end

        # Public: Generate the URI for a specific table.
        #
        # name - The table name. If this is a URI, we just return this
        #
        # Returns a URI
        def table_uri(name, query={})
          return name if name.kind_of? ::URI
          generate_uri("Tables('#{name}')", query)
        end

        # Public: Generate the URI for an entity or group of entities in a table.
        # If both the 'partition_key' and 'row_key' are specified, then the URI
        # will match the entity under those specific keys.
        #
        # table_name    - The table name
        # partition_key - The desired partition key (optional)
        # row_key       - The desired row key (optional)
        #
        # Returns a URI
        def entities_uri(table_name, partition_key=nil, row_key=nil, query={})
          return table_name if table_name.kind_of? ::URI

          path = if partition_key && row_key
            "%s(PartitionKey='%s',RowKey='%s')" % [
              table_name, partition_key, row_key
            ]
          else
            "%s()" % table_name
          end

          uri = generate_uri(path)
          qs = []
          if query
            query.each do | key, val |
              if key[0] == "$"
                qs.push "#{key}#{::URI.encode_www_form(""=>val)}"
              else
                qs.push ::URI.encode_www_form(key=>val)
              end
            end
          end
          uri.query = qs.join '&' if qs.length > 0
          uri
        end
      end
    end
  end
end