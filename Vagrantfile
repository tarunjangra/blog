require 'yaml'
require 'fileutils'


config = {
  local: 'config/vagrant-local.yml',
  example: 'config/vagrant-local.example.yml'
}

# copy config from example if local config not exists
FileUtils.cp config[:example], config[:local] unless File.exist?(config[:local])
# read config
options = YAML.load_file config[:local]

if !options['environment'] then
  options['environment'] = 'dev'
end

options['username'] = 'ubuntu'
options['group'] = 'ubuntu'

# vagrant configurate
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"


# provisioners
config.vm.post_up_message = "Provisioning environment #{options['environment']}"
#config.vm.provision "shell", path: "provision/provision-box.sh", args: [options['timezone'], options['environment'], options['username'], options['group']]
config.vm.provision 'shell', path: 'provision/rvm.sh', args: "stable", privileged: false
config.vm.provision 'shell', path: 'provision/ruby.sh', args: '2.2.7',privileged: false
config.vm.provision 'shell', path: 'provision/ruby.sh', args: '2.2.2 rails haml',privileged: false
config.vm.provision 'shell', path: 'provision/install.sh', args: [options['timezone'], options['environment'], options['username'], options['group']], run: 'always'
# network settings
config.vm.network 'private_network', ip: options['ip']
end


