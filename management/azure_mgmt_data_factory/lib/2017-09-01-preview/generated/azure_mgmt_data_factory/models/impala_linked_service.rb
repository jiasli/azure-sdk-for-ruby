# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataFactory::Mgmt::V2017_09_01_preview
  module Models
    #
    # Impala server linked service.
    #
    class ImpalaLinkedService < LinkedService

      include MsRestAzure


      def initialize
        @type = "Impala"
      end

      attr_accessor :type

      # @return The IP address or host name of the Impala server. (i.e.
      # 192.168.222.160)
      attr_accessor :host

      # @return The TCP port that the Impala server uses to listen for client
      # connections. The default value is 21050.
      attr_accessor :port

      # @return [ImpalaAuthenticationType] The authentication type to use.
      # Possible values include: 'Anonymous', 'SASLUsername',
      # 'UsernameAndPassword'
      attr_accessor :authentication_type

      # @return The user name used to access the Impala server. The default
      # value is anonymous when using SASLUsername.
      attr_accessor :username

      # @return [SecretBase] The password corresponding to the user name when
      # using UsernameAndPassword.
      attr_accessor :password

      # @return Specifies whether the connections to the server are encrypted
      # using SSL. The default value is false.
      attr_accessor :enable_ssl

      # @return The full path of the .pem file containing trusted CA
      # certificates for verifying the server when connecting over SSL. This
      # property can only be set when using SSL on self-hosted IR. The default
      # value is the cacerts.pem file installed with the IR.
      attr_accessor :trusted_cert_path

      # @return Specifies whether to use a CA certificate from the system trust
      # store or from a specified PEM file. The default value is false.
      attr_accessor :use_system_trust_store

      # @return Specifies whether to require a CA-issued SSL certificate name
      # to match the host name of the server when connecting over SSL. The
      # default value is false.
      attr_accessor :allow_host_name_cnmismatch

      # @return Specifies whether to allow self-signed certificates from the
      # server. The default value is false.
      attr_accessor :allow_self_signed_server_cert

      # @return The encrypted credential used for authentication. Credentials
      # are encrypted using the integration runtime credential manager. Type:
      # string (or Expression with resultType string).
      attr_accessor :encrypted_credential


      #
      # Mapper for ImpalaLinkedService class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'Impala',
          type: {
            name: 'Composite',
            class_name: 'ImpalaLinkedService',
            model_properties: {
              additional_properties: {
                client_side_validation: true,
                required: false,
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ObjectElementType',
                      type: {
                        name: 'Object'
                      }
                  }
                }
              },
              connect_via: {
                client_side_validation: true,
                required: false,
                serialized_name: 'connectVia',
                type: {
                  name: 'Composite',
                  class_name: 'IntegrationRuntimeReference'
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                serialized_name: 'description',
                type: {
                  name: 'String'
                }
              },
              parameters: {
                client_side_validation: true,
                required: false,
                serialized_name: 'parameters',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ParameterSpecificationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ParameterSpecification'
                      }
                  }
                }
              },
              annotations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'annotations',
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
              },
              type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              host: {
                client_side_validation: true,
                required: true,
                serialized_name: 'typeProperties.host',
                type: {
                  name: 'Object'
                }
              },
              port: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.port',
                type: {
                  name: 'Object'
                }
              },
              authentication_type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'typeProperties.authenticationType',
                type: {
                  name: 'String'
                }
              },
              username: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.username',
                type: {
                  name: 'Object'
                }
              },
              password: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.password',
                type: {
                  name: 'Composite',
                  polymorphic_discriminator: 'type',
                  uber_parent: 'SecretBase',
                  class_name: 'SecretBase'
                }
              },
              enable_ssl: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.enableSsl',
                type: {
                  name: 'Object'
                }
              },
              trusted_cert_path: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.trustedCertPath',
                type: {
                  name: 'Object'
                }
              },
              use_system_trust_store: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.useSystemTrustStore',
                type: {
                  name: 'Object'
                }
              },
              allow_host_name_cnmismatch: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.allowHostNameCNMismatch',
                type: {
                  name: 'Object'
                }
              },
              allow_self_signed_server_cert: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.allowSelfSignedServerCert',
                type: {
                  name: 'Object'
                }
              },
              encrypted_credential: {
                client_side_validation: true,
                required: false,
                serialized_name: 'typeProperties.encryptedCredential',
                type: {
                  name: 'Object'
                }
              }
            }
          }
        }
      end
    end
  end
end
