'use strict'
angular.module('app', [
]).controller('ImproController', [
  '$scope',
  function (it) {
    //// variables
    it.words = {
      nameCharakter: //
      ('Peter,Paul,Marie,Johann,José,Felix,Heinz,Rafael,Michael,' + //
      'Simon,Sarah,Timo,Marcel,Juan').split(','),
      contentCharakter: //
      ('computerbegeistert,sportbegeistert,reiche Familie,schwere Kindheit,' + //
      'übersinnliche Kräfte,durchschnittlich,esoterisch,nerdig,Hipster,' + //
      'Schmerzen,hört Stimmen,krank').split(','),
      jobCharakter: //
      ('Kapitän,Informatiker,Pirat,Bank-Fachmann,Bäcker,Verkäufer,' + //
      'Putzkraft,Lehrer,Dozent,Barkeeper,Tänzer,Radio-Sprecher,Fernseh-Schauspieler,' + //
      'Superheld,Reicher Schnösel,Bettler').split(','),
      propCharakter: //
      ('introvertiert,extravertiert,hyperaktiv,ruhig,kauzig,freundlich,liebevoll,' + //
      'verspielt,unzufrieden,verhext,besessen,religiös,weltoffen,kreativ,pedantisch,' + //
      'nachdenklich').split(','),
      nameUmgebung: //
      ('Kaffeemaschine,Teppich,Teekanne' + //
      'WG,Supermarkt,Kino,Schiff,Bahn,Bus,U-Boot,Flugzeug,Bauernhof,Café').split(','),
      contentUmgebung: //
      ('Amerika,Afrika,Frankreich,Spanien,China,' + //
      'Fantasiewelt,Traum,Weltraum,Inland,Altertum,Zukunft').split(','),
      propUmgebung:
      'Nacht,Abend,Morgen,Mitternacht,Rush Hour,Mittagszeit,Teezeit'.split(','),
      nameStory: //
      ('Erstes Date,Mordfall,Klausur,Elternabend,Museumsbesuch,Freizeit,' + //
      'Werbung,Familienbesuch').split(','),
      propStory: //
      ('Bester Freund,Kollege,entfernter Verwandter,Geschwister,Elternteil,' + //
      'Großelternteil').split(','),
      contentStory: //
      ('Melone,Langeweile,Krankheit,Verteidigung,Angriff,Lasagne,Eier,Katze,Vogel,' + //
      'Verschwiegenheit,Psyche,Verschwendung').split(','),
    }
    it.showAbout = false
    it.title = 'Impro App'
    it.itemSel = undefined
    it.itemsOf = {
    }
    it.menuOf = {
    }
    it.initSeed = new Date().getTime()
    it.seed = it.initSeed
    it.current = undefined
    var CHARAKTER = 'Charakter'
    var UMGEBUNG = 'Umgebung'
    var STORY = 'Story'
    var EFFEKT = 'Effekt'
    it.types = [
      CHARAKTER,
      UMGEBUNG,
      STORY,
      EFFEKT
    ]
    //// functions
    it.plural = function (type) {
      return type == UMGEBUNG ? type + 'en' : type == CHARAKTER ? type + 'e' : type
    }
    it.newName = function (type) {
      return (type == CHARAKTER || type == EFFEKT) ? 'neuer ' + type : 'neue ' + type
    }
    it.menu = function (type) {
      it.menuOf[type] = !it.menuOf[type]
    }
    it.hasMenu = function (type) {
      return it.menuOf[type]
    }
    it.canEdit = function (type) {
      return type != EFFEKT
    }
    it.items = function (type) {
      return it.itemsOf[type]
    }
    it.removeItem = function (type, item) {
      var arr = it.itemsOf[type]
      var index = arr.indexOf(item)
      arr.splice(index, 1)
    }
    it.rnd = function (arr) {
      it.seed = (Math.abs(Math.floor(it.seed / Math.sin(it.seed + 1)))) % 1000000000000
      var r = it.seed % 1000000
      r = r / 1000000
      return arr[Math.floor(r * arr.length)]
    }
    it.changeItem = function (item, attr, add) {
      var key = attr + item.type
      var arr = it.words[key]
      if (!arr)
      {
        alert(key)
      }
      var val = it.rnd(arr)
      if (item[attr] && add) {
        if (item[attr].indexOf(val) == - 1) {
          item[attr] += ', ' + val
        }
      } else {
        item[attr] = val
      }
    }
    it.addNew = function (type) {
      var arr = it.itemsOf[type]
      var ind = arr.length + 1
      var o = {
        type: type
      }
      if (type == EFFEKT) {
        o.name = 'Effektauswahl'
        o.active = false
        o.characters = [
        ]
      } else {
        it.changeItem(o, 'name')
        it.changeItem(o, 'content')
      }
      if (type == CHARAKTER) {
        it.changeItem(o, 'job')
      }
      if (type == CHARAKTER || type == UMGEBUNG) {
        it.changeItem(o, 'prop')
      }
      arr.push(o)
      return o
    }
    it.addNewEff = function (name) {
      var e = it.addNew(EFFEKT)
      e.name = name
      e.character = it.items(CHARAKTER) [0].name
      return e
    }
    it.setCurrent = function (type, item) {
      it.itemSel = undefined
      it.current = item
    }
    it.about = function () {
      it.showAbout = !it.showAbout
    }
    it.itemSelect = function (type, item) {
      if (it.itemSel != item) {
        it.itemSel = item
      } else {
        it.itemSel = undefined
      }
    }
    it.play = function (item) {
      item.active = true
    }
    it.selection = function (item, select) {
      var ind = item.characters.indexOf(select)
      if (ind >= 0) {
        item.characters.splice(ind, 1)
      } 
      else {
        item.characters.push(select)
      }
    }
    it.clear = function (a) {
      a.splice(0, a.length)
    }
    it.addAll = function (a, b) {
      for (var i in b) {
        a.push(b[i])
      }
    }
    it.selectionMode = function (item, mode) {
      if (mode == 'all') {
        it.clear(item.characters)
        it.addAll(item.characters, it.characters)
      } 
      else if (mode == 'invert') {
        var x = [
        ]
        for (var i in it.characters) {
          var c = it.characters[i]
          if (item.characters.indexOf(c) == - 1) {
            x.push(c)
          }
        }
        it.clear(item.characters)
        it.addAll(item.characters, x)
      }
    }
    //// init

    it.init = function (initSeed) {
      it.initSeed = initSeed
      it.seed = initSeed
      for (var index in it.types) {
        var t = it.types[index]
        it.itemsOf[t] = [
        ]
        it.menuOf[t] = false
        if (t == EFFEKT) {
          it.addNewEff('Echo')
          it.addNewEff('Radio')
          it.addNewEff('Ferne')
          it.addNewEff('Verzerrt')
        } else {
          it.addNew(t)
        }
      }
      it.menuOf['root'] = true
      var active = // EFFEKT 
      CHARAKTER
      it.menuOf[active] = true
      it.characters = it.items(CHARAKTER)
      it.setCurrent(t, it.itemsOf[active][0])
    }
    it.init(it.initSeed)
  }
])
