# Claude Code en WSL

## Instalar WSL

En PowerShell:

```bash
wsl --install
wsl --install Ubuntu
```

## Instalar Claude Code

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## Setup personalizado

```bash
curl -sL https://raw.githubusercontent.com/oscargull/claude-wsl/main/setup.sh | bash
```

Te pedirá las API keys y las guarda en `~/.secrets` como:

```
DEEPSEEK_API_KEY=<api-key-aqui>
GLM_API_KEY=<api-key-aqui>
KIMI_API_KEY=<api-key-aqui>
```

## Uso

```bash
claude-kimi
claude-deepseek
claude-glm
```
