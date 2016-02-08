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
  theme: ['pink', 'yellow', 'blue', 'green', 'gray'],

  //
  // Build Cats index
  //
  buildCats: function() {
    var ctx = this;
    _.each(window.cats, function(cat, key) {
      var factor = 5,
          div = Math.floor(key / factor),
          pos = key - (div * factor)
      ctx.cats[cat[0]] = {
        color: ctx.theme[pos]
      };
    });
  },

  //
  // Colors
  //
  colors: function() {
    var catName, ctx;
    if (this.$hero.length > 0) {
      ctx = this;
      catName = ctx.$hero.data('cat-name');
      return ctx.$hero.addClass('m-hero--' + ctx.cats[catName].color);
    }
  },
  init: function() {
    this.buildCats();
    this.colors();
  }
};

//
// Export
//
export default Hero;
