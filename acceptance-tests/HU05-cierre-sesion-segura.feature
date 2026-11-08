Feature: HU05 - Cierre de sesión segura

  Como usuario autenticado
  Quiero cerrar sesión de manera segura
  Para evitar que otras personas accedan a mi cuenta desde mi dispositivo

  Scenario Outline: Happy path - cierre exitoso
    Given que el usuario "<usuario>" tiene una sesión activa
    When selecciona "Cerrar sesión"
    Then el sistema finaliza la sesión
    And lo dirige a la pantalla de inicio de sesión

    Examples:
      | usuario  |
      | usuario1 |
      | usuario2 |

  Scenario Outline: Unhappy - error de conexión
    Given que existe un problema de conexión "<problema>"
    When el usuario solicita cerrar sesión
    Then el sistema finaliza la sesión localmente
    And elimina el acceso a las pantallas privadas

    Examples:
      | problema              |
      | Sin conexión          |
      | Conexión interrumpida |
