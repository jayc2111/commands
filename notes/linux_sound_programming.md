# quick refs
## abrevs
| word  | definition  |
|-------|-------------|
| ALSA  | advanced linux sound architecture     |
| JACK  | Jack Audio Connection Kit     |
| MIDI  | Musical Instrument Digital Interface:<br>It’s a protocol that allows computers, musical instruments and other hardware to communicate.  |
| PCM   | pulse code modulation|



## keywords
| word  | definition  |
|-------|-------------|
| SOX       | change audio file formats, channels, volume, sample rate. Merging, splitting files as well                                         |
| FFmpeg    | mainly used to change formats. It can also record directly from the soundcard or stream to a IP socket.                            |
| GStreamer | is used to build up more complex "pipelines" of processing.<br>Example for a pipeline: record - mix - play - stream at the same time. |
| Audacity  | is THE free audio file editor and recorder                                                                                         |

# basics on sound 
[This link](https://manual.audacityteam.org/man/digital_audio.html) is a good reference about audio files formats.

## sound processing building blocks in linux
Device Drivers &rarr; soundservers &rarr; "sound giving applications" (media players/ web browsers)


# ALSA:
- ALSA is both a set of APIs to talk to sound cards and a set of user-level applications, built of course using the ALSA API.
- operate a soundcard: Low level driver, perform mixing either on SW or HW (depending config and capabilities)
- up to 8 hardware devices (+MIDI functionality in some cases)
- [This link](https://www.volkerschatz.com/noise/alsa.html) is really very detailled and provides all basics for using alsa devices

## tools:
| name  | purpose  |
|-------|-------------|
| `alsamixer`/`amixer` | setting volume of input/ output channels |
| `aplay` | play basic sound file (not compressed!) |
| `arecord` | audio recorder |
| `alsactl` | command interface tool (e.g. store a specific configureation, ...) |
| `speakertest` | used to play test sound to various speakers |

also useful: `alsa-info`

## identifying audio devices
### hardware devices (soundcards)
**generally use**: `aplay -l` and `arecord -l`  
**hierarchal order**: soundcard &rarr; device &rarr; subdevices  
Cards are not that important - in most cases we work on devices. Devices can be opened independently. The subdevices are often used to distinguish between channels.
They are usually identified like "hw:1,2,5" = soundcard no.1, device 2, subdevice 5  
**PCM parameters**: 
  1. sample formats
  1. sample rates
  1. channels count

(not every soundcards can support every combination of values for there three)  
&rarr; In some cases, those parameters depend on each other and the order in which they have been set.  
To learn about the configuration space of your sound card, use `alsacap` tool

### Alsa devices (aliases)
**generally use**: `aplay -L` and `arecord -L`  
Individual sources and sinks can also be referred by aliases. The named commands will list all aliases (see also the asound\* config files). This is like an additional abstraction layer. The main advantage of this, is that you don't need to handle the cumbersome names and an alias can cover several devices. For example, you want to play something on *surround21* and you don't want to care about which sound card is current connected, you can use this alias.

... can also be wrapper for plugins ...


## alsa configuration
"things are not so simple: Some sound cards cannot combine all sample formats with all sampling rates or channel counts."

'pcm.!default' is the default audio output (for applications running on Linux)

### important files
There are 3 levels:
  1. Alsa base config file: `/usr/share/alsa/alsa.conf`
&rarr; There can be more files and folders in the same directory with soundcard and plugin specific configurations. 
  2. System wide config file: `/etc/asound.conf` (`/etc/asoundrc` on older systems?)
  3. user specific configuration: `~/.asoundrc`

**important**
- Config files in `/usr/share/alsa/` shall not be edited
- All configuration files are parsed every time an ALSA device is opened 
  &rarr; Changes take effect immediately, no need for restarting
- All configuration files share the same format

### interfaces
pcm   &rarr; play music
ctl   &rarr; controling hardware
mixer &rarr; loudness adjustment
amidi &rarr; midi controls
Imagine you want to create an ALSA PCM device which accesses your first sound card and does format conversion as needed:
```bash
# example PCM device to output sound 
pcm.plug0 {
  type plug
  slave {
    pcm "hw:0,0"
  }
}
```

## plugins
|plugin name| alsa device name| description|
|-|-|-|
| hw  |`hw` | does 'nothing else', it only accesses the hardware|
| plug |`plughw` or `plug`  | automatic format conversion (always use this if a certain combination of the PCM parameters is not supported)|
| file |`file` or `tee`| `aplay -Dtee:\'plughw:0,0\',/tmp/alsatee.out,raw xy.wav` = play xy.wav on first sound card and save it raw into alsatee.out|
| route | .. | arbitrarily assign channels, several slave devices |
| multi | .. | reroute channels or mix them |
| dmix | .. | mixes audio signals, client is shared by several software sources|
| dshare | .. | assigns channels among the SW clients |
| duplex | .. | facilitates audio playing and recording at the same time|
| Dsnooper | .. | mixes audio signals from several microphones|
| pulse | .. | bypass to pulse audio|

## some links
- A close look at ALSA: https://www.volkerschatz.com/noise/alsa.html
- sound troubleshooting: https://en.wikibooks.org/wiki/Configuring_Sound_on_Linux/ALSA/Troubleshooting

# PulseAudio
- "the catch-all layer for Linux audio applications"
- Unlike ALSA, PulseAudio can run on multiple operating systems.
- PulseAudio configures itself as a virtual device connected to ALSA. This makes PulseAudio more like Jack, because it sits between ALSA and the desktop, piping data back and forth transparently.
- For example, you can adjust the relative volume of every application passing through PulseAudio, regardless of whether that application features its own slider or not.
- It's hard to stop pulseaudio since it spawn new instance upon deletion. use `pasuspender -- jackd` to suspend pulse audio and run jack (on the sound drivers)
- *programming*: either use simple or asynchronous API<br>
 Simple is really simple but introduces a lot of delay. The async API is really complicated since almost every operation is event driven and you have to register millions of callbacks. Several threads need to be orchastrated.
## related tools:
- settings: _pavucontrol_ (device level mixer)
- command line tools: _pactl_/ _pacmd_ (listing devices, loading special modules, ...) <br>
  `pactl load-module module-loopback latency_msec=1` do a loopback from default in to default out


# Jack
- "professional sound routing and mixing application"
- build for low-latency (< 2ms)
- supports adding audio effects in realtime since it runs using the realtime scheduler by default (either with root permissions or add user to groups `audio` and `jackuser`)
- unlike PulseAudio, jack is no systemD unit
- there is only one jack server but several jack plugins (work may be distributed across a number of threads)
- all processing in jack is multithreaded using POSIX threads
- audacity is "jack-aware"
- all data is 32 bit float mono audio

## running 
- remember to suspend PulseAudio
- specify the soundcard you want to work with `jackd -dalsa -d hw:0,3`
- configuration is done using `qjackctl`


# GStreamer
- "Multimedia framework on top of PulseAudio"
- Can but used for audio and video processing
- Link to many straight forward tutorials: http://gstreamer.freedesktop.org/documentation/
- user guide to create own plugins: https://gstreamer.freedesktop.org/data/doc/gstreamer/head/pwg/html/index.html
## what is does
GStreamer creates so called "pipeline" that consist of consecutive building blocks. Each block can be a source, a sink or a filter. Interfaces between the building blocks, the so called "Elements", are called "pads". pads may be created dynamically.

In general, elements ...
- can have _states_ &rarr; GST_STATE_NULL, GST_STATE_READY, GST_STATE_PAUSED, GST_STATE_PLAYING
- Elements can emit _events_ &rarr; connected via specific signals
- are contained in _plugins_ (plugins can hold one or more)
## CLI
### overview
|command| purpose |
|-|-|
| gst-inspect | list plugins and elements. Can also show details on individual plugins or elements |
| gst-discoverer | get infos on a file |
| gst-device-monitor | get infos on your hardware devices |
| gst-play | simply play a file or an URI |
| gst-launch | launch a pipeline - separate elements via "!" |
&rarr; there are equivalents for several programming languages available

### simple example
play a wav file
```bash
gst-launch-1.0 filesrc location=test.wav ! wavparse ! alsasink
```


# FFmpeg/Libav
Both are also multi-purpose libs and tools (recording, streaming, converting digital audio and video). They have a common history but Libav forked in 2011. The user API is not very stable on both. Examples to convert a file:

```bash
ffmpeg -i file.ogg file.mp3
```
or
```bash
avconv -i file.ogg file.mp3
```
Other useful tools: `ffprobe` (gives information about a file), `ffplay` (simple player), `ffserver` (media server)

Using both in plain C-Code is quite complicated since a number of API calls is needed e.g. to unwrap an mp3 (to cover all possible version of an mp3 file). Not straight forward and function signatures containing the version of the function :-(





