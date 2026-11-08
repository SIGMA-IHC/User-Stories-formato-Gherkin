Feature: HU34 - Consulta de espacios registrados

  Como representante institucional
  Quiero visualizar los espacios de atención registrados
  Para conocer dónde se encuentra disponible la herramienta dentro de mi establecimiento

  Scenario Outline: Happy path - listado de espacios
    Given que existen espacios registrados en la institución "<institucion>"
    When el representante accede a la sección correspondiente
    Then el sistema muestra el listado de espacios disponibles

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Unhappy - listado vacío
    Given que aún no se han registrado espacios en la institución "<institucion>"
    When el representante ingresa a la sección
    Then el sistema muestra un mensaje indicando que no existen registros

    Examples:
      | institucion |
      | Institución recién registrada |
      | Institución sin espacios |
      | Institución sin espacios activos |

  Scenario Outline: Alt - consulta de detalles
    Given que existen espacios registrados, incluido "<espacio>"
    When el representante selecciona uno
    Then el sistema muestra su información detallada

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |
