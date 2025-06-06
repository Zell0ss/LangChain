# Build an LLM RAG Chatbot With LangChain

This repo is an alternative one that contains the source code for [Build an LLM RAG Chatbot With LangChain](https://realpython.com/build-llm-rag-chatbot-with-langchain/)

To run the final application that you'll build in this tutorial, you can use the code provided in `source_code_final/`.

Into each lesson I put jupyter notebooks. One with the lesson and my insights with the code snippets to execute there and, in some cases, another with the call directly to the python modules of the lesson to test them interactively, REPL like.

- [Lesson 1](./source_code_step_1/First_Lesson.ipynb), [Tester](./source_code_step_1/tester.ipynb)
- [Lesson 2](./source_code_step_2/Second_Lesson.ipynb)
- [Lesson 3](./source_code_step_3/Third_Lesson.ipynb)
- [Lesson 4](./source_code_step_4/Fourth_Lesson.ipynb), [Tester](./source_code_step_4/chatbot_api/src/tester.ipynb)
- [Lesson 5](./source_code_step_5/Fifth_Lesson.ipynb)

Head for each of the lesson ones first if you want to follow the course without following the web page. 

💡 If you want only an introduction to Langchain and how to implement prompt templates and chains with it you can head to [this notebook](./First_Steps_With_LangChain.ipynb) instead. 


Some other summaries:
- [promt engineering](https://claude.ai/public/artifacts/897fb0f4-0ea7-4f38-8b42-d5c4ec36a50b)
- [graph database modeling](https://claude.ai/public/artifacts/e57c51c8-9389-417e-8500-492eb40c5030)

## Setup

Create a `.env` file in the root directory and add the following environment variables. Replicate or link it it on each source_code_* folders for them to function:

```.env
OPENAI_API_KEY=<YOUR_OPENAI_API_KEY>

NEO4J_URI=<YOUR_NEO4J_URI>
NEO4J_USERNAME=<YOUR_NEO4J_USERNAME>
NEO4J_PASSWORD=<YOUR_NEO4J_PASSWORD>

HOSPITALS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/hospitals.csv
PAYERS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/payers.csv
PHYSICIANS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/physicians.csv
PATIENTS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/patients.csv
VISITS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/visits.csv
REVIEWS_CSV_PATH=https://raw.githubusercontent.com/hfhoffman1144/langchain_neo4j_rag_app/main/data/reviews.csv

HOSPITAL_AGENT_MODEL=gpt-3.5-turbo-1106
HOSPITAL_CYPHER_MODEL=gpt-3.5-turbo-1106
HOSPITAL_QA_MODEL=gpt-3.5-turbo-0125

CHATBOT_URL=http://host.docker.internal:8000/hospital-rag-agent
```

The chatbot uses OpenAI LLMs, so you'll need to create an [OpenAI API key](https://realpython.com/generate-images-with-dalle-openai-api/#get-your-openai-api-key) and store it as `OPENAI_API_KEY`. 

The three `NEO4J_` variables are used to connect to your Neo4j AuraDB instance. Follow the directions [here](https://neo4j.com/cloud/platform/aura-graph-database/?ref=docs-nav-get-started) to create a free instance.

Once you have a running Neo4j instance, and have filled out all the environment variables in `.env`, you can run the entire project with [Docker Compose](https://docs.docker.com/compose/). You can install Docker Compose by following [these directions](https://docs.docker.com/compose/install/).

And if you need a cheap dirt virtual server where deploy this all you can head to [clouding](https://portal.clouding.io/)

Once you've filled in all of the environment variables, set up a Neo4j AuraDB instance, and installed Docker Compose, open a terminal and run:

```console
$ docker-compose up --build
```

After each container finishes building, you'll be able to access the chatbot API at `http://localhost:8000/docs` and the Streamlit app at `http://localhost:8501/`.
