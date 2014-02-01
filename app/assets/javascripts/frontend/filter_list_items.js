(function () {
  "use strict"
  var root = this,
      $ = root.jQuery;
  if(typeof root.GOVUK === 'undefined') { root.GOVUK = {}; }

  var filter = {
    searchTimeout: 300,

    ignoreKeyCodes: [16, 17, 18, 91, 93],
    $form: null,
    submitTimeoutId: null,

    initialize: function () {
      this.$form = $(".js-filter-form");
      this.$form.on("submit", this.formSubmitted);
      this.$form.find("input").on( "keyup", $.proxy(this.keyUpped, this) );
    },

    keyUpped: function (e) {
      if (e.keyCode === 13) {
        return this.submit();  // if user presses enter, submit form
      }
      if (this.ignoreKeyCodes.indexOf(e.keyCode) === -1) {
        this.scheduleForSubmit();
      }
    },

    formSubmitted: function () {
      $("#working_on_filter_contacts").removeClass("hidden");
    },

    scheduleForSubmit: function () {
      this.clearCurrentTimeout();
      this.submitTimeoutId = setTimeout( $.proxy(this.submit, this), this.searchTimeout );
    },

    clearCurrentTimeout: function () {
      if (this.submitTimeoutId) {
        clearTimeout(this.submitTimeoutId);
        this.submitTimeoutId = null;
      }
    },

    submit: function () {
      this.submitTimeoutId = null;
      this.$form.submit();
    }
  };

  root.GOVUK.filterListItems = filter;
}).call(this);
