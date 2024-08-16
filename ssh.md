# SSH
remember:  
- public key: encrypt & verify
- private key: decrypt & sign

## tunnel
-L … Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be forwarded to the given host and port, or Unix socket, on the remote side  
-l … Specifies the user to log in as on the remote machine  
-N … Do not execute a remote command  
-f … Requests ssh to go to background just before command execution.  

tunnelling to a device that is directly accessible:
```sh
ssh -L 5901:localhost:5901 -N -f -l <remote_user> <remote_dst>
```

tunelling via hop server:
```sh
ssh -L 127.0.0.1:<port>:<remote_dst>:<port> user@<remote_hop>
```

## using proxyjump
login:
```sh
ssh -J user@<remote_hop> user@<remote_dst>
```

share file:
```sh
scp -o 'Proxyjump user@<remote_hop>' <file> user@<remote_dst>:/<path>
```

### awesome config (auto-proxyjump)
put into `~/.ssh/config`:

```
host <remote_hop>
  HostName <remote_hop_ip>
  User <user_hop>

Host <remote_dst>
  User <user_dst>
  IdentityFile <local_key_file>
  ForwardAgent yes
  ProxyCommand ssh <remote_hop> nc %h %p
```

## mount filesyste using ssh
mount (username):
```sh
sshfs <user>@<rem_ip>:/<rem_path> /<loc_path>
```

mount (user, group):
```sh
sshfs -o debug,sshfs_debug,loglevel=debug,uid=1000,gid=1000 <rem_ip>:/<rem_path> /<loc_path>
```

unmount:
```sh
fusermount -u ~/share`
```