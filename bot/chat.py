import random
import json
import torch
import os
from model import ChatNet
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from utils import bag_of_words, tokenize, spelling_correction

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

with open('intents.json') as f:
    intents = json.load(f)

FILE = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "models", "torch", "data.pth")
data = torch.load(FILE)
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

bot_name = "Akash"
print("Let's chat! Type 'quit' to exit")
while True:
    sentence = input("You: ")
    if sentence == "quit":
        break
    sentence = spelling_correction(sentence)
    sentence_ = sentence
    sentence = tokenize(sentence)
    X = bag_of_words(sentence, all_words)
    X = X.reshape(1, X.shape[0])
    X = torch.from_numpy(X)

    output = model(X)
    _, predicted = torch.max(output, dim=1)
    tag = tags[predicted.item()]

    probs = torch.softmax(output, dim=1)
    prob = probs[0][predicted.item()]

    if prob.item() > 0.70:
        for intent in intents["intents"]:
            if tag == intent["tag"]:
                # print(f'{bot_name} : {random.choice(intent["responses"])}')
                responses = intent["responses"]
                tfidf_matrix = vectorizer.fit_transform([sentence_] + responses)
                cosine_similarities = linear_kernel(tfidf_matrix[0:1], tfidf_matrix[1:]).flatten()
                best_response = responses[cosine_similarities.argmax()]
                print(f'{bot_name} : {best_response}')
    else:
        print(f'{bot_name} : Sorry I don\'t know')