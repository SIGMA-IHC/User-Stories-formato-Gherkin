Feature: HU49 - Restablecimiento de preferencias de usuario

  Como usuario de Sigma
  Quiero restablecer las preferencias de la aplicación
  Para recuperar la configuración inicial cuando los ajustes realizados ya no se adapten a mis necesidades

  Scenario Outline: Happy path - restablecimiento exitoso
    Given que el usuario ha modificado sus preferencias "<preferencias>"
    When selecciona "Restablecer configuración" y confirma la acción
    Then el sistema recupera los valores predeterminados

    Examples:
      | preferencias |
      | Tamaño de texto |
      | Contraste visual |
      | Idioma de la interfaz |

  Scenario Outline: Alt - cancelación de restablecimiento
    Given que el usuario selecciona restablecer la configuración "<preferencia>"
    When cancela la confirmación
    Then el sistema conserva las preferencias actuales

    Examples:
      | preferencia |
      | Tamaño de texto |
      | Contraste visual |
      | Idioma de la interfaz |

  Scenario Outline: Unhappy - error de actualización
    Given que ocurre un fallo al guardar la configuración inicial de "<configuracion>"
    When el usuario confirma el restablecimiento
    Then el sistema muestra un mensaje indicando que no fue posible completar la acción

    Examples:
      | configuracion |
      | Tamaño de texto |
      | Contraste visual |
      | Idioma de la interfaz |
