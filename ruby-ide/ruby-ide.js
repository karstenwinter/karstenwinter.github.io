'use strict'
function initRubyIde(idOfEditor, idOfOutput, errorPos) {
  var ed = document.getElementById(idOfEditor)
  var out = document.getElementById(idOfOutput)
  if (ed == undefined || out == undefined) {
    return
  }
  var list = [
    'class',
    'def',
    'end',
    'when',
    'case',
    'self',
    'then',
    'if',
    'while',
    'for',
    'raise',
    'unless',
    'do',
    'rescue',
    'return',
    'not',
    'true',
    'false',
    'fail',
    'nil'
  ]
  function refreshText(words) {
    if (words == undefined) {
      return
    }
    var res = [
    ]
    var start = 0
    var end = 0
    var len = words.length + 1
    var isLetter = false
    var showDepth = true
    var buf = [
    ]
    var buf2 = [
    ]
    var depth = 0
    var row = 1
    var lastParentDepth = 0
    var parentDepth = 0
    var inString = false
    var inComment = false
    var c = ''
    for (var i = 0; i < len; i++) {
      var wasNum = c >= '0' && c <= '9'
      c = ' '
      if (i < len) {
        c = words.charAt(i)
      }
      isLetter = c.toLowerCase() != c.toUpperCase()
      var added = isLetter || (c >= '0' && c <= '9') || c == '@' || (wasNum && c == '.') || c == '"' || c == '\'' || c == '#'
      if (added) {
        buf.push(c)
      }
      if (c == '\n') {
        depth = 0
        row++
        showDepth = true
      } else {
        if (c != ' ') {
          showDepth = false
        }
      }
      lastParentDepth = parentDepth
      if (c == '\'' || c == '"') {
        inString = !inString
      }
      depth++
      if (c == ')' || c == '}') {
        parentDepth--
      } else if (c == '(' || c == '{') {
        parentDepth++
      }
      if (!added) {
        var word = buf.join('')
        buf.splice(0, buf.length)
        var index = - 1
        var cssClass = ''
        if (errorPos.row == row) {
          cssClass = 'error'
        } else if (inComment) {
          cssClass = 'comment'
        } else if (inString || word.indexOf('"') >= 0 || word.indexOf('\'') >= 0) {
          cssClass = 'string'
        } else if (list.indexOf(word) >= 0) {
          cssClass = 'keyword'
        } else if (word.charAt(0) == '#') {
          inComment = true
          cssClass = 'comment'
        } else if (word.charAt(0) >= 'A' && word.charAt(0) <= 'Z') {
          cssClass = 'type'
        } else if (word.indexOf('@') == 0) {
          cssClass = 'field'
        } else if (word.trim().length > 0 && !isNaN( - word)) {
          cssClass = 'number'
        }
        if (cssClass != '') {
          word = '<span class="' + cssClass + '">' + word + '</span>'
        }
        res.push(word)
        if (c == '\n') {
          inString = false
          inComment = false
        }
        if (showDepth && c == ' ') {
          var d = 255 - Math.max(0, Math.min(120, (depth - (depth % 2)) * 6))
          res.push('<span style="background-color: rgb(' + d + ',' + d + ',' + d + ')">' + c + '</span>')
        } else if (lastParentDepth != parentDepth) {
          var curDep = parentDepth - 1
          if (c == ')' || c == '}') {
            curDep++
          }
          var d = 255 - Math.max(0, Math.min(255, curDep * 64))
          res.push('<span style="background-color: rgb(' + 55 + ',' + d + ',' + d + ')">' + c + '</span>')
        } else {
          if (errorPos.row == row) {
            c = '<span class="error">' + c + '</span>'
          } else if (inComment) {
            c = '<span class="comment">' + c + '</span>'
          } else if (inString) {
            c = '<span class="string">' + c + '</span>'
          }
          res.push(c)
        }
      }
    }
    out.innerHTML = res.join('')
    /* http://qnimate.com/automatically-resizing-textarea/ */
    if (ed.scrollTop != 0) {
      ed.style.height = ed.scrollHeight + 'px'
    }
    return true
  }
  function refresh() {
    refreshText(ed.value)
  }
  ed.onkeydown = function (e)
  {
    if (e.keyCode == 13 && (e.ctrlKey || e.shiftKey))
    {
      alert('eval')
    }
  }
  ed.onkeyup = function (e)
  {
    refresh()
  }
  window.onload = refresh
  return refreshText
}
angular.module('app', [
]).controller('IdeController', [
  '$scope',
  function ($scope) {
    Opal.load('opal-parser')
    $scope.files = [
    ]
    $scope.counter = 0
    $scope.addNew = function () {
      var index = $scope.counter++
      var cont =
      '# This is a simple class with one property. Also write tests for that\n' +
      '# class just like you see it below. When evaluated, your class will be tested.\n' +
      'class Class' + index + '\n' +
      '  def initialize()\n' +
      '    @test = 42\n' +
      '  end\n' +
      '  def test()\n' +
      '    @test\n' +
      '  end\n' +
      'end\n' +
      '\n' +
      'fail "test 1" unless Class' + index + '.new.test == 42'
      $scope.files.push({
        name: 'class' + index,
        content: cont
      })
    }
    $scope.hasMenu = true
    $scope.menu = function () {
      $scope.hasMenu = !$scope.hasMenu
    }
    $scope.removeItem = function (item) {
      var index = $scope.files.indexOf(item)
      $scope.files.splice(index, 1)
    }
    $scope.error = {
      col: - 1,
      row: - 1
    }
    $scope.setCurrent = function (item) {
      $scope.error.row = - 1
      $scope.error.col = - 1
      $scope.fileSel = undefined
      $scope.file = item
      $scope.refresh(item.content)
    }
    $scope.showAbout = false
    $scope.about = function () {
      $scope.showAbout = !$scope.showAbout
    }
    $scope.output = ''
    $scope.outputName = ''
    $scope.evalItem = function (item) {
      $scope.output = ''
      $scope.outputName = ''
      $scope.error.row = - 1
      $scope.error.col = - 1
      var res = ''
      try {
        res = Opal.eval(item.content)
        $scope.outputName = 'Result'
        $scope.output = res
      } catch (err) {
        $scope.outputName = err.name
        res = err.message
        if (err.name == 'SyntaxError') {
          res = res.replace('\r', '')
          res = res.replace('An error occurred while compiling: (file)\n', '')
          res = res.trim()
        }
        var search = 'Source: (file):'
        var i = res.indexOf(search)
        if (i >= 0) {
          var end = res.indexOf('\n', i)
          var parts = res.substring(i + search.length, end).split(':')
          $scope.error.row = parts[0]
          $scope.error.col = parts[1]
        }
      }
      $scope.output = res
      $scope.refresh(item.content)
    }
    $scope.refresh = initRubyIde('editor', 'output', $scope.error)
    $scope.addNew()
    $scope.addNew()
    $scope.setCurrent($scope.files[0])
    $scope.fileSel = undefined
    $scope.fileSelect = function (item) {
      if ($scope.fileSel != item) {
        $scope.fileSel = item
      } else {
        $scope.fileSel = undefined
      }
    }
  }
])
