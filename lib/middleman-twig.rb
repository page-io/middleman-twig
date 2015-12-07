# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:twig) do

  require 'middleman-twig/template'
  require 'middleman-twig/extension'

  ::Middleman::TwigExtension::Extension
end
