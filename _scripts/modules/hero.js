//
//
// Hero
//
//
var Hero = {

  //
  // Globals
  //
  $hero: $('.m-hero'),
  cats: {},
  theme: ["pink", "yellow", "blue", "green", "gray"],

  //
  // Build Cats index
  //
  buildCats: function() {
    var ctx;
    ctx = this;
    _.each(window.cats, function(cat, key) {
      var div, factor, pos;
      factor = 5;
      div = Math.floor(key / factor);
      pos = key - (div * factor);
      return ctx.cats[cat[0]] = {
        color: ctx.theme[pos]
      };
    });
    return console.log(ctx.cats);
  },

  //
  // Colors
  //
  colors: function() {
    var catName, ctx;
    if (this.$hero.length > 0) {
      ctx = this;
      catName = ctx.$hero.data("cat-name");
      return ctx.$hero.addClass("m-hero--" + ctx.cats[catName].color);
    }
  },
  init: function() {
    this.buildCats();
    return this.colors();
  }
};

//
// Export
//
module.exports = Hero;
