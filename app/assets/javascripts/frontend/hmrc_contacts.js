/*global $ */
/*jslint
 white: true */

(function () {
  "use strict";

  /**
   * @name GOVUK
   * @namespace
   * @description Global namespace for gov.uk
   * @requires jquery 1.6.2
  */
  window.GOVUK = window.GOVUK || {};

  /**
    @name GOVUK.HmrcContacts
    @memberOf GOVUK
    @namespace
    @description A set of methods for handling behaviours with HMRC Contacts app functionality
    @requires jquery 1.6.2
  */
  GOVUK.HmrcContacts = {
    /**
      @name GOVUK.HmrcContacts.contactGroupList
      @object
      @description container for contact group list behaviour
    */
    contactGroupList : {
        /**
          @name GOVUK.HmrcContacts.toggledControl.initialize
          @function
          @description initializes namespace
        */
        toggledControl: {
          initialize: function(control) {
            var $control = $(control),
                $controlledElement = $($control.data('expand')),
                $container = $control.closest('.department');

            // hide all expandables unless asked to open
            if (window.location.hash != $control.attr('href')) {
              $controlledElement.addClass('js-hidden');
              $container.addClass('js-hiding-children');
            }else{
              $container.find(".view-all").text('hide all');
            }

            $control.on('click', function (e) {
              var isOpen = $container.hasClass("js-hiding-children");

              if ($control.hasClass("view-all")) {
                $control.text((isOpen) ? 'hide all' : 'view all');
              } else {
                $container.find(".view-all").text((isOpen) ? 'hide all' : 'view all');
              }

              $controlledElement.toggleClass('js-hidden');
              $container.toggleClass('js-hiding-children');
            });
          }
        },
        /**
          @name GOVUK.contactGroupList.initialize
          @function
          @description initializes namespace
        */
        initialize : function () {
          var contactGroupToggle = '[data-expand]',
              namespace = this;

          $(contactGroupToggle).each(function(idx, element){
            namespace.toggledControl.initialize(element);
          })
        }
    },
    /**
      @name onLoad
      @function
      @description behaviour init point
    */
    onLoad : function () {
      this.contactGroupList.initialize();
      GOVUK.filterListItems.initialize();
    }
  };
}).call(this);
