# Instalación de Docker en ubuntu
1. Instalamos docker y docker-compose:
```shell
sudo apt install docker docker-compose
```
2. Añadimos al usuario de ubuntu al grupo docker
```shell
sudo usermod -aG docker $USER
sudo systemctl restart docker
```
3. Podemos comprobar qué imágenes tenemos con:
```shell
  docker images
```
Si te diera el error: **"Got permission denied while trying to connect to the Docker daemon socket..."** será necesario reiniciar el sistema operativo.

Si te diera el error: **"cannot connect to the docker daemon"** es porque hay que arrancar el servicio.
Sigue los siguientes pasos para solucionarlo: 
```shell
systemctl is-active docker
systemctl start docker
systemctl enable docker
```

# Comandos Docker
## Básicos
Listado de imágenes de docker instaladas:
```shell
  docker images
```
Listado de contenedores de docker creados:
```shell
  docker container ls
```
o su alias
```shell
  docker ps
```
