# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Routing rules for ramp up testing. This rule allows to redirect static
    # traffic % to a slot or to gradually change routing % based on
    # performance
    #
    class RampUpRule

      include MsRestAzure

      # @return [String] Hostname of a slot to which the traffic will be
      # redirected if decided to. E.g. mysite-stage.azurewebsites.net
      attr_accessor :action_host_name

      # @return [Float] Percentage of the traffic which will be redirected to
      # {Microsoft.Web.Hosting.Administration.RampUpRule.ActionHostName}
      attr_accessor :reroute_percentage

      # @return [Float] [Optional] In auto ramp up scenario this is the step
      # to to add/remove from
      # {Microsoft.Web.Hosting.Administration.RampUpRule.ReroutePercentage}
      # until it reaches
      # {Microsoft.Web.Hosting.Administration.RampUpRule.MinReroutePercentage}
      # or
      # {Microsoft.Web.Hosting.Administration.RampUpRule.MaxReroutePercentage}.
      # Site metrics are checked every N minutes specificed in
      # {Microsoft.Web.Hosting.Administration.RampUpRule.ChangeIntervalInMinutes}.
      # Custom decision algorithm can be provided in TiPCallback
      # site extension which Url can be specified in
      # {Microsoft.Web.Hosting.Administration.RampUpRule.ChangeDecisionCallbackUrl}
      attr_accessor :change_step

      # @return [Integer] [Optional] Specifies interval in mimuntes to
      # reevaluate ReroutePercentage
      attr_accessor :change_interval_in_minutes

      # @return [Float] [Optional] Specifies lower boundary above which
      # ReroutePercentage will stay.
      attr_accessor :min_reroute_percentage

      # @return [Float] [Optional] Specifies upper boundary below which
      # ReroutePercentage will stay.
      attr_accessor :max_reroute_percentage

      # @return [String] Custom decision algorithm can be provided in
      # TiPCallback site extension which Url can be specified. See
      # TiPCallback site extension for the scaffold and contracts.
      # https://www.siteextensions.net/packages/TiPCallback/
      attr_accessor :change_decision_callback_url

      # @return [String] Name of the routing rule. The recommended name would
      # be to point to the slot which will receive the traffic in the
      # experiment.
      attr_accessor :name


      #
      # Mapper for RampUpRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'RampUpRule',
          type: {
            name: 'Composite',
            class_name: 'RampUpRule',
            model_properties: {
              action_host_name: {
                required: false,
                serialized_name: 'actionHostName',
                type: {
                  name: 'String'
                }
              },
              reroute_percentage: {
                required: false,
                serialized_name: 'reroutePercentage',
                type: {
                  name: 'Double'
                }
              },
              change_step: {
                required: false,
                serialized_name: 'changeStep',
                type: {
                  name: 'Double'
                }
              },
              change_interval_in_minutes: {
                required: false,
                serialized_name: 'changeIntervalInMinutes',
                type: {
                  name: 'Number'
                }
              },
              min_reroute_percentage: {
                required: false,
                serialized_name: 'minReroutePercentage',
                type: {
                  name: 'Double'
                }
              },
              max_reroute_percentage: {
                required: false,
                serialized_name: 'maxReroutePercentage',
                type: {
                  name: 'Double'
                }
              },
              change_decision_callback_url: {
                required: false,
                serialized_name: 'changeDecisionCallbackUrl',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
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