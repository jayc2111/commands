# SSH

## tunnel
`ssh -L 127.0.0.1:<port>:<remote_dst>:<port> user@<remote_hop>`

## using proxyjump
- `ssh -J user@<remote_hop> user@<remote_dst>`
- `scp -o 'Proxyjump user@<remote_hop>' <file> user@<remote_dst>:/<path>`

## mount filesyste using ssh
- `sshfs <user>@<rem_ip>:/<rem_path> /<loc_path>`: mount (username)
- `sshfs -o debug,sshfs_debug,loglevel=debug,uid=1000,gid=1000 <rem_ip>:/<rem_path> /<loc_path>`: mount (user, group)
- `fusermount -u ~/share`: unmount