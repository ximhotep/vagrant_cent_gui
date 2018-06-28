VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :dev do |dev|
    #Currently Disabled for test build
    dev.vm.network :forwarded_port, host: 9000, guest: 9000
    dev.vm.network :forwarded_port, host: 9001, guest: 3306
    dev.vm.provision "shell", path: "bootstrap.sh"
    # dev.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/sonar.yml -c local -v'
    dev.vm.hostname = "karaf-test"
  end
end
