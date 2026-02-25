@Store
Feature: Automatización completa del módulo Store

  Background:
    * url baseUrl
    * def orderData = read('classpath:helpers/store-order.json')

  @happypath
  Scenario: Consultar inventario (GET /store/inventory)
    Given path 'store', 'inventory'
    When method get
    Then status 200

  @happypath
  Scenario: Crear una orden y verificarla (POST y GET)
    Given path 'store', 'order'
    And request orderData
    When method post
    Then status 200
    * def createdId = response.id

    Given path 'store', 'order', createdId
    When method get
    Then status 200
    And match response.id == createdId

  @happypath
  Scenario: Eliminar la orden creada
    Given path 'store', 'order', orderData.id
    When method delete
    Then status 200

  @unhappypath
  Scenario Outline: Verificar errores al buscar IDs inexistentes - <idInvalido>
    Given path 'store', 'order', '<idInvalido>'
    When method get
    Then status 404

    Examples:
      | idInvalido      |
      | 123456789123456 |
      | 0               |
      | -1              |