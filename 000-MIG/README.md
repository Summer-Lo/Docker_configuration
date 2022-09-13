# File used for configurating MIG

## Checking nvidia smi and GPUs status
```
nvidia-smi -i 0
```
```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  A100-SXM4-40GB      Off  | 00000000:36:00.0 Off |                    0 |
| N/A   29C    P0    62W / 400W |      0MiB / 40537MiB |      6%      Default |
|                               |                      |             Disabled |
+-------------------------------+----------------------+----------------------+
```

## Enable MIG for GPUs
```
nvidia-smi -i <GPU IDs> -mig 1
```
```
sudo nvidia-smi -i 0 -mig 1
```
Enabled MIG Mode for GPU 00000000:36:00.0
All done.

## List GPU Instance Profiles
### Avabilable instance
```
sudo nvidia-smi mig -lgip
```
```
+-----------------------------------------------------------------------------+
| GPU instance profiles:                                                      |
| GPU   Name             ID    Instances   Memory     P2P    SM    DEC   ENC  |
|                              Free/Total   GiB              CE    JPEG  OFA  |
|=============================================================================|
|   0  MIG 1g.6gb        14     0/4        5.81       No     14     1     0   |
|                                                             1     0     0   |
+-----------------------------------------------------------------------------+
|   0  MIG 1g.6gb+me     21     0/1        5.81       No     14     1     0   |
|                                                             1     1     1   |
+-----------------------------------------------------------------------------+
|   0  MIG 2g.12gb        5     0/2        11.69      No     28     2     0   |
|                                                             2     0     0   |
+-----------------------------------------------------------------------------+
|   0  MIG 4g.24gb        0     0/1        23.50      No     56     4     0   |
|                                                             4     1     1   |
+-----------------------------------------------------------------------------+
```
```
sudo nvidia-smi mig -lgipp
```
```
GPU  0 Profile ID 14 Placements: {0,1,2,3}:1
GPU  0 Profile ID 21 Placements: {0,1,2,3}:1
GPU  0 Profile ID  5 Placements: {0,2}:2
GPU  0 Profile ID  0 Placement : {0}:4
```

### Current status
```
sudo nvidia-smi mig -lgi
```
```
+-------------------------------------------------------+
| GPU instances:                                        |
| GPU   Name             Profile  Instance   Placement  |
|                          ID       ID       Start:Size |
|=======================================================|
|   0  MIG 1g.6gb          14        3          0:1     |
+-------------------------------------------------------+
|   0  MIG 1g.6gb          14        4          1:1     |
+-------------------------------------------------------+
|   0  MIG 1g.6gb          14        5          2:1     |
+-------------------------------------------------------+
|   0  MIG 1g.6gb          14        6          3:1     |
+-------------------------------------------------------+
```

## Creating and Destroying MIG instance
1. Profile ID (e.g. 9, 14, 5)
2. Short name of the profile (e.g. 3g.20gb
3. Full profile name of the instance (e.g. MIG 3g.20gb)

### Creating MIG instance
```
sudo nvidia-smi mig -cgi {ID},{short name} -C
```
creating two instances with ID = 14 and short name = 1g.6gb
```
sudo nvidia-smi mig -cgi 14,1g.6gb -C
```
```
sudo nvidia-smi mig -i <gpu-id> -cgi 14,1g.6gb -C
```

### Destorying MIG instance
Link for destorying the MIG instance
```
https://www.manualslib.com/manual/1925509/Nvidia-Dgx-A100.html?page=85
```
1. Destory the ci first
```
sudo nvidia-smi mig -i <GPU-ID> -gi <GI-ID> -ci <CI-ID> -dci
```
```
sudo nvidia-smi mig -i 0 -gi 3 -ci 0 -dci
```
2. Destory the GI
Destorying id 0, 1, 2
```
sudo nvidia-smi mig -i <gpu-id> -gi <gpu-instance-id> -dgi
```
```
sudo nvidia-smi mig -i 1 -gi 0,1,2 -dgi
```

### Special Config
## Stop Xorg (GPU usage problem)
https://zhuanlan.zhihu.com/p/410580436

