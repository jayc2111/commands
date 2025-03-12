



############# prevent terminating command to send EOF to named pipes
# https://superuser.com/questions/766414/how-to-prevent-terminating-command-to-send-eof-to-named-pipes

echo "fifo_with_exec"

command="cat"

# create ro-variable with temporary unique filename
# (using option -u does not create a file)
readonly TMP_PIPE=$(mktemp -u)

# create a fifo (on the new filename)
if [[ ! -p $TMP_PIPE ]]; then
    mkfifo -m 600 ${TMP_PIPE}
fi

echo "-> pipe created:  ${TMP_PIPE}"

# Here is the important bit - keep a handle open to the pipe
exec 9<> ${TMP_PIPE}

# run the command with pipe as input
$command < ${TMP_PIPE} &
pr_pid=$!
echo "-> process pid: ${pr_pid}"

read -n 1 -p 'give input to pipe:' dummyvar

# clean up when script exits
rm $TMP_PIPE


### about exec
# exec 3< thisfile          # open "thisfile" for reading on file descriptor 3
# exec 4> thatfile          # open "thatfile" for writing on file descriptor 4
  # exec 8<> tother           # open "tother" for reading and writing on fd 8
# exec 6>> other            # open "other" for appending on file descriptor 6
# exec 5<&0                 # copy read file descriptor 0 onto file descriptor 5
# exec 7>&4                 # copy write file descriptor 4 onto 7
# exec 3<&-                 # close the read file descriptor 3
# exec 6>&-                 # close the write file descriptor 6