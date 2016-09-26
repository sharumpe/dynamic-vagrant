Vagrant.configure("2") do |config|
  unless File.exists?("vm_setup.rb")
    abort("Please create vm_setup.rb similar to example_vm_setup.rb");
  end

  # Get settings from here
  load "vm_setup.rb"

  ## CentOS VMs
  VM_LIST.each do |vmobj|
    config.vm.define "#{vmobj.name}" do |vmdef|
      basic(vmdef, vmobj)
    end
  end

end


#
# Helper Method Definitions
#

def add_gui(ref)
  ref.vm.provider "vmware_fusion" do |vmf|
    vmf.gui = true
  end
end


#
# Profile definitions
#

def basic(ref, vmobj)
  ref.vm.box = vmobj.box
  ref.vm.hostname = vmobj.name
  if vmobj.gui then
    add_gui(ref)
  end
end
