# vai-workflow-code-search

Index, search, explain, and find duplicate code across any codebase using Voyage AI's code-optimized embedding models and MongoDB Atlas Vector Search. Transform any project into a semantically searchable knowledge base.

## Install

```bash
vai workflow install vai-workflow-code-search
```

## How It Works

1. **Index** — Scan, chunk, and embed all files in a local directory or remote GitHub repo into MongoDB Atlas Vector Search. Supports incremental refresh so you only re-index what changed.
2. **Search** — Search indexed code using natural language. Find implementations by intent, not just keywords.
3. **Explain** — Ask questions about the codebase and get AI-generated explanations grounded in the actual source code via RAG.
4. **Find Similar** — Paste a snippet or reference a file to detect duplicate or semantically similar code across the indexed codebase.

## Pipelines

| Pipeline | Steps | Use Case |
|----------|-------|----------|
| Index & Search | index → search | Index a codebase then run a semantic search query |
| Index & Explain | index → explain | Index a codebase then ask questions about it via RAG |
| Full Code Audit | index → search → find-similar → explain | Index, search for patterns, find duplicates, and generate explanations |

## Example Usage

```bash
# Index a local project and search
vai workflow run vai-workflow-code-search \
  --input source="/path/to/project" \
  --input query="where do we handle authentication timeouts?"

# Index a GitHub repo
vai workflow run vai-workflow-code-search \
  --input source="https://github.com/org/repo" \
  --input collection="my_codebase"

# Search indexed code (after indexing)
vai workflow run vai-workflow-code-search \
  --input query="How does the authentication middleware work?" \
  --input collection="my_codebase"

# Find similar code
vai workflow run vai-workflow-code-search \
  --input code="async function fetchUser(id) { return await db.users.findOne({ _id: id }); }" \
  --input collection="my_codebase"
```

## Models Used

- `voyage-code-3` — Code-optimized embeddings (default for source files)
- `voyage-4-large` — General-purpose embeddings (used for docs/markdown)
- `rerank-2.5` — Reranker for improved search relevance

## What This Teaches

- `voyage-code-3` understands code semantics — variable names, control flow, API patterns
- Code snippets work as search queries, finding structurally similar code
- Incremental refresh detects changed files via content hashing and only re-embeds what changed
- RAG-powered explain uses retrieved code chunks as context for grounded, cited answers

## License

MIT © 2026 Michael Lynn
