module Tilt
  class TwigTemplate < Template

    @@loader = nil
    def self.loader= loader
      @@loader = loader
    end

    @@debug = false
    def self.debug= debug
      @@debug = debug
    end

    @@auto_reload = nil
    def self.auto_reload= auto_reload
      @@auto_reload = auto_reload
    end

    # def initialize_engine
    #   puts 'initialize_engine...'
    # end

    def prepare
      loader = Twig::Loader::Array.new({ file => data })

      if options['paths']
        loader = Twig::Loader::Chain.new([
          loader,
          Twig::Loader::Filesystem.new(options['paths'])
        ])
      elsif !@@loader.nil?
        loader = Twig::Loader::Chain.new([
          loader,
          @@loader
        ])
      end
      @engine = Twig::Environment.new(loader, {
        'debug' => !!@@debug,
        'auto_reload' => !!@@auto_reload,
        'charset' => 'UTF-8',
        'strict_variables' => false,
        'autoescape' => 'html', #'filename',
        'cache' => false,
        'optimizations' => -1
      })
    end

    def evaluate(scope, locals, &block)
      locals = locals.inject({}){ |h,(k,v)| h[k.to_s] = v ; h }

      locals['yield'] = block.nil? ? '' : yield
      locals['content'] = locals['yield']

      @engine.render(file,locals)
    end

    # def precompiled_template(locals)
    #   puts 'precompiled_template...'
    #   nil
    # end
    #
    # def precompiled_preamble(locals)
    #   puts 'precompiled_preamble...'
    #   nil
    # end
    #
    # def precompiled_postamble(locals)
    #   puts 'precompiled_postamble...'
    #   nil
    # end

  end
end
