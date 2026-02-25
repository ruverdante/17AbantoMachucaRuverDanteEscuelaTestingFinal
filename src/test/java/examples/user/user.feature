@User
Feature: Automatización completa del módulo User

  Background:
    * url baseUrl
    * def data = read('classpath:helpers/user-data.json')
    * def listData = read('classpath:helpers/user-list.json')

  @happypath
  Scenario: Crear usuario (POST /user)
    Given path 'user'
    And request data
    When method post
    Then status 200

  @happypath
  Scenario: Crear lista de usuarios (POST /user/createWithList)
    Given path 'user', 'createWithList'
    And request listData
    When method post
    Then status 200

  @happypath
  Scenario: Obtener usuario por username (GET /user/{username})
    Given path 'user', data.username
    When method get
    Then status 200
    And match response.username == data.username

  @happypath
  Scenario: Actualizar usuario (PUT /user/{username})
    Given path 'user', data.username
    And request read('classpath:helpers/user-update.json')
    When method put
    Then status 200

  @happypath
  Scenario: Login de usuario (GET /user/login)
    Given path 'user', 'login'
    And params { username: '#(data.username)', password: '#(data.password)' }
    When method get
    Then status 200

  @happypath
  Scenario: Logout de usuario (GET /user/logout)
    Given path 'user', 'logout'
    When method get
    Then status 200

  @happypath
  Scenario: Eliminar usuario (DELETE /user/{username})
    Given path 'user', data.username
    When method delete
    Then status 200

  @unhappypath
  Scenario: Error al buscar usuario inexistente (GET 404)
    Given path 'user', 'non_existent_user_2026'
    When method get
    Then status 404