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
