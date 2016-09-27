# dynamic-vagrant
Lets you name your VM instances in an array, rather than duplicating the same definition over and over.

This is intended to be a demonstration and not a production-ready setup.
Some customization will be necessary to fit your environment

## Why?

I had a need to be able to spin up uniquely-named Vagrant VMs so that I could
write Puppet manifests targeted at them.  Other folks work in the same environment
(cloning the same repo) so it was cumbersome/confusing to add new VM blocks to
the Vagrantfile directly.

This lets us keep `vm_setup.json` local for each user, separate from the repo, so
each user can have independent sets of named Vagrant VM instances.

## Capabilities

### Dynamic VM setup

The setup is now in JSON, and does not require a Ruby object definition.
So you can define your VMs as an array of (json) objects:
```
[
  {
    "name": "centos",
    "box": "boxcutter/centos72",
    "gui": false,
    "profile": "basic"
  },
  ...
]
```

### Profile declaration

The profiles are defined in `vm_profiles.rb`.  This keeps `Vagrantfile` pretty
much change-free, and makes for very flexible configurations.

## Anything else?

### Update 2016-09-26:
I have refactored a lot of things so that the VM list is now an array of objects. As an example, I can now set the `gui` variable so that the box gets a gui or not, but it should be able to be extended to add whatever other information makes sense.

### Original:
If you'd like to contribute, it would be great to be able to add in some other custom config per-vm, for example adding a port forwarding config for "bar" only, or turning on the GUI for "fuu" only.  My Ruby-fu is not good at the moment, so I'm not sure how to inject that sort of thing on top of the dynamic creation of "bar" and "fuu".
