

## Inputs index2.twig
Genera formulario apartir del json registrado en la Base de datos

**Table BD:** contents_types \
**ID:** 106\
**name:** Productos

## Campos soportados
| Campo (`settings.X`) | name HTML          | Descripción                        |
| -------------------- | ------------------ | ---------------------------------- |
| `name`               | `"name"`           | Título del contenido.              |
| `caption`            | `"caption"`        | Subtítulo o caption.               |
| `url`                | `"url"`            | Enlace externo.                    |
| `url_biblioteca`     | `"url_biblioteca"` | Enlace a biblioteca.               |
| `description`        | `"description"`    | Descripción del contenido.         |
| `price`              | `"price"`          | Precio numérico.                   |
| `boolean`            | `"boolean"`        | Campo booleano (activo/inactivo).  |
| `type_name`          | `"type_name"`      | Tipo de contenido.                 |
| `colors`             | *(no name)*        | Colección de colores.              |
| `images`             | *(no name)*        | Colección de imágenes.             |
| `files`              | `"files[]"`        | Colección de archivos (múltiples). |

## Formularios
- Productos > Editar Contenido
