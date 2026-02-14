# Instructions

- be as minimal as possible, the simplest implementation is usually best
- when writing code in dynamically typed languages do not add type hints, TypeScript-style annotations, or any optional typing. Keep everything purely dynamic
    - Python, JavaScript, Ruby, Lua, Bash, etc.
    - an exception to this rule are things like dataclasses or pydantic.BaseModel in Python
        - If some feature of the language requires typing (like these) and I want to use it, then use typing but only where necessary
- Code that fails silently is bad. Allow the code to fail or raise an error if something is wrong
- Do not add extra defensive checks or try/catch blocks
- Do not add unnecessary type checking and default/fallback values
- Do not write tests unless asked
- Do not worry about running tests. If I want you to run them I will ask
- When writing docstrings, keep them to one line
