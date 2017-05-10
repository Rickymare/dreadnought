Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end


  config.vm.define "lb" do |lb|

    lb.vm.box = "ubuntu/xenial64"
    lb.vm.network :private_network, ip: "192.168.56.20" 
    lb.vm.provision :shell, path: "lb/lb.sh"
    lb.vm.synced_folder "lb/", "/lb"
 
    lb.vm.provider :virtualbox do |v|
      v.name = "lb"
    end

  end


  config.vm.define "web1" do |web1|

    web1.vm.box = "ubuntu/xenial64"
    web1.vm.network :private_network, ip: "192.168.56.10" 
    web1.vm.provision :shell, path: "web1/web1.sh"
    web1.vm.synced_folder "web1/", "/web1"

    web1.vm.provider :virtualbox do |v|
      v.name = "web1"
    end

  end


  config.vm.define "web2" do |web2|

    web2.vm.box = "ubuntu/xenial64"
    web2.vm.network :private_network, ip: "192.168.56.11" 
    web2.vm.provision :shell, path: "web2/web2.sh"
    web2.vm.synced_folder "web2/", "/web2"
 
    web2.vm.provider :virtualbox do |v|
      v.name = "web2"
    end
  
  end


  config.vm.define "data" do |data|

    data.vm.box = "ubuntu/xenial64"
    data.vm.network :private_network, ip: "192.168.56.30" 
    data.vm.provision :shell, path: "data/data.sh"
    data.vm.synced_folder "data/", "/data"

    data.vm.provider :virtualbox do |v|
      v.name = "data"
    end

  end


end
