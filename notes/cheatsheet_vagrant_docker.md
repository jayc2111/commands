# vagrant

| description | command |
| - | - |
| create & start machine       | `vagrant up` |
| open shell on machine        | `vagrant ssh` |
| suspend machine              | `vagrant suspend` |
| resume machine               | `vagrant resume` |
| remove machine completely    | `vagrant destroy` |
| stop machine                 | `vagrant halt` |
| spit out current ssh config  | `vagrant ssh-config` |
| load local file into machine | `vagrant upload localfile` |
| install VBox guest additons  | `vagrant plugin install vagrant-vbguest` |


# Vagrant on Windows: testing kernel modules
`sudo modprobe snd_intel8x0`  
`modprobe --show-depends snd_intel8x0`  
`journalctl -b`  

## don't forget
 - un-blacklist driver & reboot
 - turn on microphone on alsamixer
 - check `audioin` and `audioout` setting in the VBox


## find matching audio driver
```sh
basename -s ".ko" $(find /lib/modules/$(uname -r) -type f -name "*.ko"  | grep snd | grep via)
```
for a sound device:
```sh
basename -s ".ko" $(find /lib/modules/$(uname -r)/kernel/sound -type f -name "*.ko")
```

 
# docker
| description | command |
| - | - |
| list all available images | `docker images` |
| list all available containers | `docker ps -a` |
| create image from Dockerfile | `docker build -t"name:tag" <path_to_dockerfile>` |
| run image | `docker run -it <image_name>` |
| run image shell | `docker run -it --entrypoint bash <image_name>` |
| reboot container | `docker restart <container_name>` |
| enter running container | `docker exec -u 0 -it <container_name> bash` |
| start a stopped container w. output | `docker start -ai container_name` |
| check authentification | `docker login <hostname>` |


# rasa

## training
```
rasa train -v --data data/option3/ --domain data/option3/
rasa train -v -c ../config.yml
```

### check
```
rasa data validate --data data/option3/ --domain data/option3/
rasa data validate -v -c ../config.yml
```



## running
```
rasa run -v --cors "*"
```
```
rasa run actions
```

## testing
### working:
```
rasa test -vv -m models/option3.tar.gz --nlu data/option3 --domain data/option3/ --stories tests/option3/
rasa test -v -m ../../models/option3.tar.gz --nlu . --domain . --stories ../../tests/option3/ -c ../../config.yml
rasa test -vv -m models/option3.tar.gz --stories tests/
```
```
rasa test nlu --domain data/
```
```
rasa test core --stories tests/
```

