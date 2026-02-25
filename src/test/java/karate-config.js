function fn() {
    var env = karate.env; // obtener la variable de entorno
    karate.log('El entorno de ejecución es:', env);

    if (!env) {
        env = 'dev'; // entorno por defecto
    }

    var config = {
        env: env,
        // Aquí centralizamos la URL para no repetirla en cada test
        baseUrl: 'https://petstore.swagger.io/v2'
    }

    // Configuración de tiempos de espera globales
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}