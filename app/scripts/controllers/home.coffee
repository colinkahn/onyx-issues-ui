APP.controller "HomeController", ($scope, $http, $animate) ->
  $scope.animate = $animate
  $scope.state = "not-authorized"

  $scope.issues = []

  $scope.rankings =
    "Unranked":             0
    "Low Priority":         1
    "Medium Priority":      2
    "High Priority":        3
    "Really High Priority": 4

  $scope.rankStyles =
    0: "btn-default"
    1: "btn-info"
    2: "btn-warning"
    3: "btn-danger"
    4: "btn-panic"

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
      # pass for now

  $scope.getIssues = ->
    $http.get("/api/issues").then (response) ->
      $scope.state  = "authorized"
      $scope.issues = response.data
    , ->
      $scope.state = "not-authorized"

  $scope.getIssues()
