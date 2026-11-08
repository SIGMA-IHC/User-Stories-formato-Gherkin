Feature: HU02 - Inicio de sesión

  Como usuario registrado
  Quiero iniciar sesión con mi correo electrónico y contraseña
  Para acceder a mis conversaciones y funcionalidades personalizadas

  Scenario Outline: Happy path - inicio de sesión exitoso
    Given que el usuario ingresa sus credenciales correctamente con el correo "<correo>" y la contraseña "<contrasena>"
    When selecciona "Iniciar sesión"
    Then el sistema valida sus datos
    And lo dirige a la pantalla principal

    Examples:
      | correo               | contrasena |
      | usuario1@ejemplo.com | Sigma123!  |
      | usuario2@ejemplo.com | Sigma456!  |

  Scenario Outline: Unhappy - credenciales incorrectas
    Given que el usuario ingresa una contraseña incorrecta "<contrasena>"
    When intenta iniciar sesión
    Then el sistema muestra un mensaje de error
    And solicita verificar sus credenciales

    Examples:
      | contrasena |
      | Error123   |
      | Incorrecta |

  Scenario Outline: Unhappy - cuenta no registrada
    Given que el correo "<correo>" ingresado no existe en el sistema
    When el usuario intenta acceder
    Then el sistema informa que no se encontró una cuenta asociada

    Examples:
      | correo              |
      | nuevo1@ejemplo.com  |
      | nuevo2@ejemplo.com  |
