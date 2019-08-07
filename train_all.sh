rasa train
#http://rasa.com/docs/rasa/user-guide/command-line-interface/
#usage: rasa train [-h] [-v] [-vv] [--quiet] [--data DATA [DATA ...]]
#                  [-c CONFIG] [-d DOMAIN] [--out OUT]
#                  [--augmentation AUGMENTATION] [--debug-plots]
#                  [--dump-stories] [--fixed-model-name FIXED_MODEL_NAME]
#                  [--force]
#                  {core,nlu} ...
#
#positional arguments:
#  {core,nlu}
#    core                Trains a Rasa Core model using your stories.
#    nlu                 Trains a Rasa NLU model using your NLU data.
#
#optional arguments:
#  -h, --help            show this help message and exit
#  --data DATA [DATA ...]
#                        Paths to the Core and NLU data files. (default:
#                        ['data'])
#  -c CONFIG, --config CONFIG
#                        The policy and NLU pipeline configuration of your bot.
#                        (default: config.yml)
#  -d DOMAIN, --domain DOMAIN
#                        Domain specification (yml file). (default: domain.yml)
#  --out OUT             Directory where your models should be stored.
#                        (default: models)
#  --augmentation AUGMENTATION
#                        How much data augmentation to use during training.
#                        (default: 50)
#  --debug-plots         If enabled, will create plots showing checkpoints and
#                        their connections between story blocks in a file
#                        called `story_blocks_connections.html`. (default:
#                        False)
#  --dump-stories        If enabled, save flattened stories to a file.
#                        (default: False)
#  --fixed-model-name FIXED_MODEL_NAME
#                        If set, the name of the model file/directory will be
#                        set to the given name. (default: None)
#  --force               Force a model training even if the data has not
#                        changed. (default: False)
#
#Python Logging Options:
#  -v, --verbose         Be verbose. Sets logging level to INFO. (default:
#                        None)
#  -vv, --debug          Print lots of debugging statements. Sets logging level
#                        to DEBUG. (default: None)
#  --quiet               Be quiet! Sets logging level to WARNING. (default:
#                        None)