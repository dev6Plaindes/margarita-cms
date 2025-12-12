
## Función que guarda los inputs

Consulta en [ContentDown.php](./ContentDown.php)

```
public function saveData($request)

```

| Campo              | Descripción                                                     | Valor asignado                                                   |
| ------------------ | --------------------------------------------------------------- | ---------------------------------------------------------------- |
| **id / content**   | Si existe ID, se obtiene el contenido; si no, se crea uno nuevo | `is_numeric($id) ? Content::getContentById($id) : new Content()` |
| **name**           | Nombre o título principal del contenido                         | `$name`                                                          |
| **caption**        | Subtítulo o descripción corta                                   | `$caption`                                                       |
| **description**    | Descripción larga del contenido                                 | `$description`                                                   |
| **price**          | Precio numérico del contenido                                   | `isset($price) ? $price : 0`                                     |
| **boolean**        | Valor booleano convertido a 1 o 0                               | `isset($boolean) ? ($boolean ? 1 : 0) : 0`                       |
| **type_name**      | Tipo de contenido en texto                                      | `isset($type_name) ? $type_name : null`                          |
| **url**            | URL externa o enlace del contenido                              | `$url`                                                           |
| **url_biblioteca** | Ruta o URL almacenada en la biblioteca                          | `$url_biblioteca`                                                |
| **status**         | Estado del contenido (activo/inactivo)                          | `isset($status) ? $status : 0`                                   |
| **company_id**     | ID de la empresa propietaria                                    | `$company_id`                                                    |
| **section_id**     | ID de la sección asociada                                       | `$section_id`                                                    |
| **type_id**        | ID del tipo de contenido                                        | `$type_id`                                                       |
| **order**          | Orden de visualización del contenido                            | `!is_null($order) ? $order : 0`                                  |
| **save()**         | Guarda o actualiza el contenido en BD                           | `$content->save()`                                               |

**Refactorizacion**: Nuevo campo ```url_biblioteca``` \
**Consideraciones**: Para un nuevo campo, crear una columna nueva en la tabla ```Contents```
