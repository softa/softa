module Hercules
  class Triggers
    def self.before_deploy(options)
      FileUtils.mkdir_p './tmp/sockets/'
    end

    def self.after_deploy(options)
      `kill -HUP \`cat /home/hercules/pids/softa.com.br/#{options[:branch]}/unicorn.pid\``
    end
  end
end

