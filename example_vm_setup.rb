# The object we're going to create
class VM
  # Default assumes no gui
  def initialize(name, box, gui)
    @name = name
    @box  = box
    @gui  = gui
  end
  def name()
    return @name
  end
  def box()
    return @box
  end
  def gui ()
    return @gui
  end
end


# Box Versions - defaults are set in Vagrantfile
CENTOS_BOX ||= "boxcutter/centos72"
ORACLE_BOX ||= "boxcutter/oraclelinux72"
UBUNTU_BOX ||= "boxcutter/ubuntu1404"


# name, box, has_gui
VM_LIST ||= [
  VM.new("centos",      CENTOS_BOX, true),
  VM.new("oraclelinux", ORACLE_BOX, false),
  VM.new("ubuntu",      UBUNTU_BOX, false)
]
