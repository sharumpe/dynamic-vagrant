# Load the config
require 'json'
unless File.exists?("vm_setup.json")
  abort("Please create vm_setup.json similar to example_vm_setup.json");
end
VM_LIST = JSON.load(File.read('vm_setup.json'))


# Get profile definitions from here
load 'vm_profiles.rb'


# Define the VMs
Vagrant.configure("2") do |config|
  VM_LIST.each do |vmobj|
    config.vm.define vmobj["name"] do |vmdef|
      send(vmobj["profile"], vmdef, vmobj)
    end
  end
end
