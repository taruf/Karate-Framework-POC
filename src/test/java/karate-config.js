function fn() {
    var config = {}

    testData = Java.type('utility.ConfigReader').getTestData();
    testElements = Java.type('utility.ConfigReader').getTestElements();
    config = { ...testData, ...testElements }

    config.ENV = Java.type('utility.ConfigReader').getTenant();

    config.USERS_BASE = '/api/users/';

    if(config.ENV == 'dummy') {
        config.URL = 'https://reqres.in';
    }
    else if(config.ENV == 'stage') {
        config.URL = '';
    }

    return config;
}
