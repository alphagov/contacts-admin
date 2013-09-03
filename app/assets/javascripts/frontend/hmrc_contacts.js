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
  chosenSelect : {
    initialize: function () {
      $(".js-chosen-select").chosen();
    }
  },
  /**
    @name GOVUK.HmrcContacts.commonQuestionsSelect
    @object
    @description common questions select functionality in landing page
  */
  commonQuestionsSelect : {
    initialize: function () {
      var $select = $("#commonly-asked-questions .js-chosen-select"),
          namespace = this;

      this.hideAllSections();
      this.showSection($select.chosen().val());

      $select.chosen().change(function(){
        namespace.hideAllSections();
        namespace.showSection($(this).val());
      });
    },

    hideAllSections : function () {
      $(".common-sections").addClass("common-sections-hidden");
    },

    showSection : function (sectionIdentifier) {
      $('#section-' + sectionIdentifier).removeClass("common-sections-hidden");
    }
  },
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
    @name GOVUK.HmrcContacts.contactDetailList
    @object
    @description the list that includes email addresses, phone numbers etc
  */
  contactDetailList : {
    initialize: function () {
      var $contactDetailList = $('.contact-detail'),
          $groupHideLinks = $contactDetailList.find('.js-hide-link');

      $groupHideLinks.on('click', function(event){
        $(this).closest(".js-hide-container").toggleClass("js-hide");

        return false;
      });
    }
  },
  /**
    @name GOVUK.HmrcContacts.contactDetailPrivacyInfoShow
    @object
    @description show the email privacy info for contact details
  */
  contactDetailPrivacyInfoShow : {
    initialize: function () {
      var privacySecurityInfo = $(".privacy-security-info");
      if (privacySecurityInfo.size() > 0){
        privacySecurityInfo.addClass("js-hidden");

        privacySecurityInfo.find("a").click(function(e){
          e.preventDefault();
          $(this).closest(".privacy-security-info").removeClass("js-hidden");
        });
      }
    }
  },
  /**
    @name GOVUK.HmrcContacts.contactDetailPrivacyInfoShow
    @object
    @description show the contact details navigation when viewed with slim browsers
  */
  contactDetailNavigationShow : {
    initialize: function () {
      var navigationShowLink = $(".show-all-parts");

      navigationShowLink.click(function(e){
        e.preventDefault();
        $(this).toggleClass("show-all-parts-open");
        $(this).parent().find(".page-navigation").toggleClass("page-navigation-closed").toggleClass("page-navigation-open");

        if ($(this).hasClass("show-all-parts-open")){
          $(this).text("Hide all parts of this guide");
        }else{
          $(this).text("Show all parts of this guide");
        }
      });
    }
  },
  /**
    @name onLoad
    @function
    @description behaviour init point
  */
  onLoad : function () {
    this.contactGroupList.initialize();
    this.contactDetailList.initialize();
    this.contactDetailPrivacyInfoShow.initialize();
    this.contactDetailNavigationShow.initialize();
    this.chosenSelect.initialize();
    this.commonQuestionsSelect.initialize();
  }
};
