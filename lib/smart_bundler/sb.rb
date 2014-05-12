module SmartBundler

  class SB
    include SmartBundler::SH

    def initialize
      @finished = false
    end

    def run
      puts "Smart Bundler will recursively install your gems and output the successful bundler output. This may take a while."
      count = 0
      while @finished != true
        result = call_bundle
        failed_gem = parse_output(result)
        install_failed_gem(failed_gem)
        count += 1 unless @finished == true
      end
      puts "#{count} gems"
    end

    def call_bundle
      shell "bundle"
    end

    def install_failed_gem(failed_gem)
      shell "#{failed_gem}"
    end

    def parse_output(result)
      puts result.output
      if result.output.include?("Make sure that `")
        result.output.split("Make sure that `")[1].split("`")[0]
      else
        @finished = true
      end
    end

  end

end
