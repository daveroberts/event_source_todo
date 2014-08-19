// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .
//= require angular
//= require angular-route
//= require lodash
//= require restangular

var app = angular.module('event-sourcing-todos', [
    'ngRoute',
    'restangular']);


app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/todos', {
        templateUrl: 'assets/todos/index.html',
        controller: 'TodosIndexController'
      }).
      otherwise({
        redirectTo: '/todos'
      });
  }]);

app.controller('TodosIndexController', function($scope, Restangular){
  Restangular.all('todos').getList().then(function(todos){
    $scope.todos = todos;
  });
  $scope.destroy = function(todo){
    todo.remove().then(function(){
      $scope.todos = _.without($scope.todos, todo);
    });
  };
  $scope.create = function(todo){
    Restangular.all('todos').post(todo).then(function(res){
      $scope.todos.push(res);
    });
  };
});
