#!ruby
require 'getoptlong'
opts = GetoptLong.new(
  [ '--username', '-u', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--password', '-p', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--agent-name', '-n', GetoptLong::REQUIRED_ARGUMENT ]
)
username = ''
password = ''
agent_name = ''

opts.each do |opt, arg|
  case opt
    when '--username'
      username = arg
    when '--password'
      password = arg
    when '--agent-name'
      agent_name = arg
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.hostname = "tfsbuildagent"
  config.vm.provision "shell", path: "docker.sh", privileged: false
  config.vm.provision "shell", path: "tfsbuildagent.sh", :args => "#{username} #{password} #{agent_name}", privileged: false
end