
Feature: HU01 - Registro de nuevo usuario

  Como persona que no conoce lengua de señas
  Quiero registrarme en Sigma ingresando mis datos personales
  Para acceder a las funcionalidades de comunicación de la aplicación

  Scenario Outline: Happy path - registro exitoso
    Given que el usuario es nuevo
    When completa los campos obligatorios con información válida y presiona "Registrarse"
    Then el sistema crea su cuenta
    And muestra la pantalla de bienvenida

    Examples:
      | correo                   | contrasena  | resultado             |
      | usuario1@ejemplo.com     | Sigma123!   | Pantalla de bienvenida |
      | usuario2@ejemplo.com     | Sigma456!   | Pantalla de bienvenida |

  Scenario Outline: Unhappy - correo electrónico existente
    Given que el correo "<correo>" ya está registrado
    When el usuario intenta crear una cuenta
    Then el sistema muestra el mensaje "Este correo ya está en uso"
    And bloquea el registro

    Examples:
      | correo                   |
      | registrado1@ejemplo.com  |
      | registrado2@ejemplo.com  |

  Scenario Outline: Unhappy - datos incompletos
    Given que el usuario deja el campo "<campo>" vacío
    When intenta registrarse
    Then el sistema resalta los campos faltantes
    And solicita completarlos

    Examples:
      | campo       |
      | Nombre      |
      | Correo      |
      | Contraseña  |
  
