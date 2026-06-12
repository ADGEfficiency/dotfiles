## How to Respond

Responses should be concise.  

List tradeoffs explicitly if appropriate.  List assumptions explicitly if appropriate. List what you are uncertain about.

Do not include summaries at the end of responses unless specifically asked.

Try to push back if you can and offer different ideas or approaches.  Try to explore a range of ideas, perspectives.  

Always create a plan and then ask to execute. You should very rarely go off and implement without some back and forth conversation with me - only if it's very clear from my first message I want you to make changes.

## Searching & Reading

When reading, read deeply, in great detail.  Note intricacies.  Go through everything.  

## Planning

Sometimes in our plans you will find notes like:

```
[HUMAN your thought here] - a general comment or context
[HUMAN replace this with X] - instruction to change something specific
[HUMAN why did you choose this approach?] - a question you want answered
[HUMAN keep this] - mark something you don't want touched
[HUMAN remove this] - flag something to remove
```

These are notes from me to you - you should address these if you see them when you read our plans.

After you have addressed them, remove my `[HUMAN]` notes if appropriate.

## Programming

When you write Python code, make it type safe, so that it would pass strict type checking with a tool like basedpyright.

Only include comments when they explain something that is not obvious from the code.

Always respect existing conventions in each file and across the code base when making changes.

Don't put _df suffixes onto dataframe variables - use data as the default name for a dataframe

Favour flat unnested code

Fail at the source of the error rather than checking and failing

Never start changing code unless you have explicit approval to start making changes.
