```markdown
# Arch Linux Development Container

A customized, feature-rich Arch Linux Docker environment tailored for modern development and terminal workflows. It comes pre-configured with Neovim, Zsh, Starship prompt, Tmux, and essential CLI tools.

---

## 🛠️ Included Tools & Stack

* **Operating System:** Arch Linux (`latest`)
* **Shell:** Zsh with `zsh-autocomplete`, `zsh-syntax-highlighting`, and **Starship** prompt
* **Editor:** Neovim (with custom configurations)
* **Terminal Multiplexer:** Tmux (with TPM plugin manager)
* **Runtimes & Compilers:** Node.js, npm, Bun, Rust (`rustup`), GCC, `base-devel`
* **Modern CLI Utilities:** 
  * `eza` (better `ls`)
  * `bat` (better `cat`)
  * `ripgrep` (fast search)

---

## 🚀 Getting Started

### 1. Build the Docker Image
Build the container image from the directory containing your `Dockerfile` and `setup-config-files.sh`:

```bash
docker build -t dev .

```

### 2. Run the Container

To persist your Neovim plugins, cache, and workspace files across container restarts, use named Docker volumes for your data directories along with a bind mount for your repository:

#### **PowerShell (Windows)**

```powershell
docker run -it `
  -v C:\TotalPack\Repos\Other\nutripia:/workspace `
  -v nvim-data:/root/.cache `
  -v nvim-local:/root/.local `
  dev

```

#### **Bash / Linux / macOS**

```bash
docker run -it \
  -v /path/to/your/nutripia:/workspace \
  -v nvim-data:/root/.cache \
  -v nvim-local:/root/.local \
  dev

```

---

## 📁 Volume Persistence Strategy

* **`/workspace`**: Mounted to your local project repository so you can edit files directly from your host machine.
* **`nvim-data` (`/root/.cache`)**: A named Docker volume that preserves Neovim cache, plugin downloads (e.g., via `lazy.nvim`), and LSP binaries so they don't need to be re-downloaded every time the container is recreated.
* **`nvim-local` (`/root/.local`)**: Preserves local state data and extensions.

---

## ⚙️ Customization

Configurations for Neovim, Starship, and Tmux are automatically cloned during the build process from [JooseMM's GitHub repositories](https://www.google.com/search?q=https://github.com/JooseMM). You can modify `setup-config-files.sh` to point to your own dotfiles repository if needed.

```

```
