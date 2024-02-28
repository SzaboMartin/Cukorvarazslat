;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('app', [
    'ui.router',
		'app.common'
  ])

  // Application config
  .config([
    '$stateProvider', 
    '$urlRouterProvider', 
    ($stateProvider, $urlRouterProvider) => {

      $stateProvider
      .state('root', {
				abstract: true,
				views: {
					'@': {
						templateUrl: './html/root.html'
					},
					'header@root': {
						templateUrl: './html/header.html'
					},
					'footer@root': {
						templateUrl: './html/footer.html'
					}
				}
      })
			.state('home', {
				url: '/',
				parent: 'root',
				templateUrl: './html/home.html',
				controller: 'homeController'
			})
			.state('presing_lenke', {
				url: '/presing_lenke',
				parent: 'root',
				templateUrl: './html/presing_lenke.html'
			})
      .state('galleria', {
				url: '/galleria',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('cukordiszek', {
				url: '/cukordiszek',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('eskuvocukor', {
				url: '/eskuvocukor',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('figurak', {
				url: '/figurak',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('naszparok', {
				url: '/naszparok',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('bolt', {
				url: '/bolt',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('kapcsolat', {
				url: '/kapcsolat',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('megosztas', {
				url: '/megosztas',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('vasarlas', {
				url: '/vasarlas',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('login', {
				url: '/login',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('register', {
				url: '/register',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			});
      
		
      $urlRouterProvider.otherwise('/');
    }
  ])

  // Application run
  .run([
    'trans',
    (trans) => {

      // Transaction events
			trans.events();
    }
  ])

	// Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('Home controller...');
	}

]);

})(window, angular);