# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ResourceGraph::Mgmt::V2019_04_01
  module Models
    #
    # Query output in tabular format.
    #
    class Table

      include MsRestAzure

      # @return [Array<Column>] Query result column descriptors.
      attr_accessor :columns

      # @return Query result rows.
      attr_accessor :rows


      #
      # Mapper for Table class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'Table',
          type: {
            name: 'Composite',
            class_name: 'Table',
            model_properties: {
              columns: {
                client_side_validation: true,
                required: true,
                serialized_name: 'columns',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ColumnElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'Column'
                      }
                  }
                }
              },
              rows: {
                client_side_validation: true,
                required: true,
                serialized_name: 'rows',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ArrayElementType',
                      type: {
                        name: 'Sequence',
                        element: {
                            client_side_validation: true,
                            required: false,
                            serialized_name: 'ObjectElementType',
                            type: {
                              name: 'Object'
                            }
                        }
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