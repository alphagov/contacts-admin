/*global $ */
/*jslint
 white: true */

"use strict";

/**
 * @name GOVUK
 * @namespace
 * @description Global namespace for gov.uk
 * @requires jquery 1.6.2
*/
var GOVUK = GOVUK || {};

/**
  @name GOVUK.hmrc_contacts
  @memberOf GOVUK
  @namespace
  @description A set of methods for handling behaviours with HMRC Contacts app functionality
  @requires jquery 1.6.2
*/
GOVUK.hmrc_contacts = {
  /**
    @name GOVUK.hmrc_contacts.contactGroupList
    @object
    @description container for contact group list behaviour
  */
  chosenSelect : {
    initialize: function () {
      $(".js-chosen-select").chosen();
    }
  },
  /**
    @name GOVUK.hmrc_contacts.contactGroupList
    @object
    @description container for contact group list behaviour
  */
  contactGroupList : {
      /**
        @name GOVUK.hmrc_contacts.toggledControl.initialize
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
          }

          $control.on('click', function (e) {
            var isOpen = $control.text().indexOf("view") != -1;

            $control.text((isOpen) ? 'hide all' : 'view all');

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
    this.chosenSelect.initialize();
  }
};
