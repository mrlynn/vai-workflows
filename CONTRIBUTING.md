# Contributing to vai-workflows

This monorepo contains the **official** vai workflow catalog — packages published under the `@vaicli` npm scope.

## For Community Authors

You don't need to contribute here! Create your own workflow package:

```bash
vai workflow create --name my-workflow
# Edit the generated files
npm publish --access public
```

Community workflows use the unscoped `vai-workflow-*` naming convention.

## For Catalog Contributors

### Adding a New Workflow

1. Create a new directory under `packages/`:
   ```
   packages/vai-workflow-your-name/
   ├── package.json
   ├── workflow.json
   ├── README.md
   └── LICENSE
   ```

2. Use `@vaicli/vai-workflow-your-name` as the package name

3. Include the `vai` field in package.json:
   ```json
   {
     "vai": {
       "workflowVersion": "1.0",
       "category": "retrieval|analysis|domain-specific|ingestion|utility|integration",
       "tags": ["tag1", "tag2"],
       "minVaiVersion": "1.27.0",
       "tools": ["query", "rerank", "generate"]
     }
   }
   ```

4. Only use the 14 approved workflow tools (see spec)

5. Run validation: `npm run validate`

6. Open a PR against `main`

### Updating Existing Workflows

- Prompt improvements → patch version bump
- New optional inputs → minor version bump
- Breaking changes to inputs/outputs → major version bump

Version each package independently.
