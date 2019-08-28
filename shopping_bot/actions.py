# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/core/actions/#custom-actions/

from typing import Text, List, Dict, Union, Any
import requests
import logging
from rasa_sdk import Action
from rasa_sdk import Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

logging.basicConfig(level=logging.INFO,format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


def get_tuling_response(msg):
    # 替换成自己的key
    key = "xxx"
    api = 'http://www.tuling123.com/openapi/api?key={}&info={}'.format(
        key, msg)
    return requests.get(api).json()


class ActionDefaultFallback(Action):
    """Executes the fallback action and goes back to the previous state
    of the dialogue"""

    def name(self) -> Text:
        return "my_fallback_action"

    def run(self, dispatcher, tracker, domain):

        # dispatcher.utter_template("utter_my_default", tracker)
        state = tracker.current_state()
        logger.info("action_my_fallback_action current state is {}\n".format(state))
        message_text = tracker.latest_message.get('text')
        response = get_tuling_response(message_text).get('text')
        logger.info("action_my_fallback_action latest_message is {},response is {}".format(message_text,response))
        dispatcher.utter_message(response)
        # return [UserUtteranceReverted()]
        return []

    class HeightWeightForm(FormAction):
        """Example of a custom form action"""

        def name(self) -> Text:
            """Unique identifier of the form"""

            return "height_weight_form"

        @staticmethod
        def required_slots(tracker: Tracker) -> List[Text]:
            """A list of required slots that the form has to fill"""
            return ["height", "weight"]

        def slot_mappings(self) -> Dict[Text, Union[Dict, List[Dict]]]:
            """A dictionary to map required slots to
                - an extracted entity
                - intent: value pairs
                - a whole message
                or a list of them, where a first match will be picked"""

            return {
                "height": [
                    self.from_entity(
                        entity="height", intent=["inform_height_weight"]
                    ),
                ],
                "weight": [
                    self.from_entity(
                        entity="weight", intent=["inform_height_weight"]
                    ),
                ],
            }

        def submit(
                self,
                dispatcher: CollectingDispatcher,
                tracker: Tracker,
                domain: Dict[Text, Any],
        ) -> List[Dict]:
            """Define what the form has to do
                after all required slots are filled"""
            # print("submit------tracker is {}",tracker)
            slot_to_fill = tracker.get_slot("requested_slot")
            logger.info("-------submit start slot_to_fill is '{}'"
                        "".format(slot_to_fill))
            # utter submit template
            dispatcher.utter_template("utter_cloth_recommend", tracker)
            return []