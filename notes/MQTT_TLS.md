
# certificate file formats

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
generate key with password:
```sh
openssl genrsa -des3 -out server_key.pem 2048
```
generate key without password:
```sh
openssl genrsa -out broker.key 2048
```

# testing with raspberry and odroid

## raspi
run broker:
```sh
sudo mosquitto -v -c /etc/mosquitto/mosquitto.conf
```

publish on localhost:
```sh
mosquitto_pub -d -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h localhost -m hello -t <topic>
```

publish on remote:
```sh
mosquitto_pub -d -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h <hostname_raspi> -m hello -t <topic>
```


## odroid
*very nice*: you can save config files for mosquitto_sub and mosquitto_pub to set default options:
```sh
~/.config/mosquitto_sub
~/.config/mosquitto_pub
```
(one pair "option value" per line)  

### without TLS
```sh
mosquitto_sub -v -t /# -q 2 -F '%t: %X (%l)' -h "<ip_odroid>"
```
 
```sh
echo -ne "\x05" | mosquitto_pub -d -t "<topic>" -h "<ip_odroid>" -s
```

### with TLS
```sh
mosquitto_sub -d -v -q 2 -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h <hostname_odroid> -t "/#" -F '%t: %X (%l)'
```

```sh
echo -ne "\x05" | mosquitto_pub -d -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h <hostname_odroid> -t "<topic>" -s
```

```sh
echo -ne "\x01" | mosquitto_pub -d -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h <hostname_odroid> -t "<topic>" -s
```
(with config)

```sh
echo -ne "\x01" | mosquitto_pub -d -t "<topic>" -s
```

#### receive a file
```sh
mosquitto_sub -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h <hostname_odroid> -t "<topic>" -C 1 > image1.png
```
(with config)  
```sh
`mosquitto_sub -t "<topic>" -C 1 > image1.png
```



# android file paths
remember:
```
"data/user/0/" = "/data/data/"
```

use it:
```kotlin
val path = "/data/data/com.example.mymqtt/files/certificate.pfx"
// "/data/user/0/com.example.mymqtt/files/certificate.pfx"
val path = baseContext.filesDir.absolutePath + "/certificate.pfx"
// "storage/emulated/0/certificate.pfx"
val path = Environment.getExternalStorageDirectory().toString() + "/certificate.pfx" 

// "/data/user/0/com.example.mymqtt/files/"
var myDir =  baseContext.filesDir.absolutePath

val permission = Manifest.permission.READ_EXTERNAL_STORAGE
if (hasNoPermissions(requireContext(), permission)) {
    requestPermissions(arrayOf(permission), requestPermissionCode)
}

private fun hasNoPermissions(context: Context, permission: String): Boolean {
    return (ActivityCompat.checkSelfPermission(context, permission) != PackageManager.PERMISSION_GRANTED)
}
```