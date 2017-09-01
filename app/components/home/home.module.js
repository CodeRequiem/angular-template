import Home from './home.js';
import './home.less';

routes.$inject = ['$stateProvider'];
function routes($stateProvider) {
    $stateProvider.state('home', {
        parent: 'app',
        url: '/home',
        component: 'home',
    });
}

export default angular
    .module("home", [])
    .component("home", Home)
    .config(routes)
    .name;
