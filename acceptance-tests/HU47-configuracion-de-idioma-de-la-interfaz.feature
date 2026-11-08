Feature: HU47 - Configuración de idioma de la interfaz

  Como usuario de Sigma
  Quiero seleccionar el idioma disponible de la interfaz
  Para utilizar la aplicación de una manera que facilite mi comprensión de las opciones

  Scenario Outline: Happy path - cambio de idioma
    Given que el usuario accede a los ajustes de idioma
    When selecciona la opción disponible "<idioma>"
    Then el sistema actualiza los textos de la interfaz

    Examples:
      | idioma |
      | Idioma disponible 1 |
      | Idioma disponible 2 |
      | Idioma disponible 3 |

  Scenario Outline: Alt - restauración del idioma predeterminado
    Given que el usuario modificó el idioma a "<idioma_actual>"
    When selecciona la opción predeterminada
    Then el sistema restaura el idioma inicial

    Examples:
      | idioma_actual |
      | Idioma disponible 1 |
      | Idioma disponible 2 |
      | Idioma disponible 3 |

  Scenario Outline: Unhappy - idioma no disponible
    Given que el usuario intenta seleccionar el idioma no compatible "<idioma>"
    When confirma la selección
    Then el sistema informa que dicha opción no está disponible

    Examples:
      | idioma |
      | Idioma no disponible 1 |
      | Idioma no disponible 2 |
      | Idioma no disponible 3 |
