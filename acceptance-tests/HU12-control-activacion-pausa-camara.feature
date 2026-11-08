Feature: HU12 - Control de activación y pausa de cámara

  Como persona que no conoce lengua de señas
  Quiero pausar y reanudar el reconocimiento de la cámara
  Para controlar cuándo deseo interpretar una conversación

  Scenario Outline: Happy path - pausa de cámara
    Given que el reconocimiento está activo en "<estado>"
    When el usuario presiona "Pausar"
    Then el sistema detiene temporalmente el procesamiento de las señas

    Examples:
      | estado                  |
      | Reconocimiento activo   |
      | Procesamiento de señas  |

  Scenario Outline: Happy path - reanudación
    Given que el reconocimiento se encuentra pausado en "<estado>"
    When el usuario presiona "Continuar"
    Then el sistema reactiva la cámara
    And reanuda el procesamiento

    Examples:
      | estado                   |
      | Reconocimiento pausado   |
      | Procesamiento detenido   |

  Scenario Outline: Unhappy - error al reanudar
    Given que el usuario accede al módulo de comunicación
    When escribe un mensaje en el campo de texto "<mensaje>"
    Then el sistema muestra el contenido ingresado
    And habilita la opción de enviarlo

    Examples:
      | mensaje             |
      | Hola                |
      | Necesito ayuda      |
