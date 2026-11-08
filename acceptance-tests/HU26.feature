Feature: HU26 - Ajuste del tamaño de texto
  Como usuario de Sigma, quiero modificar el tamaño del texto de la aplicación, para mejorar la legibilidad de los mensajes y las opciones disponibles.

  Scenario Outline: Happy path - aumento de tamaño
    Given que el usuario accede a la configuración de visualización
    When selecciona el tamaño de texto "<tamano>"
    Then el sistema actualiza el tamaño de fuente de la interfaz.

    Examples:
      | tamano |
      | Un nivel mayor |
      | Dos niveles mayores |
      | Tamaño máximo disponible |

  Scenario Outline: Alt - restauración de tamaño
    Given que el usuario ha modificado el tamaño del texto a "<tamano_actual>"
    When selecciona la opción predeterminada
    Then el sistema restaura el tamaño inicial.

    Examples:
      | tamano_actual |
      | Grande |
      | Muy grande |
      | Tamaño personalizado |

  Scenario Outline: Unhappy - configuración no disponible
    Given que ocurre un error al guardar la preferencia de tamaño "<tamano>"
    When el usuario intenta modificar el tamaño
    Then el sistema muestra un mensaje indicando que no se pudo aplicar el cambio.

    Examples:
      | tamano |
      | Un nivel mayor |
      | Dos niveles mayores |
      | Tamaño máximo disponible |
