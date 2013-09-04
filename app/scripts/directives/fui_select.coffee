# Flat UI Select
# http://silviomoreto.github.io/bootstrap-select/

APP.directive "fuiSelect", ($timeout) ->
  link: ($scope, $element, $attrs) ->
    $timeout ->
      $element.selectpicker()

      # Grab the select picker options
      selectPicker = $element.data "selectpicker"

      $scope.$watch $attrs.ngModel, (newValue, oldValue) ->

        if stylesExp = $attrs.fuiSelectStyles
          cssStyles   = $scope.$eval stylesExp
          newBtnClass = cssStyles[newValue]
          oldBtnClass = cssStyles[oldValue]

          selectPicker.button
            .removeClass(oldBtnClass)
            .addClass(newBtnClass)
    , 0
