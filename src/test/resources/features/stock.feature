Feature: Check stock
  As a waiter
  I want to check stock

Background:
  Given the store is ready to service customers
  And a product "Bread" with price 20.50 and stock of 5 exists
  And a product "Jam" with price 80.00 and stock of 10 exists
  And a product "Donut" with price 30.00 and stock of 10 exists

Scenario: Customer buy one product
  When Customer buy "Donut" with quantity 2
  Then "Donut" stock should be remain 8

Scenario: Customer buy multiple products
  When Customer buy "Bread" with quantity 2
  And Customer buy "Jam" with quantity 1
  Then "Bread" stock should be remain 3
  And "Jam" stock should be remain 9


Scenario Outline: Buy one product in table
  When Customer buy <product> with quantity <quantity>
  Then <product> stock should be remain <stock>
  Examples:
    | product  | quantity | stock |
    | "Bread"  |     1    |   4   |
    | "Jam"    |     2    |   8   |
    | "Donut"  |     1    |   9   |
