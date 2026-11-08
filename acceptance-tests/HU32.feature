Feature: HU32 - Visualización de información institucional
  Como representante institucional, quiero visualizar los datos registrados de mi establecimiento, para verificar que la información se encuentre actualizada.

  Scenario Outline: Happy path - consulta de información
    Given que la institución "<institucion>" se encuentra registrada
    When el representante accede a su perfil institucional
    Then el sistema muestra los datos correspondientes.

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Unhappy - información no disponible
    Given que ocurre un error de conexión al consultar la institución "<institucion>"
    When el representante consulta los datos
    Then el sistema muestra un mensaje indicando que no fue posible cargar la información.

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Alt - edición de datos
    Given que el representante identifica el dato "<dato>" como información desactualizada
    When selecciona "Editar"
    Then el sistema habilita los campos para modificar los datos institucionales.

    Examples:
      | dato |
      | Nombre institucional |
      | Información de contacto |
      | Datos del establecimiento |
