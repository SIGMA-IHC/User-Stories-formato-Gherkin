Feature: HU30 - Acceso a preguntas frecuentes

  Como usuario de Sigma
  Quiero consultar preguntas frecuentes sobre la aplicación
  Para resolver dudas sobre su funcionamiento de manera autónoma

  Scenario Outline: Happy path - visualización de preguntas
    Given que el usuario accede a la sección "Preguntas frecuentes"
    When se carga el contenido relacionado con "<tema>"
    Then el sistema muestra una lista de preguntas y respuestas

    Examples:
      | tema |
      | Uso de Sigma |
      | Reconocimiento de señas |
      | Configuración de la aplicación |

  Scenario Outline: Alt - consulta de respuesta
    Given que el usuario selecciona la pregunta "<pregunta>"
    When presiona sobre ella
    Then el sistema despliega la respuesta correspondiente

    Examples:
      | pregunta |
      | ¿Cómo utilizar Sigma? |
      | ¿Cómo funciona el reconocimiento de señas? |
      | ¿Cómo modificar las preferencias? |

  Scenario Outline: Unhappy - información no disponible
    Given que ocurre un error al recuperar las preguntas de "<seccion>"
    When el usuario accede a la sección
    Then el sistema muestra un mensaje de error temporal

    Examples:
      | seccion |
      | Preguntas frecuentes |
      | Ayuda de uso |
      | Información de la aplicación |
