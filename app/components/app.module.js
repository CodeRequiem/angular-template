import angular from 'angular';
import uiRouter from '@uirouter/angularjs';
import './app.less';
import '../index.html';
import template from './app.html';
import Home from './home/home.module.js';

routes.$inject = ['$stateProvider'];
function routes($stateProvider) {
    $stateProvider.state('app', {
        url: '',
        templateUrl: template,
        redirectTo: 'home',
    });
}

loadDefaultPage.$inject = ['$state'];
function loadDefaultPage($state) {
    $state.go('app');
}

angular
    .module('app', [uiRouter, Home])
    .config(routes)
    .run(loadDefaultPage);
