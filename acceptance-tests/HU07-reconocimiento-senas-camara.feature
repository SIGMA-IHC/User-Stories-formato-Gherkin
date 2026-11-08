Feature: HU07 - Reconocimiento de señas mediante la cámara

  Como persona que no conoce lengua de señas
  Quiero que la aplicación reconozca las señas realizadas frente a la cámara
  Para comprender el mensaje sin necesitar un intérprete

  Scenario Outline: Happy path - reconocimiento exitoso
    Given que la persona realiza una seña compatible "<sena>" frente a la cámara
    When el sistema procesa el movimiento
    Then identifica la seña
    And muestra su significado en texto "<resultado>"

    Examples:
      | sena    | resultado |
      | Hola    | Hola      |
      | Gracias | Gracias   |
      | Adiós   | Adiós     |

  Scenario Outline: Unhappy - seña no reconocida
    Given que la persona realiza una seña "<sena>" que no se encuentra dentro de las compatibles
    When el sistema procesa el movimiento
    Then muestra un mensaje indicando que no pudo reconocerla

    Examples:
      | sena                |
      | Seña desconocida 1  |
      | Seña desconocida 2  |

  Scenario Outline: Unhappy - iluminación insuficiente
    Given que el ambiente tiene poca iluminación "<condicion>"
    When el usuario intenta reconocer una seña
    Then el sistema muestra una recomendación para mejorar las condiciones de captura

    Examples:
      | condicion          |
      | Habitación oscura  |
      | Luz insuficiente   |
