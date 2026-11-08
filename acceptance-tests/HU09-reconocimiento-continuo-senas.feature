Feature: HU09 - Reconocimiento continuo de señas

  Como persona que no conoce lengua de señas
  Quiero que la cámara procese varias señas consecutivas
  Para comprender mensajes sin tener que reiniciar el reconocimiento después de cada palabra

  Scenario Outline: Happy path - reconocimiento consecutivo
    Given que la cámara se encuentra activa
    When la persona realiza varias señas compatibles "<secuencia>"
    Then el sistema identifica las expresiones consecutivamente
    And las presenta en el área de traducción

    Examples:
      | secuencia       |
      | Hola - Gracias  |
      | Hola - Adiós    |
      | Gracias - Adiós |

  Scenario Outline: Unhappy - interrupción del reconocimiento
    Given que la cámara pierde temporalmente la visibilidad de las manos por "<motivo>"
    When intenta procesar una seña
    Then el sistema indica que debe posicionarse nuevamente frente a la cámara

    Examples:
      | motivo                |
      | Manos fuera de cámara |
      | Manos ocultas         |

  Scenario Outline: Alt - reinicio de reconocimiento
    Given que el usuario desea comenzar una nueva interpretación después de obtener "<interpretacion_anterior>"
    When selecciona "Limpiar"
    Then el sistema elimina el resultado anterior
    And permite iniciar una nueva secuencia

    Examples:
      | interpretacion_anterior |
      | Hola                    |
      | Gracias                 |
