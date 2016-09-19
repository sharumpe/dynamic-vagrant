Vagrant.configure("2") do |config|
  # CENTOS = ENV['vg_centos_list'].split(",")
  # UBUNTU = ENV['vg_ubuntu_list'].split(",")

  load "./vm_setup.rb"

  CENTOS_BOX ||= "wwueis/centos-7.2"
  ORACLE_BOX ||= "wwueis/oraclelinux-7.2"
  UBUNTU_BOX ||= "wwueis/ubuntu-16.04"

  CENTOS.each do |i|
    ## CentOS VMs
    config.vm.define "#{i}" do |vmdef|
      vmdef.vm.box = CENTOS_BOX
      vmdef.vm.hostname = "#{i}"
    end
  end

  ORACLE.each do |i|
    ## Ubuntu VMs
    config.vm.define "#{i}" do |vmdef|
      vmdef.vm.box = ORACLE_BOX
      vmdef.vm.hostname = "#{i}"
    end
  end

  UBUNTU.each do |i|
    ## Ubuntu VMs
    config.vm.define "#{i}" do |vmdef|
      vmdef.vm.box = UBUNTU_BOX
      vmdef.vm.hostname = "#{i}"
    end
  end

end
