# base-app

## Docker
Para correr el proyecto con `docker-compose` hay que tener generado el archivo `.env` o tener las variables de ambientes necesarias
despues ejecutar:
```bash
docker-compose up app
```

Para compilar una imagen de docker ejecutar el siguiente comando agregando de argumento `NODE_ENV:
```bash
docker build -t benitezpump/base-app --build-arg NODE_ENV=production --no-cache .
```

Para correr sin compose se tiene que agregar el valor de la variable `PORT` a los puertos y ejecutar lo siguiente:
ejemplo donde `PORT` es igual a `8080`
```bash
docker run --env-file ./.env -it --rm -p 8000:8000 -p 8080:8080 benitezpump/base-app
```

### Configuracion
Generar un archivo `.env` con las siguientes variables:

| Variables| |
| ------ | ------ |
| DATABASE_HOST | Direccion ip de la base de datos |
| DATABASE_PORT | Puerto de la base de datos |
| DATABASE_NAME | Nombre de la base de datos |
| DATABASE_USERNAME | Usuario de base de datos |
| DATABASE_PASSWORD | Password de base de datos |
| NODE_ENV | ambiente de node necesaria para el build de strapi |
| PORT | Puerto para la api |

### Como debugear el proyecto
Para Debuguear crear en la carpeta `.vscode` un archivo `launch.json` con lo siguiente:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Launch Program",
      "skipFiles": [
        "<node_internals>/**"
      ],
      "program": "${workspaceFolder}/index.ts",
      "preLaunchTask": "tsc: build - tsconfig.json",
      "outFiles": [
        "${workspaceFolder}/dist/**/*.js"
      ],
      "envFile": "${workspaceFolder}/.env"
    }
  ]
}
```