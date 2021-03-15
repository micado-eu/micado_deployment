from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction
import requests
import logging
import os

logger = logging.getLogger(__name__)
root = logging.getLogger()
root.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root.addHandler(handler)
logger.addHandler(handler)

class DocumentForm(FormAction):
    """Example of a custom form action"""

    def name(self) -> Text:
        """Unique identifier of the form"""

        return "document_form"

    @staticmethod
    def required_slots(tracker: Tracker) -> List[Text]:
        """A list of required slots that the form has to fill"""

        return ["document"]

    def slot_mappings(self) -> Dict[Text, Union[Dict, List[Dict]]]:
        """A dictionary to map required slots to
            - an extracted entity
            - intent: value pairs
            - a whole message
            or a list of them, where a first match will be picked"""

        return {
            "document": self.from_entity(entity="document", not_intent="chitchat"),
        }

    # USED FOR DOCS: do not rename without updating in docs
    @staticmethod
    def document_db() -> List[Text]:
        """Database of supported cuisines"""

        return [
            "residence permit",
            "stamp duty",
            "identity card",
        ]


    # USED FOR DOCS: do not rename without updating in docs
    def validate_document(
        self,
        value: Text,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        """Validate document value."""

        if value.lower() in self.document_db():
            # validation succeeded, set the value of the "document" slot to value
            return {"document": value}
        else:
            dispatcher.utter_message(template="utter_wrong_document")
            # validation failed, set this slot to None, meaning the
            # user will be asked for the slot again
            return {"document": None}


    def submit(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict]:
        """Define what the form has to do
            after all required slots are filled"""
        
        lang = "en"
        document = tracker.get_slot("document")
        print(os.environ['API_HOSTNAME'])
        print(os.environ['MICADO_API_KEY'])
        url = "https://"+os.environ['API_HOSTNAME']+"/backend/1.0.0/process_x_doc"

        logger.info(tracker)
        logger.info(url)
        
        headers = {"Prefer": "resolution=merge-duplicates","apikey": os.environ['MICADO_API_KEY']}
        params=[('lang','en'), ('document',document)]
        response_dict = requests.get(url, headers=headers, params=params)

        # logger.info(response_dict.headers)
        logger.info(response_dict.text)
        logger.info(response_dict.request)
        logger.info(response_dict)
        # utter submit template
        dispatcher.utter_message(channel="micado", custom=response_dict.text)
        return []

