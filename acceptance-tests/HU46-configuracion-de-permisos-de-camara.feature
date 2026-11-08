Feature: HU46 - Configuración de permisos de cámara

  Como usuario de Sigma
  Quiero conocer y gestionar los permisos de cámara utilizados por la aplicación
  Para controlar el acceso al dispositivo durante el reconocimiento de señas

  Scenario Outline: Happy path - permisos habilitados
    Given que el usuario concede acceso a la cámara en el dispositivo "<dispositivo>"
    When inicia el módulo de reconocimiento
    Then el sistema permite utilizarla

    Examples:
      | dispositivo |
      | Dispositivo Android |
      | Dispositivo iOS |
      | Dispositivo móvil compatible |

  Scenario Outline: Unhappy - permisos deshabilitados
    Given que el usuario deshabilita el acceso a la cámara en el dispositivo "<dispositivo>"
    When intenta utilizar el reconocimiento
    Then el sistema informa que necesita habilitar el permiso

    Examples:
      | dispositivo |
      | Dispositivo Android |
      | Dispositivo iOS |
      | Dispositivo móvil compatible |

  Scenario Outline: Alt - consulta de instrucciones
    Given que el usuario no sabe cómo modificar los permisos en "<dispositivo>"
    When selecciona "Ayuda"
    Then el sistema muestra indicaciones para gestionarlos desde la configuración del dispositivo

    Examples:
      | dispositivo |
      | Dispositivo Android |
      | Dispositivo iOS |
      | Dispositivo móvil compatible |
