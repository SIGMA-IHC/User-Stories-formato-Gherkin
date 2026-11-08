Feature: HU04 - Visualización de información personal

  Como usuario registrado
  Quiero visualizar mis datos personales
  Para verificar la información asociada a mi cuenta

  Scenario Outline: Happy path - visualización correcta
    Given que el usuario "<usuario>" inició sesión
    When accede a la sección "Mi perfil"
    Then el sistema muestra su nombre, correo electrónico y datos registrados

    Examples:
      | usuario  | nombre | correo               |
      | usuario1 | Ana    | usuario1@ejemplo.com |
      | usuario2 | Luis   | usuario2@ejemplo.com |

  Scenario Outline: Unhappy - error de carga
    Given que ocurre un problema de conexión "<problema>"
    When el usuario intenta visualizar su perfil
    Then el sistema muestra un mensaje indicando que no fue posible cargar la información

    Examples:
      | problema             |
      | Sin conexión         |
      | Conexión interrumpida |

  Scenario Outline: Alt - actualización de información
    Given que el usuario desea modificar sus datos personales
    When selecciona "Editar perfil"
    Then el sistema habilita los campos correspondientes para realizar cambios en "<campo>"

    Examples:
      | campo              |
      | Nombre             |
      | Correo electrónico |
