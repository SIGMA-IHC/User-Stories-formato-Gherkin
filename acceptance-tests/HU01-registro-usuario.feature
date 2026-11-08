Feature: Registro de nuevo usuario

  Scenario: Happy path - registro exitoso
    Given que el usuario es nuevo
    When completa los campos obligatorios con información válida y presiona "Registrarse"
    Then el sistema crea su cuenta
    And muestra la pantalla de bienvenida

  Scenario: Unhappy - correo electrónico existente
    Given que el correo ingresado ya está registrado
    When el usuario intenta crear una cuenta
    Then el sistema muestra el mensaje "Este correo ya está en uso"
    And bloquea el registro

  Scenario: Unhappy - datos incompletos
    Given que el usuario deja campos obligatorios vacíos
    When intenta registrarse
    Then el sistema resalta los campos faltantes
    And solicita completarlos
