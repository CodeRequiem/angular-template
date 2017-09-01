import templateUrl from './home.html';

class HomeCtrl {
    constructor() {
    }

    $onInit() {
        
    }
}

// HomeCtrl.$inject = ['serviceName'];

const Home = {
    templateUrl: templateUrl,
    controller: HomeCtrl,
};

module.exports = Home;
