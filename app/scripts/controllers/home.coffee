APP.controller "HomeController", ($scope, $http) ->
  $scope.state = "not-authorized"

  $scope.issues = []
  $scope.templates =
    issue_line_item: "/partials/issue_line_item.html"

  $scope.loginAs = (login) ->
    $http.post("/api/login", login).then (response) ->
      $scope.state  = "authorized"
      $scope.issues = response.data

  $scope.updateIssueRank = (issue) ->
    data =
      id:   issue.url
      rank: issue.rank

    $http.post("/api/issues/rank-issue", data).then (response) ->
      $scope.issues = response.data

  getIssues = ->
    $http.get("/api/issues").then (response) ->
      $scope.state  = "authorized"
      $scope.issues = response.data
    , ->
      $scope.state = "not-authorized"

  getIssues()
