@checkout
Feature: Signup user then Login user
  Scenario: Add to cart an item

    # Open Website
    * driver BASE_URL

    # Search an item
    * waitFor(SEARCH_FIELD)
    * input(SEARCH_FIELD,ITEM_NAME)
    * input(SEARCH_FIELD, Key.ENTER)
    * delay(10000)

    # Click first item on Product Listing Page
    * waitFor(PLP_FIRST_ITEM).click()
    * delay(30000)

    # Add item to cart from Product Detail Page
    * scroll(ADD_TO_CART_BUTTON).click()
    * waitFor(CART_POPUP)
    * waitFor(CHECKOUT_BUTTON).click()
    * delay(10000)

    # Complete login and initiate checkout process wizard
    * scroll(PROCEED_TO_CHECKOUT_BUTTON).click()
    * delay(10000)
    * input(EMAIL_FIELD,EMAIL_ADDRESS)
    * input(PASSWORD_FIELD,PASSWORD)
    * waitFor(SUBMIT_BUTTON).click()

    # Complete checkout wizard process
    * scroll(SUBMIT_ADDRESS).click()
    * waitFor(TERM_AND_CONDITION_CHECKBOX).click()
    * scroll(SUBMIT_SHIPPING).click()
    * scroll(PAY_BY_CHECK_LINK).click()
    * scroll(CONFIRM_ORDER_BUTTON).click()

    # Assert/Validate successful checkout message
    * waitFor(SUCCESS_MESSAGE_ELEMENT)
    * match text(SUCCESS_MESSAGE_ELEMENT) == SUCCESS_MESSAGE_TEXT

    # Print success on console
    * print "***********************"
    * print text(SUCCESS_MESSAGE_ELEMENT)
    * print "***********************"
