Feature: HU14 - Envío de mensajes escritos

  Como persona que no conoce lengua de señas
  Quiero enviar mensajes escritos desde la aplicación
  Para transmitir información de manera clara a una persona con discapacidad auditiva

  Scenario Outline: Happy path - envío exitoso
    Given que el usuario ha redactado un mensaje "<mensaje>"
    When selecciona "Enviar"
    Then el sistema muestra el mensaje en el área de conversación

    Examples:
      | mensaje             |
      | Hola, ¿cómo estás?  |
      | Necesito ayuda      |
      | Muchas gracias      |

  Scenario Outline: Unhappy - error de envío
    Given que ocurre un problema de conexión "<problema>"
    When el usuario intenta enviar un mensaje
    Then el sistema muestra una notificación indicando que no pudo enviarse

    Examples:
      | problema              |
      | Sin conexión          |
      | Conexión interrumpida |

  Scenario Outline: Alt - reintento de envío
    Given que un mensaje "<mensaje>" no pudo enviarse
    When el usuario selecciona "Reintentar"
    Then el sistema intenta realizar nuevamente el envío

    Examples:
      | mensaje            |
      | Hola               |
      | Necesito ayuda     |
