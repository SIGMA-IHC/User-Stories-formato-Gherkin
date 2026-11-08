Feature: HU35 - Actualización de información de espacios

  Como representante institucional
  Quiero modificar los datos de los espacios registrados
  Para mantener actualizada la información de atención de mi establecimiento

  Scenario Outline: Happy path - actualización exitosa
    Given que el representante modifica el dato "<dato>" de un espacio
    When selecciona "Guardar cambios"
    Then el sistema actualiza la información registrada

    Examples:
      | dato |
      | Nombre del espacio |
      | Tipo de espacio |
      | Información del espacio |

  Scenario Outline: Unhappy - datos inválidos
    Given que el representante ingresa el valor "<valor>" en el campo "<campo>"
    When intenta guardar los cambios
    Then el sistema muestra mensajes de validación
    And bloquea la actualización

    Examples:
      | campo | valor |
      | Nombre del espacio |  |
      | Tipo de espacio | Tipo no válido |
      | Nombre del espacio |     |

  Scenario Outline: Alt - cancelación de cambios
    Given que el representante se encuentra editando el espacio "<espacio>"
    When selecciona "Cancelar"
    Then el sistema descarta las modificaciones
    And conserva los datos anteriores

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |
