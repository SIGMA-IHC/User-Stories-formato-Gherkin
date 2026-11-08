Feature: HU43 - Envío de comentarios sobre la aplicación

  Como usuario de Sigma
  Quiero enviar comentarios sobre mi experiencia utilizando la aplicación
  Para comunicar sugerencias que contribuyan a mejorar su funcionamiento

  Scenario Outline: Happy path - envío de comentario
    Given que el usuario completa el campo de comentarios con "<comentario>"
    When selecciona "Enviar"
    Then el sistema registra la sugerencia
    And muestra una confirmación

    Examples:
      | comentario |
      | La aplicación es fácil de utilizar |
      | Sugiero mejorar la accesibilidad |
      | Me gustaría contar con más opciones de comunicación |

  Scenario Outline: Unhappy - comentario vacío
    Given que el usuario no ha ingresado ningún comentario y el campo contiene "<comentario>"
    When intenta enviarlo
    Then el sistema solicita completar el campo

    Examples:
      | comentario |
      |  |
      |     |
      | Sin contenido |

  Scenario Outline: Unhappy - error de envío
    Given que ocurre un problema al enviar el comentario "<comentario>"
    When el usuario confirma la acción
    Then el sistema muestra un mensaje indicando que no fue posible registrar la sugerencia

    Examples:
      | comentario |
      | La aplicación es fácil de utilizar |
      | Sugiero mejorar la accesibilidad |
      | Me gustaría contar con más opciones de comunicación |
