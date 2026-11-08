Feature: HU23 - Eliminación de conversaciones
  Como usuario registrado, quiero eliminar conversaciones anteriores, para mantener organizado mi historial de comunicación.

  Scenario Outline: Happy path - eliminación confirmada
    Given que el usuario selecciona la conversación "<conversacion>"
    When confirma la opción "Eliminar"
    Then el sistema retira la conversación del historial.

    Examples:
      | conversacion |
      | Consulta académica |
      | Atención en recepción |
      | Orientación universitaria |

  Scenario Outline: Alt - cancelación de eliminación
    Given que el usuario selecciona eliminar la conversación "<conversacion>"
    When cancela la confirmación
    Then el sistema conserva el registro.

    Examples:
      | conversacion |
      | Consulta académica |
      | Atención en recepción |
      | Orientación universitaria |

  Scenario Outline: Unhappy - error de eliminación
    Given que ocurre un problema al eliminar el registro "<conversacion>"
    When el usuario confirma la acción
    Then el sistema muestra un mensaje indicando que no fue posible completar la operación.

    Examples:
      | conversacion |
      | Consulta académica |
      | Atención en recepción |
      | Orientación universitaria |
