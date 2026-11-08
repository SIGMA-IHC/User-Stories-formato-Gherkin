Feature: HU31 - Registro de institución
  Como representante de una institución educativa o espacio de atención al público, quiero registrar mi institución en Sigma, para organizar el acceso y uso de la herramienta en mi establecimiento.

  Scenario Outline: Happy path - registro institucional
    Given que el representante ingresa los datos requeridos de la institución "<institucion>"
    When selecciona "Registrar institución"
    Then el sistema almacena la información.
    And confirma el registro.

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Unhappy - información incompleta
    Given que el representante omite el campo obligatorio "<campo>"
    When intenta registrar la institución
    Then el sistema resalta los campos faltantes.
    And bloquea el envío.

    Examples:
      | campo |
      | Campo obligatorio 1 |
      | Campo obligatorio 2 |
      | Campo obligatorio 3 |

  Scenario Outline: Unhappy - institución existente
    Given que la institución "<institucion>" ya se encuentra registrada
    When el representante intenta crear un nuevo registro con los mismos datos identificadores
    Then el sistema informa que ya existe.

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |
