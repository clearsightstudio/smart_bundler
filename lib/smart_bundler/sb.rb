module SmartBundler
  class SB

    def initialize
      @finished = false
    end

    def run
      while @finished != true
        output = call_bundle
        failed_gem = parse_output(output)
        install_failed_gem(failed_gem)
      end
    end

    def call_bundle
      sh "bundle"
    end

    def install_failed_gem(failed_gem)
      sh "#{failed_gem}"
    end

    def parse_output(output)
      if output.include?("Make sure that `")
        output.split("Make sure that `")[1].split("`")[0]
      else
        @finished = true
      end
    end

  end
  
end
