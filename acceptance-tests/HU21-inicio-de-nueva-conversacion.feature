Feature: HU21 - Inicio de nueva conversación

  Como persona que no conoce lengua de señas
  Quiero iniciar una nueva conversación desde la aplicación
  Para comenzar una interacción con una persona con discapacidad auditiva

  Scenario Outline: Happy path - conversación iniciada
    Given que el usuario accede a la pantalla principal desde "<origen>"
    When selecciona "Nueva conversación"
    Then el sistema habilita el espacio de comunicación

    Examples:
      | origen |
      | Inicio de la aplicación |
      | Menú principal |
      | Pantalla de conversaciones |

  Scenario Outline: Unhappy - error de inicialización
    Given que ocurre un fallo al iniciar el módulo por "<motivo>"
    When el usuario intenta crear una conversación
    Then el sistema muestra un mensaje de error
    And permite reintentar

    Examples:
      | motivo |
      | Error de carga |
      | Fallo de conexión |
      | Error inesperado |

  Scenario Outline: Alt - retorno a pantalla principal
    Given que el usuario decide cancelar la interacción durante "<momento>"
    When selecciona "Volver"
    Then el sistema lo dirige nuevamente a la pantalla principal

    Examples:
      | momento |
      | Antes de iniciar la conversación |
      | Al preparar la conversación |
      | Antes de enviar el primer mensaje |
