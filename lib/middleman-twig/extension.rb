module Middleman
  module TwigExtension

    class Extension < ::Middleman::Extension
      self.supports_multiple_instances = true

      option :debug, false, 'debug mode'

      # def initialize(app, options_hash={}, &block)
      #   super
      # end

      def after_configuration
        ::Tilt::TwigTemplate.loader = ::Twig::Loader::Filesystem.new(app.config[:source])
        ::Tilt::TwigTemplate.debug = options.debug
      end

    end
  end
end
