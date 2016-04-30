window.addEventListener("load", function() {
  //Add Event listener to the new set button
  var addSetButton = document.getElementById("new-set-button");
  addSetButton.addEventListener("click", addSet);

  //Add Event listeners to the remove set buttons
  var removeSetButtons = document.getElementsByClassName("remove-set-button");
  for(var i = 0; i < removeSetButtons.length; i++){
    removeSetButtons[i].addEventListener("click", removeSet);
  };

  //Add Event Listener to the date picker
  var dateInput = document.getElementById("date");
  date.addEventListener("change", dateChanged);
});

//On page load one set is displayed
var setsDisplayed = 1

//Facilitate adding a set when button pushed
function addSet() {
  if(setsDisplayed === 1){
    addSetTwo();
  } else if(setsDisplayed === 2){
    addSetThree();
  } else if(setsDisplayed === 3){
    addSetFour(this);
  };
  setsDisplayed++;
};

//Add set two when only one set is displayed
function addSetTwo() {
  //Un hide set two
  var newSet = document.getElementById("set-2");
  newSet.classList.remove("hidden");
  //un hide the set two remove set button
  var removeSetButton = document.getElementById("remove-2");
  removeSetButton.classList.remove("hidden");
};

//Add set three when only two sets are displayed
function addSetThree() {
  //Un-hide set three
  var newSet = document.getElementById("set-3");
  newSet.classList.remove("hidden");
  //Un-hide the set three remove set button
  var removeSetButton = document.getElementById("remove-3");
  removeSetButton.classList.remove("hidden");
  //Hide the set two remove set button
  var removeSetButton = document.getElementById("remove-2");
  removeSetButton.classList.add("hidden");
};

//Add set four when only three sets are displayed
function addSetFour(element) {
  //Un-hide set four
  var newSet = document.getElementById("set-4");
  newSet.classList.remove("hidden");
  //Hide the add set list button
  element.classList.add("hidden");
  //Un-hide the set four remove set list button
  var removeSetButton = document.getElementById("remove-4");
  removeSetButton.classList.remove("hidden");
  //Hide the set three remove set list button
  var removeSetButton = document.getElementById("remove-3");
  removeSetButton.classList.add("hidden");
};

//Facilitate Removing a set when remove set list button is clicked
function removeSet() {
  if(setsDisplayed === 4){
    removeSetFour();
  } else if(setsDisplayed === 3){
    removeSetThree();
  } else if(setsDisplayed === 2){
    removeSetTwo();
  };

};

//Removes set four from display
function removeSetFour() {
  var removeSetList = document.getElementById("set_4");
  //If set list has songs then it can not be removed
  if(removeSetList.getElementsByTagName("li").length === 0){
    //Hide set four
    var set = document.getElementById("set-4");
    set.classList.add("hidden");
    //Show set three remove set list button
    var removeSetButton = document.getElementById("remove-3");
    removeSetButton.classList.remove("hidden");
    //Show add new set list button
    var newSetButton = document.getElementById("new-set-button");
    newSetButton.classList.remove("hidden");
    setsDisplayed--;
  } else {
    //Display message that set list must be empty
    removeSetAlert ();
  };

};

//Removes set three from display
function removeSetThree() {
  var removeSetList = document.getElementById("set_3");
  //If set list has songs then it can not be removed
  if(removeSetList.getElementsByTagName("li").length === 0){
    //Hide set three
    var set = document.getElementById("set-3");
    set.classList.add("hidden");
    //Show set two remove set list button
    var removeSetButton = document.getElementById("remove-2");
    removeSetButton.classList.remove("hidden");
    setsDisplayed--;
  } else {
    //Display message that set list must be empty
    removeSetAlert ();
  };
};

//Removes set two from display
function removeSetTwo() {
  var removeSetList = document.getElementById("set_2");
  //If set list has songs then it can not be removed
  if(removeSetList.getElementsByTagName("li").length === 0){
    //Hide set two
    var set = document.getElementById("set-2");
    set.classList.add("hidden");
    setsDisplayed--;
  } else {
    //Display message that set list must be empty
    removeSetAlert ();
  };
};

//Displays a message that set list must be empty
function removeSetAlert() {
  alert("The set must be empty to remove it.");
}

function dateChanged() {
  this.classList.remove("empty-date");
  this.removeEventListener("change", dateChanged);
}

$(function() {
  $( "ul.droptrue" ).sortable({
    connectWith: ".droptrue",
    appendTo: "body",
    handle: ".handle",
    helper: function(event,$item){
        var $helper = $('<ul></ul>').addClass('drag-style');
        return $helper.append($item.clone());
    },
    update: function(event, ui) {

      $(this).parent().children("p").addClass("hidden");

      if(this.id !== "songs") {
        var set_id = this.id

        var songs = []
        $(this).children().map(function() {
          songs.push(this.id);
          });

        var set_list_id = document.getElementsByClassName('set_list')[0].id;

        var postData = {set_list_id: set_list_id, set_id: set_id, song_order: songs};

        $.ajax({
          method: 'post',
          url: '/set_lists/new/sets',
          data: postData
        });

      }

    }

  });

  $( "#sortable1, #sortable2, #sortable3" ).disableSelection();
  });

  (function ($) {

  // Detect touch support
  $.support.touch = 'ontouchend' in document;

  // Ignore browsers without touch support
  if (!$.support.touch) {
    return;
  }

  var mouseProto = $.ui.mouse.prototype,
      _mouseInit = mouseProto._mouseInit,
      _mouseDestroy = mouseProto._mouseDestroy,
      touchHandled;

  /**
   * Simulate a mouse event based on a corresponding touch event
   * @param {Object} event A touch event
   * @param {String} simulatedType The corresponding mouse event
   */
  function simulateMouseEvent (event, simulatedType) {

    // Ignore multi-touch events
    if (event.originalEvent.touches.length > 1) {
      return;
    }

    event.preventDefault();

    var touch = event.originalEvent.changedTouches[0],
        simulatedEvent = document.createEvent('MouseEvents');

    // Initialize the simulated mouse event using the touch event's coordinates
    simulatedEvent.initMouseEvent(
      simulatedType,    // type
      true,             // bubbles
      true,             // cancelable
      window,           // view
      1,                // detail
      touch.screenX,    // screenX
      touch.screenY,    // screenY
      touch.clientX,    // clientX
      touch.clientY,    // clientY
      false,            // ctrlKey
      false,            // altKey
      false,            // shiftKey
      false,            // metaKey
      0,                // button
      null              // relatedTarget
    );

    // Dispatch the simulated event to the target element
    event.target.dispatchEvent(simulatedEvent);
  }

  /**
   * Handle the jQuery UI widget's touchstart events
   * @param {Object} event The widget element's touchstart event
   */
  mouseProto._touchStart = function (event) {

    var self = this;

    // Ignore the event if another widget is already being handled
    if (touchHandled || !self._mouseCapture(event.originalEvent.changedTouches[0])) {
      return;
    }

    // Set the flag to prevent other widgets from inheriting the touch event
    touchHandled = true;

    // Track movement to determine if interaction was a click
    self._touchMoved = false;

    // Simulate the mouseover event
    simulateMouseEvent(event, 'mouseover');

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');

    // Simulate the mousedown event
    simulateMouseEvent(event, 'mousedown');
  };

  /**
   * Handle the jQuery UI widget's touchmove events
   * @param {Object} event The document's touchmove event
   */
  mouseProto._touchMove = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Interaction was not a click
    this._touchMoved = true;

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');
  };

  /**
   * Handle the jQuery UI widget's touchend events
   * @param {Object} event The document's touchend event
   */
  mouseProto._touchEnd = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Simulate the mouseup event
    simulateMouseEvent(event, 'mouseup');

    // Simulate the mouseout event
    simulateMouseEvent(event, 'mouseout');

    // If the touch interaction did not move, it should trigger a click
    if (!this._touchMoved) {

      // Simulate the click event
      simulateMouseEvent(event, 'click');
    }

    // Unset the flag to allow other widgets to inherit the touch event
    touchHandled = false;
  };

  /**
   * A duck punch of the $.ui.mouse _mouseInit method to support touch events.
   * This method extends the widget with bound touch event handlers that
   * translate touch events to mouse events and pass them to the widget's
   * original mouse event handling methods.
   */
  mouseProto._mouseInit = function () {

    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.bind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse init method
    _mouseInit.call(self);
  };

  /**
   * Remove the touch event handlers
   */
  mouseProto._mouseDestroy = function () {

    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.unbind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse destroy method
    _mouseDestroy.call(self);
  };

})(jQuery);
