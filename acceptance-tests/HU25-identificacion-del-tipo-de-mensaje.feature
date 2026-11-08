Feature: HU25 - Identificación del tipo de mensaje

  Como usuario de Sigma
  Quiero diferenciar visualmente los mensajes escritos de los resultados obtenidos mediante reconocimiento de señas
  Para comprender el origen de cada contenido

  Scenario Outline: Happy path - identificación visual
    Given que existen mensajes de diferentes tipos, como "<tipo_mensaje>"
    When el usuario visualiza la conversación
    Then el sistema diferencia los mensajes mediante etiquetas o elementos visuales

    Examples:
      | tipo_mensaje |
      | Mensaje escrito |
      | Resultado de reconocimiento de señas |
      | Mensaje enviado y resultado reconocido |

  Scenario Outline: Unhappy - tipo de mensaje no identificado
    Given que el sistema no logra determinar el origen del contenido "<contenido>"
    When lo muestra en la conversación
    Then lo identifica como mensaje sin clasificar

    Examples:
      | contenido |
      | Contenido sin origen identificado |
      | Resultado sin tipo asignado |
      | Mensaje con origen desconocido |

  Scenario Outline: Preferencia - visualización clara
    Given que el usuario necesita distinguir los contenidos de tipo "<tipo_mensaje>"
    When consulta la conversación
    Then el sistema mantiene una separación visual entre los mensajes enviados y recibidos

    Examples:
      | tipo_mensaje |
      | Mensajes escritos |
      | Resultados de reconocimiento de señas |
      | Mensajes enviados y recibidos |
