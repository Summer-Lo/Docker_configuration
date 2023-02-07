# Docker_Container_configuration

## Jupyter Notbook / Lab

### 1. Excute Jupyter lab outside container

```
sudo dock exec <container_name> jupyter lab
```

### 2. Self assign Password for jupyter notbook / Lab

jupyter notebook --NotebookApp.token=<password>

```
jupyter notebook --NotebookApp.token=summer
```