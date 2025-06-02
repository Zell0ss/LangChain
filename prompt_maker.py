import dotenv
from langchain_openai import ChatOpenAI
from langchain import hub
import argparse

parser = argparse.ArgumentParser(description="get a good prompt from a lazy one.")
parser.add_argument(
    "lazy_prompt", type=str, help="The prompt you want to enhance (e.g. I want to know the steps to install docker composer in my ubuntu server)."
)
parser.add_argument(
    "-t",
    "--task",
    nargs="*",
    help="The task of the prompt (e.g. docker composer installation).",
    default=[],
)


dotenv.load_dotenv()
chat_model = ChatOpenAI(model="gpt-3.5-turbo-0125", temperature=0)
# Im going to retrieve a chat prompt, that is a human + system prompts
chat_prompt_template_propmtmaker = hub.pull("hardkothari/prompt-maker")
propmtmaker_chain = chat_prompt_template_propmtmaker | chat_model

if __name__ == "__main__":
    args = parser.parse_args()
    print(propmtmaker_chain.invoke({"task": args.task, "lazy_prompt": args.lazy_prompt}).content)
