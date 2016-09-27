require 'json'

# Load the config
unless File.exists?("vm_setup.json")
  abort("Please create vm_setup.json similar to example_vm_setup.json");
end
VM_LIST = JSON.load(File.read('vm_setup.json'))

# Define the VMs
Vagrant.configure("2") do |config|
  VM_LIST.each do |vmobj|
    config.vm.define vmobj["name"] do |vmdef|
      send(vmobj["profile"], vmdef, vmobj)
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
  ref.vm.box = vmobj["box"]
  ref.vm.hostname = vmobj["name"]
  if vmobj["gui"] then
    add_gui(ref)
  end
end
