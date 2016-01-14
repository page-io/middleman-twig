require 'twig'
require 'middleman-core/templates'

# Twig Renderer
module Middleman
  module Renderers
    module Twig
      class << self
        def registered(app)
          app.before_configuration do
            template_extensions twig: :html
          end
          # Twig is not included in the default gems,
          # but we'll support it if available.

          # After config, setup mustache partial paths
          app.after_configuration do
            ::Tilt::TwigTemplate2.loader = ::Twig::Loader::Filesystem.new(source_dir)
            # Convert data object into a hash for twig
            sitemap.provides_metadata %r{\.twig$} do
              locals_hash = { :locals => { :data => data.to_h } }
              locals_hash[:locals].merge!({ :page_io => page_io }) if defined?(page_io) and page_io.present?
              locals_hash
            end
          end
        end

        alias :included :registered
      end
    end
  end
end
#Middleman::Templates.register :twig, Middleman::Renderers::Twig
