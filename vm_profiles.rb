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

# This profile sets up the VM with a puppet provisioner
# that will connect to pup_server using environment pup_env.
# The provisioner does the initial puppet agent run when
# you do `vagrant up` or `vagrant provision`
def puppet_client(vmdef, vmobj)
  # Start with the basics
  basic(vmdef,vmobj)

  puppet_server      = vmobj["pup_server"]
  puppet_environment = vmobj["pup_env"]

  # Set the puppet server
  vmdef.vm.provision "shell",
    inline: "puppet config set server #{puppet_server}"

  # Set the puppet environment
  vmdef.vm.provision "shell",
    inline: "puppet config set --section agent environment #{puppet_environment}"

  # Use a local puppetmaster
  vmdef.vm.provision 'puppet_server' do |puppet|
    puppet.puppet_server = puppet_server
    puppet.options = '--test'
  end

  # Remove puppet certificate on destroy
  # NOTE: this requires that you're able to run this sudo command
  # without supplying a password. This is left for demonstration
  # purposes
  vmdef.trigger.after :destroy do |trigger|
    trigger.info = "Cleaning node #{vmdef.vm.hostname}.localdomain from #{puppet_server}"
    trigger.run = {
      inline: "ssh #{puppet_server} sudo puppet node clean #{vmdef.vm.hostname}.localdomain"
    }
  end
  vmdef.trigger.before :up do |trigger|
    hostname = vmdef.vm.hostname
    trigger.info = "Starting up #{hostname}"
  end
end