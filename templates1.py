import dotenv
from langchain_openai import ChatOpenAI
from langchain.prompts import PromptTemplate

dotenv.load_dotenv()

template_str = """You're an expert on {topic}. ...

{context}

{question}"""

prompt_template = PromptTemplate.from_template(template_str)
filled_prompt = prompt_template.format(
    topic="User feedback", context="I love it here!", question="Any positives?"
)

chat_model = ChatOpenAI(model="gpt-4o", temperature=0)
print(chat_model.invoke(filled_prompt))
