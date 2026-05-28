/* Agent Protocols — theme + reveal */
(() => {
  const root = document.documentElement;
  const STORAGE_KEY = 'ap-theme';

  // Mark page as JS-enabled so reveal styles activate (progressive enhancement)
  root.classList.add('has-js');

  // ---- Theme ----
  const getSystemTheme = () =>
    window.matchMedia && window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark';

  const applyTheme = (theme) => {
    root.setAttribute('data-theme', theme);
  };

  const stored = localStorage.getItem(STORAGE_KEY);
  applyTheme(stored || getSystemTheme());

  const toggle = document.getElementById('theme-toggle');
  if (toggle) {
    toggle.addEventListener('click', () => {
      const next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
      applyTheme(next);
      localStorage.setItem(STORAGE_KEY, next);
    });
  }

  // Sync with system if user has never toggled manually
  const mql = window.matchMedia('(prefers-color-scheme: light)');
  mql.addEventListener?.('change', (e) => {
    if (!localStorage.getItem(STORAGE_KEY)) {
      applyTheme(e.matches ? 'light' : 'dark');
    }
  });

  // ---- Scroll reveal ----
  const revealAll = () => {
    document.querySelectorAll('[data-anim]').forEach((el) => el.classList.add('is-in'));
  };

  if (!('IntersectionObserver' in window) || matchMedia('(prefers-reduced-motion: reduce)').matches) {
    revealAll();
  } else {
    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-in');
            io.unobserve(entry.target);
          }
        });
      },
      { rootMargin: '0px 0px -10% 0px', threshold: 0.05 }
    );

    document.querySelectorAll('[data-anim]').forEach((el) => {
      // If element is already in viewport on load, reveal immediately
      const rect = el.getBoundingClientRect();
      if (rect.top < window.innerHeight && rect.bottom > 0) {
        el.classList.add('is-in');
      } else {
        io.observe(el);
      }
    });
  }

  // ---- Marquee duplication for seamless loop ----
  const rail = document.querySelector('.hero__rail-text');
  if (rail && !rail.dataset.duped) {
    rail.innerHTML = rail.innerHTML + rail.innerHTML;
    rail.dataset.duped = '1';
  }
})();
