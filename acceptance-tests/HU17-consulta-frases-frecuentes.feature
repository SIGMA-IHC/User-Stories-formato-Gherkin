Feature: HU17 - Consulta de frases frecuentes

  Como persona que no conoce lengua de señas
  Quiero acceder a frases frecuentes de comunicación
  Para transmitir rápidamente mensajes comunes durante una interacción

  Scenario Outline: Happy path - visualización de frases
    Given que el usuario accede a la sección "Frases frecuentes"
    When se carga la pantalla
    Then el sistema muestra expresiones organizadas por categorías "<categoria>"

    Examples:
      | categoria   |
      | Saludos     |
      | Despedidas  |
      | Necesidades |

  Scenario Outline: Alt - selección de frase
    Given que el usuario encuentra una frase adecuada "<frase>"
    When la selecciona
    Then el sistema la incorpora al campo de mensaje
    And permite su envío

    Examples:
      | frase                 |
      | Hola, ¿cómo estás?    |
      | Muchas gracias        |
      | Necesito ayuda        |

  Scenario Outline: Unhappy - frases no disponibles
    Given que ocurre un error de carga "<problema>"
    When el usuario ingresa a la sección
    Then el sistema muestra un mensaje indicando que no fue posible recuperar las frases

    Examples:
      | problema              |
      | Error de conexión     |
      | Error de carga        |
