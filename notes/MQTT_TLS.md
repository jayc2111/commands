
# Formate

## PEM (Privacy Enhanced Mail)
.pem / .key
.pem / .cert / .crt 
(meist) wenn sowohl Zertifikate und der Privatschlüssel in einer Datei gespeichert werden
 
## DER (Distinguished Encoding Rules)
Bei einer .der-Datei handelt es sich um die binäre Form der Base64-kodierten .pem-Datei. Dieses Format unterstützt die Speicherung eines einzelnen Zertifikats.
auch: .cer

## PFX oder P12
.p12 / .pfx
Das binäre Format kann neben dem Zertifikat auch alle Zertifikate des Zertifizierungspfads und zudem den privaten Schlüssel enthalten. Alles in einer Datei. Darüber hinaus ist es möglich die  Datei passwortgeschützt zu speichern. Als Dateiendungen kommen .pfx oder .p12

## CSR (Certificate Signing Request)
Anfordern eines digitalen Zertifikats und enthält den öffentlichen Schlüssel und weiteren Angaben über den Antragsteller

## super easy to remember ...
There is no real correlation between the file extension and encoding. That means a .crt file can either be a .der encoded file or .pem encoded file.

## bundles of certificates
Although root certificates exist as single files they can also be combined into a bundle. On Debian based Linux systems these root certificates are stored in the /etc/ssl/certs folder along with a file called ca-certificates.crt.


# Kommandos
*generate key with password*: `openssl genrsa -des3 -out server_key.pem 2048` <br>
*generate key without password*: `openssl genrsa -out broker.key 2048`


  
# raspberry local test
broker: `sudo mosquitto -v -c /etc/mosquitto/mosquitto.conf`
client: `mosquitto_pub -d -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h localhost -m hello -t /world`
client: `mosquitto_pub -d -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h raspi3 -m hello -t /world`


# odroid test
very nice: you can save config files for mosquitto_sub and mosquitto_pub to set default options:
`~/.config/mosquitto_sub`
`~/.config/mosquitto_pub`
(one pair of option value per line)

## without TLS
`mosquitto_sub -v -t /motionCmd/# -t /userInteraction/# -q 2 -F '%t: %X (%l)' -h "192.168.2.137"`
`echo -ne "\x05" | mosquitto_pub -d -t "/motion/status" -h "192.168.2.137" -s`

## with TLS
`mosquitto_sub -d -v -q 2 -p 8883 --cafile ../ca/ca.crt --cert client.crt --key client.key -h odroidc4 -t "/#" -F '%t: %X (%l)'`
`echo -ne "\x05" | mosquitto_pub -d -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h odroidc4 -t "/motion/status" -s`
`echo -ne "\x01" | mosquitto_pub -d -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h odroidc4 -t "/immersiveOff" -s`
(with config)
`echo -ne "\x01" | mosquitto_pub -d -t "/motion/status" -s`

### receive a file
`mosquitto_sub -q 2 -p 8883 --cafile ca.crt --cert client.crt --key client.key -h odroidc4 -t "/map" -C 1 > image1.png`
(with config)
`mosquitto_sub -t "/map" -C 1 > image1.png`



# android file paths

```kotlin
"data/user/0/" = "/data/data/"

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