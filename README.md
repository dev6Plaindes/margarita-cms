# Margarita CMS

| PHP Version | Servicio       | Puerto |
|------------|-------------------|--------|
| 8.3.28     | cms_margarita | 8086   |

<!-- npx gulp -->

Install composer dependecies
```bash
composer install
```

Run project
```
php -S localhost:8010 -t public/
```

## Consideraciones
- La tabla companies columna url_codigo relacionada a la compañia tiene que ser igual a la dirección url incluyendo el puerto donde corre el proyecto ('localhost:PORT') o el nombre del contenedor docker incluyendo el puerto.
- La variable de entorno APP_DOMAIN es la ruta que se usa para construir la ruta para los archivos, el dominio en el que servira la aplicacion ('cms.margarita.com') o localhost(no el nombre del contenedor docker)

## Uso Variable de entorno

Company.php
```
public function getCompanyByUrl()
$_ENV['APP_DOMAIN']
```

## Construccion de URL para imagenes
Consulta en [README model](./app/Model/README.md)

## Frontend - Inputs de Formulario
Consulta en [Inputs index.twig](./views/admin/sections/README.md)

## Backend
- **Guardar campos de los inputs:** Consulta [Aqui](./app/Down/Save%20values%20Inputs.md)

- **Retorna valores guardados:** Consulta [Aqui](./app/Down/Return%20values.md)