Feature: HU15 - Visualización de respuestas mediante texto

  Como persona que no conoce lengua de señas
  Quiero visualizar las respuestas escritas de la otra persona
  Para comprender sus mensajes durante la interacción

  Scenario Outline: Happy path - recepción de respuesta
    Given que el sistema dispone de una representación visual correspondiente al mensaje "<mensaje>"
    When procesa la respuesta
    Then muestra el recurso visual asociado

    Examples:
      | mensaje        |
      | Hola           |
      | Gracias        |
      | Buenos días    |

  Scenario Outline: Unhappy - respuesta no disponible
    Given que ocurre un error al recibir el mensaje debido a "<problema>"
    When el usuario consulta la conversación
    Then el sistema indica que no fue posible cargar la respuesta

    Examples:
      | problema              |
      | Error de conexión     |
      | Recepción interrumpida |

  Scenario Outline: Preferencia - visualización de mensajes
    Given que el usuario desea diferenciar los mensajes de cada participante
    When visualiza la conversación con "<participante>"
    Then el sistema presenta los mensajes con una separación visual clara

    Examples:
      | participante |
      | Usuario 1    |
      | Usuario 2    |
