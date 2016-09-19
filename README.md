# dynamic-vagrant
Lets you name your VM instances in an array, rather than duplicating the same definition over and over.

This is intended to be a demonstration and not a production-ready setup.
Some customization will be necessary to fit your environment

## Why?

I had a need to be able to spin up uniquely-named Vagrant VMs so that I could
write Puppet manifests targeted at them.  Other folks work in the same environment
(cloning the same repo) so it was cumbersome/confusing to add new VM blocks to
the Vagrantfile directly.

This lets us keep vm_settings.rb local for each user, separate from the repo, so
each user can have independent sets of named Vagrant VM instances.

## Capabilities

This is still early going.  Right now you can take these to actions in the vm_settings file:
  * Add VMs by name  
```
CENTOS = ["foo","bar"]
UBUNTU = ["fuu","bur"]
```
  * Override Box defaults  
```
CENTOS_BOX = "yourboxname"
```

## Anything else?

If you'd like to contribute, it would be great to be able to add in some other custom config per-vm, for example adding a port forwarding config for "bar" only, or turning on the GUI for "fuu" only.  My Ruby-fu is not good at the moment, so I'm not sure how to inject that sort of thing on top of the dynamic creation of "bar" and "fuu".
