Feature: HU23 - Eliminación de conversaciones

  Como usuario registrado
  Quiero eliminar conversaciones anteriores
  Para mantener organizado mi historial de comunicación

  Scenario Outline: Happy path - eliminación confirmada
    Given que el usuario selecciona la conversación "<conversacion>"
    When confirma la opción "Eliminar"
    Then el sistema retira la conversación del historial

    Examples:
      | conversacion |
      | Consulta de atención |
      | Orientación en recepción |
      | Información académica |

  Scenario Outline: Alt - cancelación de eliminación
    Given que el usuario selecciona eliminar la conversación "<conversacion>"
    When cancela la confirmación
    Then el sistema conserva el registro

    Examples:
      | conversacion |
      | Consulta de atención |
      | Orientación en recepción |
      | Información académica |

  Scenario Outline: Unhappy - error de eliminación
    Given que ocurre un problema al eliminar el registro "<conversacion>"
    When el usuario confirma la acción
    Then el sistema muestra un mensaje indicando que no fue posible completar la operación

    Examples:
      | conversacion |
      | Consulta de atención |
      | Orientación en recepción |
      | Información académica |
