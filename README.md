# Margarita CMS

| PHP Version | Servicio       | Puerto |
|------------|-------------------|--------|
| 8.3.28     | cms_margarita | 8005   |

<!-- npx gulp -->

Install composer dependecies
```bash
composer install
```

Run project
```
php -S localhost:8005 -t public/
```

## Consideraciones
- La tabla companies columna url_codigo relacionada a la compañia tiene que ser igual a la dirección url incluyendo el puerto donde corre el proyecto ('localhost:PORT') o el nombre del contenedor docker incluyendo el puerto.
- La variable de entorno APP_DOMAIN es la ruta que se usa para construir la ruta para los archivos. ('cms.margarita.com')

