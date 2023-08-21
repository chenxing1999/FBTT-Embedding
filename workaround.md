
0. Follow original README (download cub and put it in this folder, change sm_code in `setup.py`)
1. Edit docker file if you need another python version
2. Build docker 
```shell
DOCKER_BUILDKIT=1 docker build . -t tmp:latest
```
3. Try
```shell
docker run --gpus 1 --rm tmp:latest python tt_embeddings_benchmark.py
```

4. Build a wheel in Docker image if you want
```shell
# Outside docker container
docker run --gpus 1 -it --rm tmp:latest

# inside docker container
pip install -U wheel setuptools
python setup.py -q sdist bdist_wheel
```

5. Start a new shell and copy wheel to outside
```shell

# outside docker 
mkdir result/
cd result/

# Use docker container ls to get container name
docker cp <container_name>:/mnt/lib ./
```
6. Install and test
```shell
pip install dist/<wheel name> torch
python tt_embeddings_benchmark.py
```
