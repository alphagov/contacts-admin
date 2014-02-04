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
    lastQuery: null,

    initialize: function () {
      this.$form = $(".js-filter-form");
      this.$form.on("submit", this.formSubmitted);
      this.$form.find("#filter_contacts").on( "keyup change search", $.proxy(this.keyUpped, this) );
      this.$form.find("#contact-groups-filter").on( "change", $.proxy(this.submit, this) );
    },

    keyUpped: function (e) {
      if (e.keyCode === 13) {
        return this.submit();  // if user presses enter, submit form
      }
      if (this.ignoreKeyCodes.indexOf(e.keyCode) === -1 && this.queryChanged(e.target.value)) {
        this.scheduleForSubmit();
      }
    },

    queryChanged: function (newQuery) {
      if (this.lastQuery != newQuery) {
        this.lastQuery = newQuery;
        return true;
      }
      return false;
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
