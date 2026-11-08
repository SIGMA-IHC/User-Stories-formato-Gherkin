
Feature: HU03 - Recuperación de contraseña

  Como usuario registrado
  Quiero restablecer mi contraseña mediante mi correo electrónico
  Para recuperar el acceso a mi cuenta cuando la olvide

  Scenario Outline: Happy path - envío de enlace de recuperación
    Given que el usuario ingresa un correo registrado "<correo>"
    When selecciona "¿Olvidaste tu contraseña?"
    Then el sistema envía un enlace para restablecerla

    Examples:
      | correo               |
      | usuario1@ejemplo.com |
      | usuario2@ejemplo.com |

  Scenario Outline: Unhappy - correo no registrado
    Given que el correo "<correo>" ingresado no se encuentra registrado
    When el usuario solicita recuperar su contraseña
    Then el sistema muestra un mensaje indicando que no se encontró la cuenta

    Examples:
      | correo             |
      | nuevo1@ejemplo.com |
      | nuevo2@ejemplo.com |

  Scenario Outline: Unhappy - enlace caducado
    Given que el enlace de recuperación "<enlace>" ha expirado
    When el usuario intenta utilizarlo
    Then el sistema muestra un mensaje indicando que debe solicitar uno nuevo

    Examples:
      | enlace                 |
      | enlace_expirado_001    |
      | enlace_expirado_002    |
