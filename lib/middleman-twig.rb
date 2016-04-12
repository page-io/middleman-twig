# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:twig) do

  require 'twig'
  require 'middleman-twig/extension'

  ::Middleman::TwigExtension::Extension
end
