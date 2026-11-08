Feature: HU48 - Consulta de ayuda sobre reconocimiento de señas

  Como persona que no conoce lengua de señas
  Quiero consultar información sobre el reconocimiento de señas de Sigma
  Para comprender sus alcances y utilizar correctamente la funcionalidad

  Scenario Outline: Happy path - consulta de información
    Given que el usuario accede a la sección de ayuda del reconocimiento desde "<seccion>"
    When selecciona "Información sobre traducción"
    Then el sistema muestra una explicación sobre su funcionamiento

    Examples:
      | seccion |
      | Módulo de reconocimiento |
      | Sección de ayuda |
      | Menú principal |

  Scenario Outline: Alt - consulta de limitaciones
    Given que el usuario desea conocer si la seña "<sena>" puede reconocerse
    When accede al apartado de alcance de reconocimiento
    Then el sistema muestra información sobre las señas compatibles

    Examples:
      | sena |
      | Seña consultada A |
      | Seña consultada B |
      | Seña consultada C |

  Scenario Outline: Unhappy - información no disponible
    Given que ocurre un error al recuperar el contenido "<contenido>"
    When el usuario intenta consultarlo
    Then el sistema muestra un mensaje de error temporal

    Examples:
      | contenido |
      | Información sobre traducción |
      | Alcance de reconocimiento |
      | Ayuda de reconocimiento |
