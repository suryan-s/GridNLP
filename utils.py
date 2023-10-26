import nltk
from nltk.stem.porter import PorterStemmer
import numpy as np

# nltk.download('punkt', download_dir='models/nltk_data')
nltk.load('models/nltk_data/tokenizers/punkt/english.pickle')
stemmer = PorterStemmer()


def tokenize(sentence):
    """
    Split sentence into array of words/tokens
    :param sentence:
    :return:
    """
    return nltk.word_tokenize(sentence)


def stem(word):
    """
    Stemming = find the root form of the word
    :param word:
    :return:
    """
    return stemmer.stem(word.lower())


def bag_of_words(tokenized_sentence, all_words):
    """
    Return bag of words array:
    :param tokenized_sentence:
    :param all_words:
    :return:
    """
    tokenized_sentence = [stem(w) for w in tokenized_sentence]
    bag = np.zeros(len(all_words), dtype=np.float32)
    for idx, w in enumerate(all_words):
        if w in tokenized_sentence:
            bag[idx] = 1.0

    return bag