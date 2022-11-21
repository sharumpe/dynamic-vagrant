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

```json
[
  {
    "name": "rocky",
    "box": "rockylinux/8",
    "gui": false,
    "profile": "puppet_client"
  },
  ...
]
```

For use with puppet, you can set a couple more parameters in the json object and vagrant
will run a puppet provisioner when the VM is first spun up.

```json
[
  {
    "name": "rocky",
    "box": "rockylinux/8",
    "gui": false,
    "profile": "puppet_client",
    "pup_server": "puppet.domain.com",
    "pup_env": "production"
  },
  ...
]
```

### Profile declaration

The profiles are defined in `vm_profiles.rb`.  This keeps `Vagrantfile` pretty
much change-free, and makes for very flexible configurations.
