# SSH

## tunnel
`ssh -L 127.0.0.1:<port>:<remote_dst>:<port> user@<remote_hop>`

## using proxyjump
- `ssh -J user@<remote_hop> user@<remote_dst>`
- `scp -o 'Proxyjump user@<remote_hop>' <file> user@<remote_dst>:/<path>`
