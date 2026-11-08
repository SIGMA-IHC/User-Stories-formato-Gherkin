Feature: HU37 - Consulta de guía de implementación institucional

  Como representante de una institución educativa o espacio de atención
  Quiero consultar una guía para implementar Sigma en mi establecimiento
  Para facilitar su incorporación en las actividades de atención

  Scenario Outline: Happy path - visualización de guía
    Given que el representante accede al apartado de ayuda institucional de "<institucion>"
    When selecciona "Guía de implementación"
    Then el sistema muestra recomendaciones para utilizar la aplicación en su establecimiento

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Alt - consulta por etapas
    Given que el representante desea conocer el proceso de implementación de Sigma
    When selecciona la etapa "<etapa>" de la guía
    Then el sistema muestra las indicaciones correspondientes

    Examples:
      | etapa |
      | Etapa inicial |
      | Etapa de configuración |
      | Etapa de implementación |

  Scenario Outline: Unhappy - guía no disponible
    Given que ocurre un error de carga de la guía "<guia>"
    When el representante intenta abrir la guía
    Then el sistema muestra un mensaje indicando que el contenido no está disponible temporalmente

    Examples:
      | guia |
      | Guía de implementación |
      | Recomendaciones institucionales |
      | Instrucciones de uso |
