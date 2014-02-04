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
      this.$form.on( "submit", $.proxy(this.formSubmitted, this) );
      this.$form.find("#search_name").on( "keyup change search", $.proxy(this.keyUpped, this) );
      this.$form.find("#search_contact_group_id").on( "change", $.proxy(this.submit, this) );
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

    formSubmitted: function (e) {
      this.pushState(e.target);
      $("#working_on_filter_contacts").removeClass("hidden");
    },

    pushState: function (form) {
      if (history.pushState) {
        var path = location.pathname + "?" + $(form).serialize();
        history.pushState(null, null, path);
      }
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
