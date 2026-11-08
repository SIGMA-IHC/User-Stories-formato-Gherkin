Feature: HU06 - Acceso a la cámara para reconocimiento de señas

  Como persona que no conoce lengua de señas
  Quiero acceder a la cámara de mi dispositivo
  Para reconocer las señas realizadas por una persona con discapacidad auditiva

  Scenario Outline: Happy path - acceso a cámara
    Given que el usuario otorga los permisos necesarios de cámara en "<dispositivo>"
    When selecciona la opción "Traducir señas"
    Then el sistema activa la cámara
    And muestra la vista de reconocimiento

    Examples:
      | dispositivo        |
      | Teléfono Android   |
      | Teléfono iOS       |

  Scenario Outline: Unhappy - permisos denegados
    Given que el usuario no concede permisos de cámara en "<dispositivo>"
    When intenta iniciar el reconocimiento
    Then el sistema muestra un mensaje solicitando habilitar los permisos correspondientes

    Examples:
      | dispositivo        |
      | Teléfono Android   |
      | Teléfono iOS       |

  Scenario Outline: Alt - reactivación de permisos
    Given que el usuario denegó anteriormente el acceso a la cámara
    When selecciona "Configurar permisos"
    Then el sistema le indica cómo habilitar nuevamente el acceso en "<dispositivo>"

    Examples:
      | dispositivo        |
      | Teléfono Android   |
      | Teléfono iOS       |
