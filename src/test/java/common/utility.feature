@commonUtil
Feature: Common Utilities

  Scenario:

    * def uuid =
    """
    function() {
      var UUID = Java.type('java.util.UUID');
      return UUID.randomUUID().toString();
    }
    """

    * def getDate =
    """
    function(d) {
      var LocalDate = Java.type('java.time.LocalDate');
      var dateNow = LocalDate.now();

      var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
      var formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

      var dateToFormat = dateNow.plusDays(d);
      return dateToFormat.format(formatter)
    }
    """

    * def randomNumber =
    """
    function(){
      var num = "" + (Math.floor(Math.random()*(999-100+1)+100))+Date.now();
      return num.slice(0,7);
    }
    """
