Feature: HU21 - Inicio de nueva conversación
  Como persona que no conoce lengua de señas, quiero iniciar una nueva conversación desde la aplicación, para comenzar una interacción con una persona con discapacidad auditiva.

  Scenario Outline: Happy path - conversación iniciada
    Given que el usuario accede a la pantalla principal desde "<origen>"
    When selecciona "Nueva conversación"
    Then el sistema habilita el espacio de comunicación.

    Examples:
      | origen |
      | Inicio de la aplicación |
      | Menú principal |
      | Pantalla de conversaciones |

  Scenario Outline: Unhappy - error de inicialización
    Given que ocurre un fallo al iniciar el módulo por "<motivo>"
    When el usuario intenta crear una conversación
    Then el sistema muestra un mensaje de error.
    And permite reintentar.

    Examples:
      | motivo |
      | Error de carga del módulo |
      | Fallo de conexión |
      | Error inesperado |

  Scenario Outline: Alt - retorno a pantalla principal
    Given que el usuario decide cancelar la interacción "<estado>"
    When selecciona "Volver"
    Then el sistema lo dirige nuevamente a la pantalla principal.

    Examples:
      | estado |
      | Antes de enviar mensajes |
      | Al iniciar una conversación |
      | Durante la preparación de la conversación |
