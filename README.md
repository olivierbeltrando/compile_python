## Make sure proper packages to compile python are installed

```shell
sudo ./install-packages.sh
```


## Optional: Change the python version in the version.sh

version.sh contains the full version of the python version you want to install.
It is updated now and then to contain latest version of python (currently 3.8.5).

Check https://www.python.org/ for other versions


## Download python

```shell
./download_python_sources.sh
```

## Build python from the sources

```shell
./build-python.sh
```
