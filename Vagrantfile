#!ruby
require 'getoptlong'
opts = GetoptLong.new(
  [ '--tfs-url', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--username', '-u', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--password', '-p', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--agent-pool', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--agent-name', '-n', GetoptLong::REQUIRED_ARGUMENT ]
  
)
tfs_url = ''
username = ''
password = ''
agent_pool = ''
agent_name = ''


opts.each do |opt, arg|
  case opt
    when '--tfs-url'
      tfs_url = arg
    when '--username'
      username = arg
    when '--password'
      password = arg
	when '--agent-pool'
      agent_pool = arg
    when '--agent-name'
      agent_name = arg
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.hostname = "tfsbuildagent"
  config.vm.provision "shell", path: "git.sh", privileged: false
  config.vm.provision "shell", path: "docker.sh", privileged: false
  config.vm.provision "shell", path: "clair/setup.sh", privileged: false
  config.vm.provision "shell", path: "tfsbuildagent.sh", :args => "#{username} #{password} #{agent_pool} #{agent_name} #{tfs_url}", privileged: false

  config.trigger.before :destroy do |trigger|
    trigger.warn = "Deregistering agent from TFS"
    trigger.run_remote = { path: "deregister.sh", :args => "#{username} #{password}", privileged: false }
  end
end