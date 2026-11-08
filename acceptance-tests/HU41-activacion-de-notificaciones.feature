Feature: HU41 - Activación de notificaciones

  Como usuario registrado
  Quiero configurar las notificaciones de Sigma
  Para recibir información relevante sobre el funcionamiento de la aplicación

  Scenario Outline: Happy path - activación de notificaciones
    Given que el usuario accede a los ajustes de la cuenta "<cuenta>"
    When activa las notificaciones
    Then el sistema guarda la preferencia seleccionada

    Examples:
      | cuenta |
      | Cuenta personal 1 |
      | Cuenta personal 2 |
      | Cuenta personal 3 |

  Scenario Outline: Alt - desactivación de notificaciones
    Given que las notificaciones se encuentran activas para la cuenta "<cuenta>"
    When el usuario las desactiva
    Then el sistema deja de enviar notificaciones no esenciales

    Examples:
      | cuenta |
      | Cuenta personal 1 |
      | Cuenta personal 2 |
      | Cuenta personal 3 |

  Scenario Outline: Unhappy - permisos del dispositivo denegados
    Given que el dispositivo "<dispositivo>" no permite recibir notificaciones
    When el usuario intenta activarlas
    Then el sistema muestra instrucciones para habilitar los permisos correspondientes

    Examples:
      | dispositivo |
      | Dispositivo móvil con permisos denegados |
      | Dispositivo sin autorización de notificaciones |
      | Navegador con notificaciones bloqueadas |
