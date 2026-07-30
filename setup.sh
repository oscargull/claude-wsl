#! /bin/bash

cd 

read -p  "API Key de Deepseek: " deepseek_ak

read -p "API Key de z.ai (GLM): " glm_ak

read -p "API Key de Kimi: " kimi_ak



echo "DEEPSEEK_API_KEY=$deepseek_ak" > ~/.secrets
echo "GLM_API_KEY=$glm_ak" >> ~/.secrets
echo "KIMI_API_KEY=$kimi_ak" >> ~/.secrets

cat << 'EOF' >> ~/.bashrc

# --- Cargar api keys
if [ -f ~/.secrets ]; then
        source ~/.secrets
fi

# --- Claude proveedores personalizados --- 
claude-deepseek() {
    export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
    export ANTHROPIC_AUTH_TOKEN="${DEEPSEEK_API_KEY}"
    export ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro"
    export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro"
    export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
    claude "$@"
}

claude-kimi() {
    export ANTHROPIC_BASE_URL="https://api.moonshot.ai/anthropic"
    export ANTHROPIC_AUTH_TOKEN="${KIMI_API_KEY}"
    export ANTHROPIC_DEFAULT_OPUS_MODEL="kimi-k3"
    export ANTHROPIC_DEFAULT_SONNET_MODEL="kimi-k2.6"
    export ANTHROPIC_DEFAULT_HAIKU_MODEL="kimi-k2-turbo-preview"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
    claude "$@"
}

claude-glm(){
    export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
    export ANTHROPIC_AUTH_TOKEN="${GLM_API_KEY}"
    export ANTHROPIC_DEFAULT_OPUS_MODEL="glm-5.2"
    export ANTHROPIC_DEFAULT_SONNET_MODEL="glm-4.7"
    export ANTHROPIC_DEFAULT_HAIKU_MODEL="glm-4.7-flash"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
    claude "$@"
}
# ---------------------------------
EOF

source ~/.bashrc
