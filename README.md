# FSK Analog Project

Done for EG330L at SNHU

# To Quickly Look At the design

Schematic [HERE](https://kicanvas.org/?repo=https://github.com/KenwoodFox/FSK-Project/blob/main/FSK%20Project.kicad_sch)  
PCB [HERE](https://kicanvas.org/?repo=https://github.com/KenwoodFox/FSK-Project/blob/main/FSK%20Project.kicad_pcb)

# To xmit the entire bee movie script
(the only valid benchmark ofc)

```shell
curl -s https://gist.githubusercontent.com/MattIPv4/045239bc27b16b2bcf7a3a9a4648c08a/raw/2411e31293a35f3e565f61e7490a806d4720ea7e/bee%2520movie%2520script | tee /dev/ttyUSB5
```

# Sending Serial/Testing

Configure Serial first

```shell
❯ minicom --device /dev/ttyUSB0 --baudrate 1200
```

Then you can cat+tee into the sender

```shell
❯ cat monk_syllabus.txt | tee /dev/ttyUSB0
```
