Feature: HU40 - Consulta de recomendaciones para atención inclusiva

  Como trabajador de un espacio de atención al público
  Quiero consultar recomendaciones para interactuar con personas que utilizan lengua de señas
  Para facilitar una comunicación respetuosa y comprensible

  Scenario Outline: Happy path - consulta de recomendaciones
    Given que el trabajador accede al apartado de recomendaciones del espacio "<espacio>"
    When selecciona la sección correspondiente
    Then el sistema muestra orientaciones para facilitar la interacción

    Examples:
      | espacio |
      | Recepción |
      | Secretaría |
      | Módulo de información |

  Scenario Outline: Alt - consulta por situación
    Given que el trabajador necesita atender la situación "<situacion>"
    When selecciona una situación de atención
    Then el sistema muestra recomendaciones relacionadas

    Examples:
      | situacion |
      | Atención de una consulta |
      | Orientación a una persona con discapacidad auditiva |
      | Atención en un módulo de información |

  Scenario Outline: Unhappy - contenido no disponible
    Given que ocurre un error de carga del contenido "<contenido>"
    When el trabajador intenta consultar las recomendaciones
    Then el sistema informa que no fue posible recuperar el contenido

    Examples:
      | contenido |
      | Recomendaciones generales |
      | Orientación por situación |
      | Consejos de comunicación inclusiva |
