# 🐳 Docker Dev Environments with Neovim + LSP

This repository provides isolated, ready-to-use Docker development environments with **Neovim** and **LSP support** for different programming languages. The goal is to enable clean, clutter-free development without installing languages and tooling directly on your system.

> 💡 Currently supported: **Go**


## 📁 Repository Structure

Each language has its own folder containing:
- A `Dockerfile` and `docker-compose.yaml`
- A sample project directory (e.g., `learnGo`)
- A lightweight Neovim configuration with plugin state caching

Example:
```

dockerenv/
├── go/
│   ├── Dockerfile
│   ├── docker-compose.yaml
│   ├── learnGo/               # Your working project directory
│   ├── .config/nvim/          # User-editable Neovim config
│   ├── .cache/                # Neovim + Go build cache
│   └── .local/                # Neovim state (plugin install, etc.)

````

---

## 🚀 Getting Started (Go Environment Example)

### 1. Clone this repository
```bash
git clone https://github.com/pranav244872/dockerenv.git
cd dockerenv/go
````

### 2. Start the container

```bash
sudo docker-compose up -d
```

### 3. Enter the container shell

```bash
sudo docker exec -it go_dev_env bash
```

### 4. Start coding with Neovim

```bash
nvim
```
### 5. Exit and stopping the container
```bash
exit
sudo docker-compose down
```
---

## ⚙️ Neovim Configuration

You can customize Neovim by editing files in:

```
.config/nvim/init.lua
.config/nvim/lua/
```

The setup uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager, and includes sensible defaults for LSP, formatting, statusline, fuzzy finding, and more.

To avoid reinstalling plugins on every container run:

* Plugin cache is saved in `.local/share/nvim` and `.cache/nvim`
* Build artifacts (e.g., Go) are cached in `.cache/go-build`

---

## 📦 Languages

| Language | Folder | Status  |
| -------- | ------ | ------- |
| Go       | `go/`  | ✅ Ready |
| React       | `react/`  | ✅ Ready |

> More languages (Python, Rust, etc.) will be added soon.

---
