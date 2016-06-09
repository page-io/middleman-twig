# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:twig) do

  require 'tilt'
  require 'twig'
  require 'middleman-twig/extension'
  require 'tilt/twig_template'

  ::Tilt.register Tilt::TwigTemplate, 'twig'
  ::Middleman::TwigExtension::Extension
end
