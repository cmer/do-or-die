# Do Or Die!

**Do Or Die** (DOD) is a simple program that executes 'checks', and can then execute commands whether the check was successful or not. 

For example, it can be used to monitor a host and reboot it remotely if it crashes, or could be used to send an email if a web page changes.

## Concepts

* A configuration file (default: `~/.dod/config.yml`) contains parameters for one or multiple checks.
* Checks are executed one by one at a certain interval, also configured in the configuration file.
* If the check is successful (returning a zero exit code, or `true`), a command is optionally run.
* If the check is unsuccessful (returning a non-zero exit code, or `false`), a command is optionally run.
* Check, success or failure commands can be either a Bash script, or pure Ruby code (executed via Kernel.eval).

## Configuration File

See `config.yml.example` for a sample configuration file.

## CLI Parameters

See Help:

```shell
./do-or-die --help
```

## Included Helper Methods

### Ping

Ping a host.

```ruby
ping '10.0.0.55'
```

### Shell

Shell out and execute shell commands.

```ruby
shell 'dig www.google.com'
```

### HTTP_OK?

Checks if a given URL returns 200.

```ruby
http_ok? 'http://www.mywebsite.com'
```

### Other

For your convenience, DoD included the [`tplink_smarthome_api`](https://github.com/cmer/tplink_smarthome_api) Ruby Gem.

## Deployment

The easiest way to deploy DOD is to use the [Docker image](https://hub.docker.com/r/cmer/do-or-die).

## Requirements

* Ruby 2.5+
* Node.js & [`tplink-smarthome-api`](https://www.npmjs.com/package/tplink-smarthome-api) package (only if you plan on using TP-Link SmartHome commands)


