VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "base"

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision :puppet do |puppet|
    puppet.module_path      = "."
    puppet.manifests_path   = "manifests"
    puppet.manifest_file    = "site.pp"
  end

end
