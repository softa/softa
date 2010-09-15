module HerculesTriggers
  class Deployer
    def self.before_deploy(options)
      true
    end

    def self.after_deploy(options)
      `kill -HUP \`cat /home/hercules/pids/softa.com.br/#{options[:branch]}/unicorn.pid\``
    end
  end
end

