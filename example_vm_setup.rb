# The object we're going to create
class VM
  # Default assumes no gui
  def initialize(name, type, box, gui)
    @name = name
    @type = type
    @box  = box
    @gui  = gui
  end
  def name()
    return @name
  end
  def type ()
    return @type
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
  VM.new("centos",      "basic", CENTOS_BOX, true),
  VM.new("oraclelinux", "basic", ORACLE_BOX, false),
  VM.new("ubuntu",      "basic", UBUNTU_BOX, false)

]
