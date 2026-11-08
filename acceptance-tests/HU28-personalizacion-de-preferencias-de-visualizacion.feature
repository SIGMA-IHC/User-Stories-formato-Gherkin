Feature: HU28 - Personalización de preferencias de visualización

  Como usuario de Sigma
  Quiero configurar las preferencias visuales de la aplicación
  Para adaptar la interfaz a mis necesidades de uso

  Scenario Outline: Happy path - guardado de preferencias
    Given que el usuario modifica la preferencia visual "<preferencia>"
    When selecciona "Guardar cambios"
    Then el sistema almacena la configuración seleccionada

    Examples:
      | preferencia |
      | Tamaño de texto |
      | Contraste visual |
      | Tamaño de texto y contraste visual |

  Scenario Outline: Alt - restauración de configuración
    Given que el usuario desea recuperar la apariencia inicial desde la configuración "<configuracion>"
    When selecciona "Restablecer"
    Then el sistema restaura los valores predeterminados

    Examples:
      | configuracion |
      | Tamaño de texto personalizado |
      | Contraste modificado |
      | Preferencias visuales modificadas |

  Scenario Outline: Unhappy - error al guardar
    Given que ocurre un fallo al guardar la preferencia "<preferencia>"
    When el usuario confirma los cambios
    Then el sistema informa que no fue posible actualizar la configuración

    Examples:
      | preferencia |
      | Tamaño de texto |
      | Contraste visual |
      | Preferencias visuales |
