# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:twig) do

  # require 'middleman-twig/template'
  require 'middleman-twig/extension'
  require 'middleman-twig/renderers/twig'

  ::Middleman::TwigExtension::Extension
end
