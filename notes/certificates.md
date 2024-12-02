
# certificates file formats

## PEM (Privacy Enhanced Mail)
`.pem` / `.key`  
`.pem` / `.cert` / `.crt`  
(mostly) certificate and privates key saved in one file
 
## DER (Distinguished Encoding Rules)
A .der-file is a base64 encoded binary version of an .pem-file. It is also possible to store separate certificates.  
also: `.cer`

## PFX oder P12
`.p12` / `.pfx`  
This kind of file is also binary formatted und can hold a certificate and well as the path to the private key. It is also possible to store this kind of file password encrypted.

## CSR (Certificate Signing Request)
Request for a digital certificate which contains the public key along with more details about the requesting party.

## super easy to remember ...
There is no real correlation between the file extension and encoding. That means a .crt-file can either be a .der encoded file or .pem encoded file.

## bundles of certificates
Although root certificates exist as single files they can also be combined into a bundle. On Debian based Linux systems these root certificates are stored in the `/etc/ssl/certs` folder along with a file called `ca-certificates.crt`.


# commands
always good to test:
```
curl -L -v <url>
curl --trace-ascii - <url>
```
or try `traceroute <hostname>`

## get cert from remote server
:warning: this is an UNSAFE way to get it
```
echo -n | openssl s_client -showcerts -connect <url>:443 \
  2>/dev/null  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ~/my_trusted_cert.pem
```

## install cert from remote server
```
sudo mv my_trusted_cert.pem /usr/local/share/ca-certificates/my_trusted_cert.crt
sudo update-ca-certificates
```


## read info from cert
```
openssl x509 -inform pem -noout -text -in <file>.pem
```
