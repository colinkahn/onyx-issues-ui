do ->
  MODULES =
    APP: ["ngRoute", "ngAnimate"]

  for name, requires of MODULES
    window[name] = angular.module name, requires
