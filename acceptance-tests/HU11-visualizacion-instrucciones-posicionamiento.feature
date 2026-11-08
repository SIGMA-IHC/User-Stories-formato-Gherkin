Feature: HU11 - Visualización de instrucciones de posicionamiento

  Como persona que no conoce lengua de señas
  Quiero recibir indicaciones sobre cómo posicionar el dispositivo
  Para facilitar el reconocimiento correcto de las señas

  Scenario Outline: Happy path - instrucciones visibles
    Given que el usuario accede al módulo de cámara en "<dispositivo>"
    When inicia el reconocimiento
    Then el sistema muestra indicaciones para mantener las manos dentro del área visible

    Examples:
      | dispositivo      |
      | Teléfono Android |
      | Teléfono iOS     |

  Scenario Outline: Unhappy - manos fuera del encuadre
    Given que las manos se encuentran fuera del área de captura por "<condicion>"
    When el sistema detecta esta condición
    Then muestra una advertencia para ajustar la posición

    Examples:
      | condicion               |
      | Manos fuera de cámara   |
      | Manos parcialmente fuera |

  Scenario Outline: Alt - consulta de instrucciones
    Given que el usuario no comprende cómo utilizar la cámara en "<situacion>"
    When selecciona el ícono de ayuda
    Then el sistema muestra instrucciones de uso

    Examples:
      | situacion                  |
      | Primer uso de la cámara    |
      | Dificultad de posicionamiento |
