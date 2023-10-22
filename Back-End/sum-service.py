from langchain.docstore.document import Document
from langchain.text_splitter import CharacterTextSplitter
from langchain.chat_models import ChatOpenAI
from langchain.prompts import PromptTemplate
import tiktoken
from langchain.chains.summarize import load_summarize_chain
import textwrap
from time import monotonic


OPENAI_API_KEY = "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"

def summarize(text):

    model_name = "gpt-3.5-turbo"
    text_splitter = CharacterTextSplitter.from_tiktoken_encoder(
        model_name=model_name
    )
    texts = text_splitter.split_text(text)
    docs = [Document(page_content=t) for t in texts]
    print("no docs", len(docs))
    llm = ChatOpenAI(temperature=0, openai_api_key=OPENAI_API_KEY, model_name=model_name)
    
    # prompt_template = """Write a concise summary of the research paper below. Make it 5-6 sentences long.
    # {text}
    # """

    prompt_template = """
    Pretend you are a video presenter who summarizes a research paper. Be as direct and concise as possible. Use college freshmen vocabulary but keep it professional. Summarize the following research paper conclusion into a speech of 5-6 sentences. Make this speech as an .srt file. Make the duration of each interval 10 seconds long, include 10 seconds worth of speech in each interval assuming a normal speaking speed. Here is an example of .srt format:
```
1
00:00:00,319 --> 00:00:01,879
As someone with an AI background,

2
00:00:01,879 --> 00:00:04,277
I think you can probably explain to us,
```
This is the research paper to summarize:
{text}
    """
    prompt = PromptTemplate(template=prompt_template, input_variables=["text"])

    def num_tokens_from_string(string: str, encoding_name: str) -> int:
        encoding = tiktoken.encoding_for_model(encoding_name)
        num_tokens = len(encoding.encode(string))
        return num_tokens

    num_tokens = num_tokens_from_string(text, model_name)
    print("num tokens:", num_tokens)

    gpt_35_turbo_max_tokens = 4097
    verbose = True  

    if num_tokens < gpt_35_turbo_max_tokens:
        chain = load_summarize_chain(llm, chain_type="stuff", prompt=prompt, verbose=verbose)
    else:
        chain = load_summarize_chain(llm, chain_type="map_reduce", map_prompt=prompt, combine_prompt=prompt, verbose=verbose)

    summary = chain.run(docs)
    return summary

input_prompt = """Much like design itself [22], the practice of ‘feeling ethics’ will be entangled across beliefs, cultures, interpersonal conflicts, ecological struggles, and social dilemmas. Felt ethics as described here presents us, the authors (and perhaps even all soma designers), as relatively homogeneous in our values and beliefs. This means there is still work to be done concerning how the felt ethics approach would meaningfully address conflict within our own position. Ethical and moral intentionalities will inevitably clash – we certainly eschew moral relativism – and we do not envision harmonious agreement (even among ourselves) regarding what we consider to be a morally correct course of action. The reconciliation of first-person approaches with a pluriverse of bodies, values, and opinions remains a question of import for the future development of our position. Our felt ethics is also firmly situated within the perspective of soma design. Other practitioners may articulate different approaches that more meaningfully engage with their specific methodological approach. Some may even articulate their own felt ethics that is different from the one we have outlined here; developing, complimenting, or even challenging the approach we had put forth. We see the value of theory to HCI as inspiring, prompting reflection, and helping designers make practical choices [78], rather than imposing a single way of using or engaging with them [81, 114]. Therefore, we highly encourage other designers to respond to our felt ethics in this fashion and to contribute to a broader discussion on how ethical sensibilities are engaged and cultivated across the wider field of HCI. Moreover, we also call for designers to be attentive to how they practice their ethical sensibilities – whether through a felt ethics or otherwise. In a technological landscape that defies overarching solutions or total moral judgements, we find a need to attend to the ethics we practice in our day-to-day design work.
ChatGPT
Alright, let's break down this research paper conclusion. The authors are saying that 'feeling ethics' in design is pretty tangled up with beliefs, cultures, conflicts, and social issues, similar to how design itself works. They see all the authors and maybe all soma designers as pretty similar in their values. But, there's still some work to do in figuring out how to deal with conflicts in their own position when using 'felt ethics.' They're sure that ethical and moral ideas will clash, and they don't expect everyone to agree on what's morally right.

The authors are thinking about how to mix personal views with lots of different perspectives for the future. They want to make it clear that their 'felt ethics' is based in soma design, and they know other designers might have different approaches. They're open to different ideas and even challenges to what they've said. The authors believe that theory in Human-Computer Interaction (HCI) is more about inspiring and helping designers make choices, rather than telling them what to do. They're inviting other designers to respond to their 'felt ethics' and join a bigger conversation about ethics in HCI. Lastly, they're reminding everyone to be mindful of how they practice ethics in their daily design work, especially in a tech world where there's no one-size-fits-all solution or clear moral rules."""
# input_prompt = "Much like design itself [22], the practice of ‘feeling ethics’ will be entangled across beliefs, cultures, interpersonal conflicts, ecological struggles, and social dilemmas. Felt ethics as described here presents us, the authors (and perhaps even all soma designers), as relatively homogeneous in our values and beliefs. This means there is still work to be done concerning how the felt ethics approach would meaningfully address conflict within our own position. Ethical and moral intentionalities will inevitably clash – we certainly eschew moral relativism – and we do not envision harmonious agreement (even among ourselves) regarding what we consider to be a morally correct course of action. The reconciliation of first-person approaches with a pluriverse of bodies, values, and opinions remains a question of import for the future development of our position. Our felt ethics is also firmly situated within the perspective of soma design. Other practitioners may articulate different approaches that more meaningfully engage with their specific methodological approach. Some may even articulate their own felt ethics that is different from the one we have outlined here; developing, complimenting, or even challenging the approach we had put forth. We see the value of theory to HCI as inspiring, prompting reflection, and helping designers make practical choices [78], rather than imposing a single way of using or engaging with them [81, 114]. Therefore, we highly encourage other designers to respond to our felt ethics in this fashion and to contribute to a broader discussion on how ethical sensibilities are engaged and cultivated across the wider field of HCI. Moreover, we also call for designers to be attentive to how they practice their ethical sensibilities – whether through a felt ethics or otherwise. In a technological landscape that defies overarching solutions or total moral judgements, we find a need to attend to the ethics we practice in our day-to-day design work."

out = summarize(input_prompt)

print(out)




