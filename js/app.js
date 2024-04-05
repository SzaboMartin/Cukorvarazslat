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
					'header_top@root': {
						templateUrl: './html/header_top.html'
					},
					'header_nav@root': {
						templateUrl: './html/header_nav.html'
					},
					'footer@root': {
						templateUrl: './html/footer.html'
					}
				}
      })
			.state('home', {
				url: '/',
				parent: 'root',
				templateUrl: './html/home.html'
			})
			.state('presing_lenke', {
				url: '/presing_lenke',
				parent: 'root',
				templateUrl: './html/presing_lenke.html'
			})
      		.state('galeria', {
				url: '/galeria',
				parent: 'root',
				templateUrl: './html/galeria.html',
				controller: 'galeriaController',
				params: {type: null},
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
      .state('Nászpárok', {
				url: '/Nászpárok',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
			.state('Torták', {
				url: '/Torták',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
			.state('Sütemények', {
				url: '/Sütemények',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      .state('bolt', {
				url: '/bolt',
				parent: 'root',
				templateUrl: './html/bolt.html'
			})
			.state('Kapcsolat', {
				url: '/Kapcsolat',
				parent: 'root',
				templateUrl: './html/kapcsolat.html'
			})
      .state('receptek', {
				url: '/receptek',
				parent: 'root',
				templateUrl: './html/receptek.html'
			})
     
      		.state('megosztas', {
				url: '/megosztas',
				parent: 'root',
				templateUrl: './html/uder_construction.html'
			})
      		.state('vasarlas', {
				url: '/vasarlas',
				parent: 'root',
				templateUrl: './html/vasarlas.html'
			})
      		.state('login', {
				url: '/login',
				parent: 'root',
				group: 'user',
				templateUrl: './html/login.html',
				controller: 'loginController',
			})
			.state('register', {
				url: '/register',
				parent: 'root',
				group: 'user',
				templateUrl: './html/register.html',
				controller: 'registerController',
			})
      		.state('profile', {
				url: '/profile',
				parent: 'root',
				group: 'user',
				templateUrl: './html/profile.html',
				controller: 'profileController',
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

  // Application run
  .run([
		'$state',
    '$rootScope',
    '$timeout',
    'trans',
    'util',
    ($state, $rootScope, $timeout, trans, util) => {

      // Transaction events
			trans.events({group: 'user'});

			// Set user properties
			$rootScope.user = {
				id: null,
				type: null,
				type_name: null,
				name: null,
				born: null,
				gender: null,
				address: null,
				country_code: null,
				phone: null,
				email: null
			};

      // Check logout function exist
			if (!util.isFunction($rootScope.logout)) {

				// Logout
				$rootScope.logout = () => {

          // Reset asynchronous
          $timeout(() => {

					  // Confirm
					  if (confirm('Biztosan ki akar jelentkezni?')) {

              // Reset user
						  Object.keys($rootScope.user).forEach((key) => $rootScope.user[key] = null);

						  // Go to prevent enabled state, or to home
					    if ($rootScope.state.prevEnabled)
                    $state.go($rootScope.state.prevEnabled);
              else	$state.go('home');
					  }
          }, 50);
				};
			}
    }
  ])

	// Galéria controller
  .controller('galeriaController', [
		'$state',
		'$stateParams',
    '$scope',
		'http',
    function($state, $stateParams, $scope, http) {

			// Check state params
			if (!$stateParams.type) {
				$state.go('home');
				return;
			}

			// Set item index
			$scope.itemIndex = -1;

			// Set title
			switch($stateParams.type) {
				case 'Cukorviragdisz':
					$scope.title = 'Cukorvirágdíszek';
					break;
				case 'Eskuvocukor':
					$scope.title = 'Esküvői díszek';
					break;
				case 'Figurak':
					$scope.title = 'Figurák';
					break;
				default:
					$scope.title = $stateParams.type;
			}

			// Http request
			http.request({
				url: './php/galeria.php',
				data: {type: $stateParams.type}
			})
			.then(response => {

				// Set response
				$scope.data = response;

				// Apply changes
				$scope.$applyAsync();
			})
			.catch(e => {

				// Reset asynchronity
				$timeout(() => {

					// Informing the user
					alert(e);
				}, 50);
			});

			// Set scope methods
			$scope.methods = {

				// Item clicked
				itemClicked: (event) => {
					let element = event.currentTarget;
					if (element) {
						let index = element.dataset.index;
						if (index) {
							index = parseInt(index);
							if (!isNaN(index)) {
								$scope.itemIndex = index;
								$scope.$applyAsync();
							}
						}
					}
				},

				// Change image
				changeImage: (event) => {
					let element = event.currentTarget;
					if (element) {
						if (element.classList.contains('fa-angle-right')) {
							if ($scope.itemIndex < $scope.data.length - 1)
										$scope.itemIndex++;
							else	$scope.itemIndex = 0;
						} else {
							if ($scope.itemIndex > 0)
										$scope.itemIndex--;
							else	$scope.itemIndex = $scope.data.length - 1;
						} 
						$scope.$applyAsync();
					}
				}
			};
		}
	])

	// Login controller
  .controller('loginController', [
    '$state',
    '$rootScope',
    '$scope',
    '$timeout',
    '$element',
    'http',
    'util',
    function($state, $rootScope, $scope, $timeout, $element, http, util) {
			
      // Set methods
      let methods = {

        // Initialize
        init: () => {

          // Set model
			    $scope.model = {email: localStorage.getItem('userEmailAddress')};

          // Set focus
          methods.focus();
        },

        // Set focus
				focus() {
					$timeout(() => {
						let inputs = $element[0].querySelectorAll(
															`form[name="loginForm"] input:not(:disabled), 
															 form[name="loginForm"] textarea:not(:disabled)`);
						if (inputs.length) {
							let invalids = [...inputs].filter(e => e.classList.contains('ng-invalid'));
							if (invalids.length) 
										invalids[0].focus();
							else	inputs[0].focus();
						}
					}, 50);
				},
      };

      // Set scope methods
      $scope.methods = {

        // Accept
        accept: () => {
          
          // Get neccesary input properties
					let args = util.objFilterByKeys($scope.model, [
            'passwordShow',
          ], false);

          // Http request
          http.request({
            url 	: `./php/login.php`,
            data 	: args
          })
          .then(response => {

            // Convert born to date type
						response.born = moment(response.born).toDate();

            // Save in local storige email address
						localStorage.setItem('userEmailAddress', args.email);
            
            // Set user
						$rootScope.user = util.objMerge($rootScope.user, response, true);

            // Apply change
						$rootScope.$applyAsync();

            // Go to prevent enabled state, or to home
            $scope.methods.cancel();
          })
          .catch(error => {

            // Reset password
            $scope.model.password = null;

            // Apply change
						$rootScope.$applyAsync();

            // Reset asynchronous
            $timeout(() => {

              // Show error
              alert(error);
              
              // Set focus
              methods.focus();
            }, 50)
          });
        },

        // Cancel
        cancel: () => {

          // Go to prevent enabled state, or to home
					if ($rootScope.state.prevEnabled)
                $state.go($rootScope.state.prevEnabled);
          else	$state.go('home');
        },

        // Show/Hide password
				showHidePassword: (event) => {
					let element = event.currentTarget;
					if (element) {
						let form = element.closest('form');
						if (form) {
							let passwords = form.querySelectorAll('.input-password');
							if (passwords.length) {
								passwords.forEach(e => {
									e.type = $scope.model.passwordShow ? 'text' : 'password';
								});
							}
						}
					}
				},
      };

      // Initialize
      methods.init();
		}
	])

	// Register controller
  .controller('registerController', [
    '$state',
    '$rootScope',
    '$scope',
    '$timeout',
    '$element',
    'http',
    'util',
    function($state, $rootScope, $scope, $timeout, $element, http, util) {
			
      // Set methods
      let methods = {

        // Initialize
        init: () => {

          // Set helper
					$scope.helper = {
						maxBorn: moment().subtract(18, 	'years').format('YYYY-MM-DD'),
						minBorn: moment().subtract(120, 'years').format('YYYY-MM-DD')
					};

          // Set focus
          methods.focus();
        },

        // Set focus
				focus() {
					$timeout(() => {
						let inputs = $element[0].querySelectorAll(
															`form[name="registerForm"] input:not(:disabled), 
															 form[name="registerForm"] textarea:not(:disabled)`);
						if (inputs.length) {
							let invalids = [...inputs].filter(e => e.classList.contains('ng-invalid'));
							if (invalids.length) 
										invalids[0].focus();
							else	inputs[0].focus();
						}
					}, 50);
				},
      };

      // Set scope methods
      $scope.methods = {

        // Accept
        accept: () => {
          
          // Get neccesary input properties
					let args = util.objFilterByKeys($scope.model, [
            'passwordShow',
          ], false);

          // Convert date to string
          args.born = moment(args.born).format('YYYY-MM-DD');

          // Http request
          http.request({
            method: 'POST',
            url 	: `./php/register.php`,
            data 	: args
          })
          .then(response => {

            // Convert to date type
            args.born = moment(args.born).toDate();

            // Save in local storige email address
						localStorage.setItem('userEmailAddress', args.email);

            // Set user identifier, default type, and type name.
            args['id'] 				= response['id'];
						args['type'] 			= 'U';
						args['type_name'] = 'felhasználó';
            
            // Set user
						$rootScope.user = util.objMerge($rootScope.user, args, true);

            // Apply change
						$rootScope.$applyAsync();

            // Reset asynchronous
            $timeout(() => {

              // Show message
              alert('Köszönjük, hogy regisztrált weboldalunkra!');

              // Go to prevent enabled state, or to home
              $scope.methods.cancel();

            }, 50);
          })
          .catch(error => {

            // Reset password
            $scope.model.password = null;

            // Apply change
						$rootScope.$applyAsync();

            // Reset asynchronous
            $timeout(() => {

              // Show error
              alert(error);
              
              // Set focus
              methods.focus();
            }, 50);
          });
        },

        // Cancel
        cancel: () => {

          // Go to prevent enabled state, or to home
					if ($rootScope.state.prevEnabled)
                $state.go($rootScope.state.prevEnabled);
          else	$state.go('home');
        },

        // Show/Hide password
				showHidePassword: (event) => {
					let element = event.currentTarget;
					if (element) {
						let form = element.closest('form');
						if (form) {
							let passwords = form.querySelectorAll('.input-password');
							if (passwords.length) {
								passwords.forEach(e => {
									e.type = $scope.model.passwordShow ? 'text' : 'password';
								});
							}
						}
					}
				},
      };

      // Initialize
      methods.init();
		}
	])

  // Profile controller
  .controller('profileController', [
    '$state',
    '$rootScope',
    '$scope',
    '$timeout',
    '$element',
    'http',
    'util',
    function($state, $rootScope, $scope, $timeout, $element, http, util) {
			
      // Set methods
      let methods = {

        // Initialize
        init: () => {

          // Set helper
					$scope.helper = {
						maxBorn: moment().subtract(18, 	'years').format('YYYY-MM-DD'),
						minBorn: moment().subtract(120, 'years').format('YYYY-MM-DD')
					};

          // Set focus
          methods.focus();
        },

        // Set focus
				focus() {
					$timeout(() => {
						let inputs = $element[0].querySelectorAll(
															`form[name="profileForm"] input:not(:disabled), 
															 form[name="profileForm"] textarea:not(:disabled)`);
						if (inputs.length) {
							let invalids = [...inputs].filter(e => e.classList.contains('ng-invalid'));
							if (invalids.length) 
										invalids[0].focus();
							else	inputs[0].focus();
						}
					}, 50);
				},
      };

      // Set scope methods
      $scope.methods = {

        // Accept
        accept: () => {
          
          // Get neccesary input properties
					let args = util.objFilterByKeys($scope.model, [
            'passwordShow',
            'type_name'
          ], false);

          // Convert date to string
          args.born = moment(args.born).format('YYYY-MM-DD');

          // Add user identifier to arguments
					args['id'] = $rootScope.user.id;

          // Http request
          http.request({
            method: 'POST',
            url 	: `./php/profile.php`,
            data 	: args
          })
          .then(() => {

            // Convert to date type
            args.born = moment(args.born).toDate();
            
            // Set user
						$rootScope.user = util.objMerge($rootScope.user, args, true);

            // Apply change
						$rootScope.$applyAsync();

            // Reset asynchronous
            $timeout(() => {

              // Show message
              alert('Az Ön adatait sikeressen módosítottuk!');

              // Go to prevent enabled state, or to home
              $scope.methods.cancel();

            }, 50);
          })
          .catch(error => {

            // Reset asynchronous
            $timeout(() => {

              // Show error
              alert(error);
              
              // Set focus
              methods.focus();
            }, 50);
          });
        },

        // Cancel
        cancel: () => {

          // Go to prevent enabled state, or to home
					if ($rootScope.state.prevEnabled)
                $state.go($rootScope.state.prevEnabled);
          else	$state.go('home');
        },

        // Show/Hide password
				showHidePassword: (event) => {
					let element = event.currentTarget;
					if (element) {
						let form = element.closest('form');
						if (form) {
							let passwords = form.querySelectorAll('.input-password');
							if (passwords.length) {
								passwords.forEach(e => {
									e.type = $scope.model.passwordShow ? 'text' : 'password';
								});
							}
						}
					}
				},
      };

      // Initialize
      methods.init();
		}
	]);

})(window, angular);

