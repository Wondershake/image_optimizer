class ImageOptimizer
  class JPEGOptimizer < ImageOptimizerBase

  private

    def command_options
      flags = ['-f', '--all-progressive']
      flags << strip
      flags << max_quantity if (0..100).include?(options[:quality])
      flags << quiet if options[:quiet]
      flags << path
      flags.flatten
    end

    def strip
      options[:strip] || '--strip-all'
    end

    def max_quantity
      "--max=#{options[:quality]}"
    end

    def quiet
      '--quiet'
    end

    def extensions
      %w[jpeg jpg]
    end

    def type
      'jpeg'
    end

    def bin_name
      'jpegoptim'
    end

  end
end
