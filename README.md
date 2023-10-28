# 🤖 GridNLP - Substation Asset Maintenance Chatbot


<br>


## Introduction


<div style="display: flex; justify-content: center; align-items: center;">
  <p style="text-align: center;">
    GridNLP represents a conversational chat bot system engineered to provide indispensable support within the realm of Substation Asset Maintenance. By harnessing the capabilities of Natural Language Processing (NLP), GridNLP adeptly addresses user inquiries pertaining to maintenance procedures, assessment thresholds, issue troubleshooting, safety protocols, and equipment recommendations. Notably, GridNLP remains an ongoing development effort, dedicated to delivering precision, granularity, and insightful feedback to augment the maintenance protocols within the substation industry.

The development framework for this endeavor is founded on tools such as NLTK, PyTorch, and FastAPI for the Python backend, complemented by the utilization of Flutter for mobile application development. The retrieval of responses is orchestrated through advanced techniques, including cosine similarity and tag matching. Additionally, a robust spell checker has been seamlessly integrated into the backend to ensure optimal response quality.
  </p>
<!--   <img src="https://github.com/suryan-s/GridNLP/assets/76394506/ee9510cd-c7ce-4c8c-b711-5006e0da1527" alt="Logo" style="width: 100px; height: 100px;"> -->
</div>

<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/suryan-s/GridNLP/assets/76394506/b03013c8-46c7-4eed-b211-2680cab74f84" alt="Image 1" width="48%">
  <img src="https://github.com/suryan-s/GridNLP/assets/76394506/ca3ff4f2-6363-4cbb-82b7-64eb8a3114b2" alt="Image 2" width="48%">
</div>


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


## Getting Started and Installation

GridNLP APK file is available in the release bundle of the repo. For setting up the server or re-configure the setup for your needs, follow the steps:
1. Clone the repo and setup an environment in the directory by running `python -m venv .env`.
2. Activate the environment
3. Run `pip install -r requirements.txt` for installing the packages required for the project. The project was tested and developed for version 3.10>.
4. Now, for custom training , cd to bots and change the `intents.json` for custom responses and `model.py` as per your need. After running `train.py`, the trained file would be present in the models directory.
5. Make necessary changes in the server and run `python server.py` for starting the local server.
6. For using the API, the server is hosted in render.com and the api for QnA could be done by using this : <br> `https://gridnlp.onrender.com/chatbot/?question=<your_query>`
7. For flutter development, cd into flutter/chatbot for accessing the flutter directory.

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

If you encounter any issues, have questions, or need assistance, please contact our support team at [suryannasa@gmail.com](mailto:suryannasa@gmail.com).

GridNLP - Empowering Substation Asset Maintenance with NLP.
