# ENC BentoPDF Pack

Pacote para personalizar o BentoPDF com identidade visual da ENC Network.

## Arquivos

- `docker-compose.yml`: compose para o Coolify usando build local.
- `Dockerfile`: cria uma imagem personalizada baseada no BentoPDF original.
- `inject-enc.sh`: injeta CSS, JS, logo e favicon no frontend.
- `enc-custom.css`: identidade visual ENC.
- `enc-brand.js`: altera título, textos e adiciona banner ENC.
- `enc-logo.svg`: logo simples em SVG.
- `favicon.svg`: favicon simples.

## Como usar no Coolify

1. Crie um repositório Git, por exemplo `enc-bentopdf`.
2. Envie todos estes arquivos para a raiz do repositório.
3. No Coolify, crie um novo recurso usando esse repositório, ou altere o projeto atual para usar Git Repository.
4. Escolha Docker Compose como build/deploy.
5. Confirme que o compose usa `build: .` e não `image:`.
6. Configure o domínio como `http://app.encnetwork.com.br:8080` ou outro domínio/subdomínio desejado.
7. Clique em Deploy/Redeploy.

## Observação

Se quiser voltar para o BentoPDF original, troque no compose:

```yaml
build: .
```

por:

```yaml
image: 'ghcr.io/alam00000/bentopdf:v1.16.1'
```
