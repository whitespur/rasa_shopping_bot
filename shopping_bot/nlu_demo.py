# -*-coding:utf-8 -*-
"""
@author:
@file:nlu_demo.py
@time:2019/6/4 2:11 PM
@file_desc:
"""

import asyncio
import json
import logging
import os
from rasa.cli.utils import print_error
from rasa.nlu import components
from rasa.nlu.model import Interpreter
from rasa.train import train_async
from rasa.cli.utils import get_validated_path
from rasa.constants import DEFAULT_MODELS_PATH, DEFAULT_DOMAIN_PATH, DEFAULT_CONFIG_PATH, DEFAULT_DATA_PATH
from rasa.model import get_model, get_model_subdirectories

logger = logging.getLogger(__name__)


def test_train_nlu_core():
    loop = asyncio.get_event_loop()
    train_result = loop.run_until_complete(
        train_async(
            domain=DEFAULT_DOMAIN_PATH,
            config=DEFAULT_CONFIG_PATH,
            training_files=DEFAULT_DATA_PATH,
            output_path=DEFAULT_MODELS_PATH,
            force_training=False,
        )
    )
    print("train_result is {}".format(train_result))
    return train_result


def test_parse():
    # model = get_validated_path(args.model, "model", DEFAULT_MODELS_PATH)
    model = get_validated_path(None, "model", DEFAULT_MODELS_PATH)
    model_path = get_model(model)
    if not model_path:
        print_error(
            "No model found. Train a model before running the "
            "server using `rasa train nlu`."
        )
        exit(1)

    _, nlu_model = get_model_subdirectories(model_path)

    if not os.path.exists(nlu_model):
        print_error(
            "No NLU model found. Train a model before running the "
            "server using `rasa train nlu`."
        )
        exit(1)

    # input shell
    # rasa.nlu.run.run_cmdline(nlu_model)
    print("model_path is {},nlu_model is {}".format(model_path,nlu_model))
    print("please input your text to parse")
    # message = input().strip()
    # message = "这款衣服有货吗"
    message = "身高170体重140"
    interpreter = Interpreter.load(nlu_model, component_builder)
    result = interpreter.parse(message)
    print(json.dumps(result, indent=2))

if __name__ == "__main__":

    component_builder = components.ComponentBuilder()
    test_train_nlu_core()
    test_parse()

