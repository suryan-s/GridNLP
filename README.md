# 🤖 GridNLP - Substation Asset Maintenance Chatbot

## Introduction

GridNLP is an intelligent chatbot designed to assist users in the field of Substation Asset Maintenance. Leveraging natural language processing (NLP), it answers user queries related to maintenance tasks, including test procedures, acceptable limits, issue resolution, safety guidelines, and equipment recommendations. The chatbot aims to provide accurate, detailed, and informative responses to enhance the maintenance processes within the substation industry. The Project was build using Flutter for Mobile app development and FastAPI for python backend development. The models were created using pytorch and basic concepts of NLP. Intentation vs tag matching with cosine similarity have been added for better responses.

## Features

GridNLP offers a range of features to facilitate user interactions:

1. 📚 **Query Responses**: The chatbot provides responses to user queries related to substation maintenance, covering various equipment classes such as transformers, circuit breakers, reactors, surge arrestors, and more.

2. 📋 **Procedure Guidance**: GridNLP offers step-by-step guidance on maintenance procedures for different equipment classes.

3. ⚠️ **Safety Guidelines**: Users can access safety guidelines to ensure secure maintenance practices, adhering to industry regulations and standards.

4. 🔬 **Test Procedures**: The chatbot explains test procedures and acceptable limits for various equipment, allowing users to conduct tests effectively.

5. 🛠️ **Issue Resolution**: GridNLP offers recommendations for resolving issues that may arise during maintenance tasks.

6. 💡 **Equipment Recommendations**: Users can inquire about equipment recommendations based on their specific requirements.

7. 🧠 **Semantic Processing**: The chatbot incorporates semantic processing to understand and respond to user queries more effectively.

8. 🌐 **Industry Standards**: Users can access information on industry standards and regulations governing substation maintenance.

## Getting Started

To interact with GridNLP, you can use the chatbot through a CLI interface or integrate it into your applications. Here's how to get started:


1. 🧩 **API Integration**: For developers, GridNLP offers API endpoints for seamless integration into your applications. Currently the api `https://gridnlp.onrender.com/chatbot/?question=` is live to be integrsted into your application.
2. **Custom Training**: Modify the intents.json for your requirements and run the train.py in bot directory. The resultant model would be available in the models directory. Load them in the server.py for further applications

## Installation

GridNLP build file is available in the repo for the recent updated apk file. 
For further development of the project or for personal use, follow the steps:
1. The project directory contains the Flutter and Python dev envs combined. So for the app development, cd into the flutter/chatbot.
2. For the python backend development, bot directory contains all the necessary files for training, adding new intents.json for custom training, simple cmd based chat etc.
3. Run `python -m venv .env` for creating a new environment. Activate the environment and run `pip -r requirements.txt` to install the necessary packages.
4. To run the server locally, simply do `python server.py` to start the FastAPI server.

[//]: # (## API Documentation)

[//]: # (For developers interested in integrating GridNLP into their applications, the API documentation provides details on available endpoints, request formats, and responses. To access the API documentation, visit [https://GridNLP.com/api-docs]&#40;https://GridNLP.com/api-docs&#41;.)

## Usage Examples

Here are a few examples of how GridNLP can assist users in substation maintenance:

1. 🗣️ **Query**: "How do I maintain a transformer?"
   - **Response**: GridNLP provides step-by-step guidance on transformer maintenance, including safety precautions.

2. 🗣️ **Query**: "What are the acceptable limits for surge arrester tests?"
   - **Response**: GridNLP explains the acceptable limits for surge arrester tests and how to conduct them.

3. 🗣️ **Query**: "I encountered an issue during maintenance. What should I do?"
   - **Response**: GridNLP offers recommendations to troubleshoot and resolve common maintenance issues.

## Industry Standards

GridNLP emphasizes compliance with industry standards and regulations. Some of the key standards it covers include:

- 📊 IEEE Standards
- 📜 ANSI Standards
- 🔥 NFPA 70E
- 🏭 OSHA Regulations

By adhering to these standards, users can ensure the safety and reliability of substation equipment.

## Contributing

We welcome contributions from the community to enhance GridNLP's capabilities and accuracy. If you'd like to contribute, please follow our [Contributing Guidelines](CONTRIBUTING.md).

## License

GridNLP is released under the [MIT License](LICENSE).

## Support

If you encounter any issues, have questions, or need assistance, please contact our support team at [suryans0405@gmail.com](mailto:suryans0405@gmail.com).

GridNLP - Empowering Substation Asset Maintenance with NLP.
