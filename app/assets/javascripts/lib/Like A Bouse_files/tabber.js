(function() {

  this.Tabber = (function() {

    function Tabber(selector, informationSelector) {
      this.selector = selector;
      this.informationSelector = informationSelector;
    }

    Tabber.prototype.show = function() {
      return this.tabs = this.startElement().tabs(this.loadConfig());
    };

    Tabber.prototype.loadConfig = function() {
      var config;
      return config = {
        selected: parseInt(this.informationElement().attr("data-selected-tab"))
      };
    };

    Tabber.prototype.startElement = function() {
      return $(this.selector);
    };

    Tabber.prototype.informationElement = function() {
      return $(this.informationSelector);
    };

    return Tabber;

  })();

}).call(this);
