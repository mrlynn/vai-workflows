# vai Workflow Catalog

Official seed workflows for the [vai](https://github.com/mrlynn/voyageai-cli) workflow registry. Each package is a standalone npm package containing a `workflow.json`, `README.md`, and `LICENSE` — no JavaScript, no build step, no dependencies.

## Workflows (20)

| # | Package | Category | Key Pattern |
|---|---------|----------|-------------|
| 1 | vai-workflow-hybrid-precision-search | retrieval | Parallel multi-strategy search |
| 2 | vai-workflow-question-decomposition | retrieval | LLM-driven fan-out / fan-in |
| 3 | vai-workflow-multilingual-search | retrieval | Cross-lingual parallel retrieval |
| 4 | vai-workflow-embedding-drift-detector | analysis | Re-embed and compare |
| 5 | vai-workflow-collection-overlap-audit | analysis | Cross-collection dedup detection |
| 6 | vai-workflow-query-quality-scorer | analysis | Retrieval evaluation without labels |
| 7 | vai-workflow-contract-clause-finder | domain-specific | Legal domain model pipeline |
| 8 | vai-workflow-code-migration-helper | domain-specific | Code domain model pipeline |
| 9 | vai-workflow-financial-risk-scanner | domain-specific | Finance domain model pipeline |
| 10 | vai-workflow-clinical-protocol-match | domain-specific | Clinical retrieval pipeline |
| 11 | vai-workflow-incremental-sync | ingestion | Conditional smart ingestion |
| 12 | vai-workflow-batch-quality-gate | ingestion | Quality-filtered ingestion |
| 13 | vai-workflow-model-shootout | utility | Parallel model comparison |
| 14 | vai-workflow-index-health-check | utility | Diagnostic pipeline |
| 15 | vai-workflow-cost-optimizer | utility | Asymmetric cost analysis |
| 16 | vai-workflow-knowledge-base-bootstrap | integration | End-to-end onboarding |
| 17 | vai-workflow-rag-ab-test | integration | Parallel config comparison |
| 18 | vai-workflow-asymmetric-search | retrieval | Embed large / query lite showcase |
| 19 | vai-workflow-meeting-action-items | domain-specific | Meeting notes extraction pipeline |
| 20 | vai-workflow-doc-freshness | utility | Stale document detection |

## Install a workflow

```bash
vai workflow install vai-workflow-hybrid-precision-search
```

## Run a workflow

```bash
vai workflow run vai-workflow-hybrid-precision-search \
  --input query="How does rate limiting work?" \
  --input collection="engineering_docs"
```

## Tool Coverage

All 14 vai workflow engine tools are exercised across the catalog: `query`, `search`, `rerank`, `embed`, `similarity`, `ingest`, `collections`, `models`, `explain`, `estimate`, `merge`, `filter`, `transform`, `generate`.

## License

MIT © 2026 Michael Lynn
