Feature: HU10 - Identificación de señas no reconocidas

  Como persona que no conoce lengua de señas
  Quiero recibir una indicación cuando una seña no pueda ser reconocida
  Para evitar interpretar incorrectamente el mensaje

  Scenario Outline: Happy path - aviso de reconocimiento
    Given que el sistema no identifica una seña "<sena>"
    When finaliza el procesamiento
    Then muestra el mensaje "No se pudo reconocer la seña"

    Examples:
      | sena                |
      | Seña desconocida 1  |
      | Seña desconocida 2  |

  Scenario Outline: Alt - nueva captura
    Given que una seña "<sena>" no fue reconocida
    When el usuario selecciona "Intentar nuevamente"
    Then el sistema reactiva el reconocimiento
    And procesa una nueva captura

    Examples:
      | sena                |
      | Seña desconocida 1  |
      | Seña desconocida 2  |

  Scenario Outline: Unhappy - error de procesamiento
    Given que ocurre un fallo interno "<fallo>" durante el reconocimiento
    When el sistema intenta interpretar la seña
    Then muestra un mensaje de error
    And permite reintentar

    Examples:
      | fallo                     |
      | Error interno de análisis |
      | Fallo de procesamiento     |
