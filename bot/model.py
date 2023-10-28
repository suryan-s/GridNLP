import torch.nn as nn


# class ChatNet(nn.Module):
#     def __init__(self, input_size, hidden_size, num_classes):
#         super(ChatNet, self).__init__()
#         self.l1 = nn.Linear(input_size, hidden_size)
#         self.l2 = nn.Linear(hidden_size, hidden_size)
#         self.l3 = nn.Linear(hidden_size, num_classes)
#         self.relu = nn.ReLU()
#
#     def forward(self, x):
#         out = self.l1(x)
#         out = self.relu(out)
#         out = self.l2(out)
#         out = self.relu(out)
#         out = self.l3(out)
#         return out


# class ChatNet(nn.Module):
#     def __init__(self, input_size, hidden_size, num_classes, num_layers=5):
#         super(ChatNet, self).__init__()
#
#         self.layers = nn.ModuleList()
#         self.layers.append(nn.Linear(input_size, hidden_size))
#
#         for _ in range(num_layers - 2):
#             self.layers.append(nn.Linear(hidden_size, hidden_size))
#
#         self.layers.append(nn.Linear(hidden_size, num_classes))
#         self.relu = nn.ReLU()
#
#     def forward(self, x):
#         out = x
#         for layer in self.layers[:-1]:
#             out = self.relu(layer(out))
#         out = self.layers[-1](out)
#         return out


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