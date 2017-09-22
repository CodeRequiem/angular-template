@echo off

set "originalDir=%cd%"

for /d /r %cd% %%a in (*) do if /i "%%~nxa"=="components" set "folderpath=%%a"

cd "%folderpath%"
mkdir %1
cd %1

echo import %1 from './%1.js';>> %1.module.js
echo import './%1.less';>> %1.module.js
echo.>> %1.module.js
echo routes.$inject = ['$stateProvider'];>> %1.module.js
echo function routes($stateProvider) {>> %1.module.js
echo     $stateProvider.state('%1', {>> %1.module.js
echo         //parent: 'add-parent-here',>> %1.module.js
echo         url: '/%1',>> %1.module.js
echo         component: '%1',>> %1.module.js
echo     });>> %1.module.js
echo }>> %1.module.js
echo.>> %1.module.js
echo export default angular>> %1.module.js
echo     .module("%1", [])>> %1.module.js
echo     .component("%1", %1)>> %1.module.js
echo     .config(routes)>> %1.module.js
echo     .name;>> %1.module.js

echo import templateUrl from './%1.html';>> %1.js
echo.>> %1.js
echo class %1Ctrl {>> %1.js
echo   constructor() {>> %1.js
echo   }>> %1.js
echo.>> %1.js
echo   $onInit() {>> %1.js
echo   }>> %1.js
echo }>> %1.js
echo.>> %1.js
echo //%1Ctrl.$inject = ['serviceNameHere'];
echo.>> %1.js
echo const %1 = {>> %1.js
echo   templateUrl: templateUrl,>> %1.js
echo   controller: %1Ctrl,>> %1.js
echo   bindings: {}>> %1.js
echo };>> %1.js
echo.>> %1.js
echo module.exports = %1;>> %1.js

echo import angular from 'angular';>> %1.spec.js
echo import 'angular-mocks';>> %1.spec.js
echo import { %1 } from './%1.js';>> %1.spec.js
echo.>> %1.spec.js
echo describe('%1', () => {>> %1.spec.js
echo     beforeEach(() => {>> %1.spec.js
echo         angular>> %1.spec.js
echo             .module('%1Test', [])>> %1.spec.js
echo             .component('%1Test', %1);>> %1.spec.js
echo         angular.mock.module('%1Test');>> %1.spec.js
echo     });>> %1.spec.js
echo.>> %1.spec.js
echo     test(>> %1.spec.js
echo         'test-name-here',>> %1.spec.js
echo         angular.mock.inject($componentController => { }),>> %1.spec.js
echo     );>> %1.spec.js
echo });>> %1.spec.js

echo export default class %1Service {>> %1.service.js
echo 	constructor($http) {>> %1.service.js
echo         this.$http = $http;>> %1.service.js
echo 	}>> %1.service.js
echo.>> %1.service.js
echo     servicePut(payload) {>> %1.service.js
echo         const config = {>> %1.service.js
echo             headers: {>> %1.service.js
echo                 'Content-Type': 'application/json',>> %1.service.js
echo                 'Accept': 'application/json'>> %1.service.js
echo             }>> %1.service.js
echo         };>> %1.service.js
echo.>> %1.service.js
echo         return this.$http.put('endpoint/put', payload, config).then(() => {>> %1.service.js
echo             return Promise.resolve();>> %1.service.js
echo         }).catch(() => {>> %1.service.js
echo             return Promise.reject('Failed to save.');>> %1.service.js
echo         });>> %1.service.js
echo     }>> %1.service.js
echo.>> %1.service.js
echo     serviceGet() {>> %1.service.js
echo         const config = {>> %1.service.js
echo             headers: { 'Accept': 'application/json' }>> %1.service.js
echo         };>> %1.service.js
echo.>> %1.service.js
echo         return this.$http.get('endpoint/get', config).then(result => {>> %1.service.js
echo             return result.data;>> %1.service.js
echo         }).catch(() => {>> %1.service.js
echo             return Promise.reject('Failed to retreive.');>> %1.service.js
echo         });>> %1.service.js
echo     }>> %1.service.js
echo }>> %1.service.js
echo.>> %1.service.js
echo %1Service.$inject = ['$http'];>> %1.service.js

echo ^<section class="%1-section"^>>> %1.html
echo.>> %1.html
echo ^</section^>>> %1.html

echo .%1-section {>> %1.less
echo.>> %1.less
echo }>> %1.less

cd "%originalDir%"
