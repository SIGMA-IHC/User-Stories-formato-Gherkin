Feature: HU20 - Visualización de mensajes en una conversación
  Como persona que no conoce lengua de señas, quiero visualizar los mensajes enviados y recibidos en un mismo espacio, para mantener el contexto de la comunicación.

  Scenario Outline: Happy path - visualización de conversación
    Given que existen mensajes intercambiados en la conversación "<conversacion>"
    When el usuario accede a la conversación "<conversacion>"
    Then el sistema muestra los mensajes en orden cronológico.

    Examples:
      | conversacion |
      | Consulta académica |
      | Atención en recepción |
      | Orientación universitaria |

  Scenario Outline: Unhappy - conversación vacía
    Given que aún no existen mensajes en la conversación "<conversacion>"
    When el usuario ingresa al módulo de conversación
    Then el sistema muestra una indicación para iniciar la comunicación.

    Examples:
      | conversacion |
      | Conversación nueva |
      | Conversación pendiente |
      | Conversación sin mensajes |

  Scenario Outline: Alt - desplazamiento por mensajes
    Given que existen varios mensajes registrados en la conversación "<conversacion>"
    When el usuario se desplaza por la conversación hacia "<direccion>"
    Then el sistema permite consultar los mensajes anteriores.

    Examples:
      | conversacion | direccion |
      | Consulta académica | el inicio |
      | Atención en recepción | los mensajes anteriores |
      | Orientación universitaria | arriba |
