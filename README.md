## Setup Turborepo

Effortless [node](https://nodejs.org/en) and [pnpm](https://pnpm.io/es/) setup for [turborepo](https://turbo.build/) projects.
Easily configure your CI workflows based on your project’s `package.json` — perfect for modern JavaScript monorepos using [turborepo](https://turbo.build/).

### ✨ Features

This action is designed to make setting up monorepo projects with [turborepo](https://turbo.build/) on **GitHub Actions** **fast**, **reliable**, and **effortless**. It automatically handles [nodejs](https://nodejs.org/en) and [pnpm](https://pnpm.io/es/) setup. So you can focus on building and deploying your applications instead of managing your workflow configuration.

#### 🚀 **Automatic Node.js version detection**

Detects and installs the exact [node](https://nodejs.org/en) version specified in your `package.json`. This ensures that your workflows always run in the same environment as your development setup, reducing the _"it works on my machine"_ problems.

#### ⚡ **Fast and Reliable PNPM setup with caching**

Installs [pnpm](https://pnpm.io/es/), the fast, disk space-efficient package manager optimized for monorepos. Built-in caching automatically reuses previously installed dependencies across workflow runs, saving time and reducing bandwidth usage.

By combining automatic environment setup, intelligent dependency caching, and monorepo-specific optimizations, this action ensures your CI/CD pipelines are faster, more consistent, and easier to maintain.

### 📋 Prerequisites

Before using this action, make sure your monorepo meets the following requirements. You must have a `package.json` file located at the root of your repository. In this file, the [node](https://nodejs.org/en) version should be defined under the `engines` field, for example:

```json
{
  "engines": {
    "node": "20.x"
  }
}
```

Additionally, the `packageManager` field should be set to specify the [pnpm](https://pnpm.io/es/) version your project uses. An example would be:

```json
{
  "packageManager": "pnpm@10.8.0"
}
```

The action will automatically detect and install the correct [node](https://nodejs.org/en) version based on the `engines.node` field and configure the appropriate [pnpm](https://pnpm.io/es/) version based on the `packageManager` field.

Defining both **engines** and **packageManager** fields is highly recommended and considered a best practice for modern javascript projects, as it enforces the correct runtime environment across development, testing, and deployment stages.

### 🚀 Usage

Setting up your monorepo environment is simple. Add the following job to your github actions workflow:

```yaml
# This workflow sets up a monorepo environment by installing node
# and pnpm automatically.
name: Setup

# Trigger this workflow on every push to the 'main' branch.
on:
  push:
    branches:
      - main

# Define the job.
jobs:
  setup:
    # Run the job on the latest ubuntu runner.
    runs-on: ubuntu-latest

    steps:
      # Step 1: Checkout the repository.
      - name: Checkout
        uses: actions/checkout@v4

      # Step 2: Setup node and pnpm based on package.json.
      - name: Setup
        uses: evners/setup-turborepo@v1
```

After running this action, your monorepo environment will be ready to install dependencies, run builds, or execute any [turborepo](https://turbo.build/) commands without additional setup.

### 📥 Inputs

This action does not require any manual inputs. It automatically detects the required configuration by reading your `package.json`:

- **Node** version is detected from the `engines.node` field.
- **PNPM** version is detected from the `packageManager` field.

No additional parameters are needed — everything is inferred from your project setup to ensure a smooth and automatic environment configuration.

### 📤 Outputs

After the setup is complete, the following outputs are available:

| 🏷️ Output      | 📄 Description                    | 🛠️ Example |
| -------------- | --------------------------------- | ---------- |
| `node-version` | The exact node version installed. | 20.19.0    |
| `pnpm-version` | The exact pnpm version installed. | 10.8.0     |

You can reference these outputs in subsequent steps of your workflow if needed. For example:

```yaml
- name: Print versions
  run: |
    echo "Node.js version: ${{ steps.setup.outputs.node-version }}"
    echo "pnpm version: ${{ steps.setup.outputs.pnpm-version }}"
```

This can be useful for debugging, ensuring reproducibility, or dynamically adjusting your pipeline based on the installed versions.

### 🛡️ Security

If you discover any security issues, please responsibly disclose them by following our [Security Policy](./SECURITY.md).

### 🤝 Contributing

Contributions are welcome! Please check out our [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines before starting.

### 📄 License

This project is licensed under the [MIT License](./LICENSE).
