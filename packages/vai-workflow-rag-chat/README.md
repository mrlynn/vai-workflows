# vai-workflow-rag-chat

Retrieval-Augmented Generation chat: searches your knowledge base, reranks for relevance, filters low-quality matches, and generates a grounded answer with source citations

## Prerequisites

- [voyageai-cli](https://github.com/mrlynn/voyageai-cli) installed
- A MongoDB collection with embedded documents
- An LLM provider configured (`vai config set llm-provider ...`)

## Inputs

| Input | Type | Required | Default | Description |
|-------|------|----------|---------|-------------|
| question | string | Yes | — | The user's question or message |
| collection | string | Yes | — | Knowledge base collection to search |
| collection2 | string | No |  | Optional second collection for broader search (leave empty to skip) |
| limit | number | No | 10 | Maximum documents to retrieve per collection |
| min_score | number | No | 0.3 | Minimum relevance score (0-1) to include a document |
| system_prompt | string | No | You are a knowledgeable assistant. Answer questions accurately based on the provided context. Always cite your sources by referencing the document name or source field. If the context does not contain enough information to answer fully, say so clearly and explain what information is missing. Never fabricate information that is not in the provided context. | Custom system prompt for the LLM |
| chat_history | string | No |  | Previous conversation turns (for multi-turn context) |

## Usage

```bash
vai workflow run vai-workflow-rag-chat \
  --input question="..." \
  --input collection="..."
```

## Steps

1. **Search primary knowledge base** — `query`
2. **Check if second collection is configured** — `conditional`
3. **Search secondary knowledge base** — `query`
4. **Pass primary results through** — `template`
5. **Merge results from all collections** — `merge`
6. **Rerank by relevance to question** — `rerank`
7. **Filter out low-relevance documents** — `filter`
8. **Check if any relevant context was found** — `conditional`
9. **Assemble prompt with context and history** — `template`
10. **Generate grounded answer with LLM** — `generate`
11. **Handle no relevant context found** — `template`

## License

MIT
