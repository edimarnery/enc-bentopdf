(function () {
  function replaceTexts() {
    document.title = "ENC PDF Tools | ENC Network";

    const h1 = document.querySelector("h1");
    if (h1 && !h1.dataset.encChanged) {
      h1.textContent = "ENC PDF Tools";
      h1.dataset.encChanged = "true";
    }

    const candidates = Array.from(document.querySelectorAll("p, small, span"));
    candidates.forEach((el) => {
      const t = (el.textContent || "").toLowerCase();
      if (!el.dataset.encChanged && (t.includes("pdf") || t.includes("privacy") || t.includes("tool"))) {
        if (el.textContent.length > 20 && el.textContent.length < 220) {
          el.textContent = "Ferramentas para manipular PDFs com praticidade, segurança e eficiência, dentro do ambiente ENC Network.";
          el.dataset.encChanged = "true";
        }
      }
    });
  }

  function addHeaderBadge() {
    if (document.querySelector(".enc-header-badge")) return;
    const badge = document.createElement("div");
    badge.className = "enc-header-badge";
    badge.innerHTML = "<strong>ENC Network</strong><small>PDF Tools</small>";
    document.body.appendChild(badge);
  }

  function addHero() {
    if (document.querySelector(".enc-hero-banner")) return;
    const target = document.querySelector("main") || document.body;
    const hero = document.createElement("section");
    hero.className = "enc-hero-banner";
    hero.innerHTML = `
      <div class="enc-hero-kicker">ENC Network • Ferramentas Inteligentes</div>
      <div class="enc-hero-title">PDF Tools com identidade ENC</div>
      <p class="enc-hero-text">
        Ambiente web para compactar, converter, organizar e manipular arquivos PDF com foco em produtividade, segurança operacional e uso profissional.
      </p>
      <div class="enc-hero-tags">
        <span>PDF</span>
        <span>Automação</span>
        <span>Cloud</span>
        <span>Segurança</span>
        <span>IA Aplicada</span>
      </div>
    `;
    target.prepend(hero);
  }

  function run() {
    replaceTexts();
    addHeaderBadge();
    addHero();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", run);
  } else {
    run();
  }

  setTimeout(run, 700);
  setTimeout(run, 1800);
})();
