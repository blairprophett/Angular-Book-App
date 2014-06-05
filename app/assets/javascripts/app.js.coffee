
BookApp = angular.module("BookApp", [])

BookApp.controller("BooksCtrl", ["$scope", "$http", ($scope, $http) ->
  # console.log "inside controller"
  $scope.books = []

  $http.get('/books.json').success (data) ->
    $scope.books = data

  $scope.addBook = ->
    # console.log "add book button clicked"
    $http.post('/books.json', $scope.newBook).success (data) ->
      # console.log "SAVED!"
      $scope.newBook = {}
      $scope.books.push(data)

  $scope.editBook = ->
    # console.log @book
    $http.put("/books/#{@book.id}.json", @book).success (data) =>
      @editing = !@editing
      # console.log "book updated"

  $scope.deleteBook = ->
    # console.log "delete button pushed"
    #console.log @book
    # $http.delete("/books/"+@book.id+".json")
    index = @$index
    $http.delete("/books/#{@book.id}.json").success (data) =>
      # console.log "book deleted"
      $scope.books.splice(@$index, 1)
])

BookApp.config(["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])