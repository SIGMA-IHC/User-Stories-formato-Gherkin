Feature: HU20 - Visualización de mensajes en una conversación

  Como persona que no conoce lengua de señas
  Quiero visualizar los mensajes enviados y recibidos en un mismo espacio
  Para mantener el contexto de la comunicación

  Scenario Outline: Happy path - visualización de conversación
    Given que existen mensajes intercambiados en la conversación "<conversacion>"
    When el usuario accede a la conversación "<conversacion>"
    Then el sistema muestra los mensajes en orden cronológico

    Examples:
      | conversacion |
      | Consulta de atención |
      | Orientación en recepción |
      | Información académica |

  Scenario Outline: Unhappy - conversación vacía
    Given que aún no existen mensajes en la conversación "<conversacion>"
    When el usuario ingresa al módulo de comunicación
    Then el sistema muestra una indicación para iniciar la comunicación

    Examples:
      | conversacion |
      | Conversación nueva |
      | Conversación sin mensajes |
      | Conversación recién creada |

  Scenario Outline: Alt - desplazamiento por mensajes
    Given que existen varios mensajes registrados en la conversación "<conversacion>"
    When el usuario se desplaza por la conversación hacia "<direccion>"
    Then el sistema permite consultar los mensajes anteriores

    Examples:
      | conversacion | direccion |
      | Consulta de atención | los mensajes anteriores |
      | Orientación en recepción | el inicio de la conversación |
      | Información académica | arriba |
