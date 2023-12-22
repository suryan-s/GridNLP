import json
import os

import nltk
import numpy as np
import torch.nn as nn
from nltk.corpus import words
from nltk.metrics.distance import jaccard_distance
from nltk.stem.porter import PorterStemmer
from nltk.util import ngrams
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from torch import device, cuda, load, from_numpy, max, softmax


class ChatNet(nn.Module):
    def __init__(self, input_size, hidden_size, num_classes, num_layers=5):
        super(ChatNet, self).__init__()

        self.layers = nn.ModuleList()
        self.layers.append(nn.Linear(input_size, hidden_size))

        for _ in range(num_layers - 2):
            self.layers.append(nn.Linear(hidden_size, hidden_size))

        self.layers.append(nn.Linear(hidden_size, num_classes))
        self.elu = nn.ELU()

    def forward(self, x):
        out = x
        for layer in self.layers[:-1]:
            out = self.elu(layer(out))
        out = self.layers[-1](out)
        return out


nltk.download('punkt')
nltk.download('words')
nltk.data.path.append(os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                   "models", "nltk_data"))
stemmer = PorterStemmer()
device = device("cuda" if cuda.is_available() else "cpu")

try:
    with open(os.path.join('bot', 'intents')) as f:
        intents = json.load(f)
except FileNotFoundError:
    with open('intents.json') as f:
        intents = json.load(f)
FILE = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "models", "torch", "data.pth")
data = load(FILE)
input_size = data["input_size"]
hidden_size = data["hidden_size"]
output_size = data["output_size"]
all_words = data["all_words"]
tags = data["tags"]
model_state = data["model_state"]

model = ChatNet(input_size, hidden_size, output_size).to(device)
model.load_state_dict(model_state)
model.eval()
vectorizer = TfidfVectorizer()
word_set = words.words()


def tokenize(sentence):
    """
    Split sentence into an array of words/tokens
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


def spelling_correction(input_sentence):
    """
    Correct spelling of words
    :param input_sentence:
    :return:
    """
    # input_sentence = tokenize(input_sentence)
    corrected_sentence = []
    for word in tokenize(input_sentence):
        if len(word) > 1:
            temp = [(jaccard_distance(set(ngrams(word, 2)), set(ngrams(w, 2))), w)
                    for w in word_set if w[0] == word[0]]
            corrected_sentence.append(sorted(temp, key=lambda val: val[0])[0][1])
        else:
            corrected_sentence.append(word)
    return " ".join(corrected_sentence)


def get_bot_response(input_sentence: str):
    """
    Get a response from the bot
    :param input_sentence:  question to ask the chatbot
    :return: response from the bot
    """
    sentence = spelling_correction(input_sentence)
    sentence = tokenize(sentence)
    X = bag_of_words(sentence, all_words)
    X = X.reshape(1, X.shape[0])
    X = from_numpy(X)

    output = model(X)
    _, predicted = max(output, dim=1)
    tag = tags[predicted.item()]

    probs = softmax(output, dim=1)
    prob = probs[0][predicted.item()]

    if prob.item() > 0.60:
        for intent in intents["intents"]:
            if tag == intent["tag"]:
                # print(f'{bot_name} : {random.choice(intent["responses"])}')
                responses = intent["responses"]
                tfidf_matrix = vectorizer.fit_transform([input_sentence] + responses)
                cosine_similarities = linear_kernel(tfidf_matrix[0:1], tfidf_matrix[1:]).flatten()
                best_response = responses[cosine_similarities.argmax()]
                return best_response
    else:
        return "Sorry I don\'t know'"


if __name__ == "__main__":
    sentence = "How long does shipping take?"
    words = tokenize(sentence)
    print(words)
    stem_words = [stem(w) for w in words]
    print(stem_words)
    words = ["hi", "hiiii", "hiiiiiii"]
    stem_words = [stem(w) for w in words]
    print(stem_words)
    print(spelling_correction("hiiii thiss iss nott a cortectt worrd"))
