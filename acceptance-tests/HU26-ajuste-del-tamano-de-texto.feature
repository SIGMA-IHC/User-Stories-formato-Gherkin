Feature: HU26 - Ajuste del tamaño de texto

  Como usuario de Sigma
  Quiero modificar el tamaño del texto de la aplicación
  Para mejorar la legibilidad de los mensajes y las opciones disponibles

  Scenario Outline: Happy path - aumento de tamaño
    Given que el usuario accede a la configuración de visualización
    When selecciona un tamaño de texto "<tamano>" mayor
    Then el sistema actualiza el tamaño de fuente de la interfaz

    Examples:
      | tamano |
      | Un nivel mayor |
      | Dos niveles mayores |
      | El tamaño mayor disponible |

  Scenario Outline: Alt - restauración de tamaño
    Given que el usuario ha modificado el tamaño del texto a "<tamano_actual>"
    When selecciona la opción predeterminada
    Then el sistema restaura el tamaño inicial

    Examples:
      | tamano_actual |
      | Tamaño aumentado |
      | Tamaño muy aumentado |
      | Tamaño personalizado |

  Scenario Outline: Unhappy - configuración no disponible
    Given que ocurre un error al guardar la preferencia de tamaño "<preferencia>"
    When el usuario intenta modificar el tamaño
    Then el sistema muestra un mensaje indicando que no se pudo aplicar el cambio

    Examples:
      | preferencia |
      | Aumento del texto |
      | Reducción del texto |
      | Tamaño predeterminado |
