# SSH
remember:  
- public key: encrypt & verify
- private key: decrypt & sign

## tunnel
-L … Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be forwarded to the given host and port, or Unix socket, on the remote side  
-l … Specifies the user to log in as on the remote machine  
-N … Do not execute a remote command  
-f … Requests ssh to go to background just before command execution.  

- `ssh -L 5901:localhost:5901 -N -f -l <remote_user> <remote_dst>`: tunnelling to a device that is directly accessible
- `ssh -L 127.0.0.1:<port>:<remote_dst>:<port> user@<remote_hop>`: tunnelling via hop server

## using proxyjump
- `ssh -J user@<remote_hop> user@<remote_dst>`
- `scp -o 'Proxyjump user@<remote_hop>' <file> user@<remote_dst>:/<path>`

## mount filesyste using ssh
- `sshfs <user>@<rem_ip>:/<rem_path> /<loc_path>`: mount (username)
- `sshfs -o debug,sshfs_debug,loglevel=debug,uid=1000,gid=1000 <rem_ip>:/<rem_path> /<loc_path>`: mount (user, group)
- `fusermount -u ~/share`: unmount