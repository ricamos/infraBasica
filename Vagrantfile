# -*- mode: ruby -*-
# vi: set ft=ruby :
infraGroup = "sgp"

vms = {
  'cntos-ldap-01' => {'memory' => '512', 'cpus' => 1, 'ip' => '110', "image" => "centos/7"},
}

Vagrant.configure('2') do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |k|
      k.vm.box = "#{conf["image"]}"
      k.vm.hostname = "#{name}.sgp.local"
      k.vm.network "public_network", ip: "192.168.0.#{conf['ip']}", bridge: "wlp3s0"
      k.vm.provider 'virtualbox' do |vb|
        vb.name = "#{name}"
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
        vb.customize ["modifyvm", :id, "--groups",'/'+infraGroup]
      end
      k.vm.provider 'libvirt' do |lv|
        lv.memory = conf['memory']
        lv.cpus = conf['cpus']
        lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
      end
    end
  end

  config.vm.provision 'shell', path: 'script.sh'
end
