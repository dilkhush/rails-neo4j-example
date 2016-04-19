// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var app = angular.module('app', [])
app.controller('UsersCtrl', function ($scope, $http) {
	$scope.get_users = function(){
		$http.get('/users').then(function(responce){
			$scope.users = responce.data;
		})
	}

	$scope.selected_user = 0;

	$scope.neighborhood_friends = function(){
		$http.get('/users/'+$scope.selected_user+'/neighborhood_friends').then(function(responce){
			$scope.suggestions = responce.data;
		})
	}

	$scope.book_suggestions = function(){
	  $http.get('/users/'+$scope.selected_user+'/books_suggestions').then(function(responce){
			$scope.books = responce.data;
		})
	}

	$scope.clear_books = function(){
		$scope.books = []
	}

	$scope.clear_users = function(){
		$scope.suggestions = []
	}
})