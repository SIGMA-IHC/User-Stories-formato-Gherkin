Feature: HU27 - Configuración de contraste visual
  Como usuario de Sigma, quiero modificar el contraste de la interfaz, para distinguir con mayor facilidad los elementos y textos de la aplicación.

  Scenario Outline: Happy path - activación de contraste
    Given que el usuario accede a los ajustes de accesibilidad
    When activa la opción de contraste "<modo>"
    Then el sistema modifica los colores de los elementos de la interfaz.

    Examples:
      | modo |
      | Mayor contraste |
      | Alto contraste |
      | Contraste reforzado |

  Scenario Outline: Alt - desactivación de contraste
    Given que el modo de contraste "<modo>" se encuentra activo
    When el usuario lo desactiva
    Then el sistema restaura la apariencia visual anterior.

    Examples:
      | modo |
      | Mayor contraste |
      | Alto contraste |
      | Contraste reforzado |

  Scenario Outline: Unhappy - error de configuración
    Given que ocurre un error al aplicar el modo de contraste "<modo>"
    When el usuario modifica el contraste
    Then el sistema muestra una notificación indicando que no fue posible actualizar la preferencia.

    Examples:
      | modo |
      | Mayor contraste |
      | Alto contraste |
      | Contraste reforzado |
