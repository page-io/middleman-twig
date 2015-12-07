module Middleman
  module TwigExtension

    class Extension < ::Middleman::Extension
      self.supports_multiple_instances = true

      def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super
        app.inst.template_extensions twig: :html
      end

    end
  end
end
