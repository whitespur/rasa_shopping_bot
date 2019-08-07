 ## only cloth
 * cloth_start
     - utter_ask_height_weight
 * inform_height_weight
     - utter_cloth_recommend
 * goodbye
     - utter_goodbye

 ## form action
 * cloth_start
     - utter_ask_height_weight
 * inform_height_weight
     - height_weight_form
     - form{"name": "height_weight_form"}
     - form{"name": null}
     - utter_slots_values
 * goodbye
     - utter_goodbye

## happy path
* greet
  - utter_greet
* mood_great
  - utter_happy

## sad path 1
* greet
  - utter_greet
* mood_unhappy
  - utter_cheer_up
  - utter_did_that_help
* affirm
  - utter_happy

## sad path 2
* greet
  - utter_greet
* mood_unhappy
  - utter_cheer_up
  - utter_did_that_help
* deny
  - utter_goodbye

## say goodbye
* goodbye
  - utter_goodbye
