Vagrant.configure("2") do |config|
  # Get settings from here
  load "./vm_setup.rb"

  # Defaults in case they're not set up elsewhere
  CENTOS_BOX ||= "boxcutter/centos72"
  ORACLE_BOX ||= "boxcutter/oraclelinux72"
  UBUNTU_BOX ||= "boxcutter/ubuntu1604"

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
