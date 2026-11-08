Feature: HU36 - Eliminación de espacios institucionales

  Como representante institucional
  Quiero eliminar espacios que ya no se encuentran disponibles
  Para mantener actualizado el registro de mi establecimiento

  Scenario Outline: Happy path - eliminación exitosa
    Given que el representante selecciona el espacio registrado "<espacio>"
    When confirma su eliminación
    Then el sistema lo retira del listado

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |

  Scenario Outline: Alt - cancelación de eliminación
    Given que el representante selecciona la opción de eliminar el espacio "<espacio>"
    When cancela la confirmación
    Then el sistema conserva el espacio registrado

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |

  Scenario Outline: Unhappy - error de eliminación
    Given que ocurre un problema al procesar la solicitud del espacio "<espacio>"
    When el representante confirma la eliminación
    Then el sistema muestra un mensaje indicando que no fue posible completar la acción

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |
