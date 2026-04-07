# VM Service Map PDF Generator — Interactive Prompt

> **Bu prompt'u Claude Code'a yapistirin. Claude sizinle konusarak tum bilgileri toplayacak,
> sunucunuzu kesfedecek ve profesyonel bir Service Map PDF'i olusturacaktir.**

---

## Kullanim

1. Asagidaki prompt'u kopyalayin
2. Claude Code'da yeni bir konusmaya yapisitirin
3. Claude sorulari cevaplayin — gerisini o halleder

---

## PROMPT — Asagisini Kopyalayin

````
Sunucum/VM'im icin profesyonel bir "VM Service Map" PDF dokumani olusturmak istiyorum.
Benimle konusarak tum bilgileri topla, sunucumu kesfet ve PDF'i olustur.

═══════════════════════════════════════════════════════════════
GOREV AKISI — Bu adimlari sirayla takip et
═══════════════════════════════════════════════════════════════

ADIM 0: SKILL KONTROLU
────────────────────────
react-pdf skill'inin yuklu olup olmadigini kontrol et.

Eger YUKLU DEGILSE, kullaniciya soyle sor:
  "react-pdf skill'i yuklu degil. Bu skill PDF olusturmak icin gerekli.
   Yuklemek icin Claude Code Skills marketplace'den 'react-pdf' aratabilirsiniz.

   Alternatif olarak, ayni tasarimi tek bir HTML dosyasi olarak da
   olusturabilirim — tarayicidan Print > Save as PDF ile cevirebilirsiniz.

   Hangisini tercih edersiniz?
   1) react-pdf skill'ini yukleyecegim, bekle
   2) HTML olarak olustur"

Kullanici cevap verene kadar DEVAM ETME.


ADIM 1: TEMA SECIMI
────────────────────
Kullaniciya su 6 tema secenegini sun. Kisa bir aciklama ve emoji ile goster:

  "PDF'in icin bir tema sec:

   1. midnight    — Koyu lacivert, neon aksanlar. Terminal/hacker hissi.
   2. clean-light — Beyaz, minimalist. Kurumsal ve temiz.
   3. nord        — Soguk mavi-gri tonlar. Rahatlatici, goz dostu.
   4. solarized   — Sicak koyu tonlar. Klasik gelistirici paleti.
   5. monokai     — Koyu zemin, canli neon renkler. VS Code nostaljisi.
   6. paper       — Krem/kagit tonu. Fiziksel baski icin ideal.

   Bir numara sec (veya isim yaz):"

Kullanici secene kadar DEVAM ETME.

TEMA PALETLERI (secime gore kullan):

midnight:
  background: #0d1117, card-bg: #161b22, card-border: #30363d
  text-primary: #e6edf3, text-muted: #8b949e, heading: #58a6ff
  accent-green: #3fb950, accent-yellow: #d29922, accent-red: #f85149
  accent-purple: #bc8cff, accent-orange: #d18616
  tag-bg: #1f2937, tag-text: kategoriye gore degisir

clean-light:
  background: #ffffff, card-bg: #ffffff, card-border: #e5e7eb
  card-shadow: 0 1px 3px rgba(0,0,0,0.1)
  text-primary: #111827, text-muted: #6b7280, heading: #1f2937
  accent-blue: #2563eb, accent-green: #059669, accent-yellow: #d97706
  accent-red: #dc2626, accent-purple: #7c3aed
  tag-bg: #f3f4f6, tag-text: #374151

nord:
  background: #2e3440, card-bg: #3b4252, card-border: #4c566a
  text-primary: #eceff4, text-muted: #d8dee9, heading: #88c0d0
  accent-green: #a3be8c, accent-yellow: #ebcb8b, accent-red: #bf616a
  accent-purple: #b48ead, accent-orange: #d08770
  tag-bg: #434c5e, tag-text: frost renklerinden

solarized:
  background: #002b36, card-bg: #073642, card-border: #586e75
  text-primary: #839496, text-muted: #657b83, heading: #268bd2
  accent-green: #859900, accent-yellow: #b58900, accent-red: #dc322f
  accent-purple: #6c71c4, accent-cyan: #2aa198, accent-orange: #cb4b16
  tag-bg: #073642

monokai:
  background: #272822, card-bg: #2d2e27, card-border: #49483e
  text-primary: #f8f8f2, text-muted: #75715e, heading: #66d9ef
  accent-green: #a6e22e, accent-yellow: #e6db74, accent-red: #f92672
  accent-purple: #ae81ff, accent-orange: #fd971f
  tag-bg: #3e3d32

paper:
  background: #faf9f6, card-bg: #ffffff, card-border: #d1d5db
  text-primary: #1a1a1a, text-muted: #6b7280, heading: #1a1a1a
  accent-blue: #1e40af, accent-green: #166534, accent-yellow: #92400e
  accent-red: #991b1b, accent-purple: #5b21b6
  tag-bg: #f3f4f6, tag-text: #374151, tag-border: #d1d5db


ADIM 2: SUNUCU BILGISI TOPLAMA
───────────────────────────────
Kullaniciya su sorulari sor (tek mesajda, numarali liste):

  "Sunucu bilgilerini toplayalim:

   1. Sunucu/VM adi nedir? (ornek: my-prod, btc-server)
   2. Cloud provider? (AWS, GCP, Azure, Hetzner, DigitalOcean, vb.)
   3. Region? (ornek: eu-west-1, us-east-1)
   4. Instance adi? (ornek: prod-vm-1)
   5. SSH kullanici adi? (ornek: ubuntu, deploy, root)
   6. SSH erisim komutu? (ornek: ssh my-server)
   7. GitHub org/kullanici adi? (footer icin, ornek: myorg)

   Bilmedigin veya olmayan alanlari bos birakabilirsin."


ADIM 3: SUNUCU KESFETME (OTONOM)
─────────────────────────────────
Kullaniciya sor:

  "Sunucuna SSH ile baglanarak servisleri otomatik kesfetmemi ister misin?
   Bunun icin SSH erisimim olmasi gerekiyor.

   A) Evet, baglan ve kesfet (SSH erisimi var)
   B) Hayir, servisleri ben manuel olarak soylerim

   Secimin:"

EGER A (otomatik kesif):
  Kullanicidan SSH komutu/alias'i onayla, sonra su komutlari calistir:
  
  # Calisan servisleri bul
  ssh <host> "systemctl list-units --type=service --state=running --no-pager"
  
  # Acik portlari bul
  ssh <host> "ss -tlnp 2>/dev/null || netstat -tlnp 2>/dev/null"
  
  # Altyapi servislerini tara
  ssh <host> "which docker nginx cloudflared redis-cli psql mongod 2>/dev/null; \
              dpkg -l 2>/dev/null | grep -iE 'postgres|mysql|redis|mongo|nginx|docker' || \
              rpm -qa 2>/dev/null | grep -iE 'postgres|mysql|redis|mongo|nginx|docker'"
  
  # Her servisin detaylarini al (WorkingDirectory, ExecStart)
  ssh <host> "for svc in <bulunan-servisler>; do \
    echo '=== '\$svc' ==='; \
    sudo systemctl cat \$svc 2>/dev/null | grep -E 'ExecStart|WorkingDirectory|User|Description'; \
  done"
  
  # Proje dizinlerini tara (runtime, framework, dependencies)
  ssh <host> "for dir in <bulunan-dizinler>; do \
    echo '=== '\$dir' ==='; \
    cat \$dir/requirements.txt 2>/dev/null | head -20; \
    cat \$dir/package.json 2>/dev/null | head -30; \
    cat \$dir/pyproject.toml 2>/dev/null | head -30; \
    ls \$dir/*.py \$dir/*.js \$dir/*.ts 2>/dev/null | head -10; \
  done"

  Sonuclari analiz ederek tum servis bilgilerini otomatik doldur.
  Eksik veya belirsiz bilgiler icin kullaniciya teyit sor.

EGER B (manuel):
  Kullaniciya sor:

  "Sunucundaki servisleri tek tek soylememize gerek yok.
   Asagidaki formatta istedigin kadar servis ekle.
   Bilmedigin alanlari bos birak:

   Her servis icin:
   - Servis adi
   - Ne yapar? (kisa aciklama)
   - Tipi: API | WEB APP | DASHBOARD | BOT | WORKER | CLI | TRADING
   - Runtime: Python 3.x / Node.js xx / Go / Rust / vb.
   - Framework: FastAPI, Django, Next.js, Express, vb.
   - Veritabani: PostgreSQL, MySQL, SQLite, Redis, MongoDB, vb.
   - Port (acik ise)
   - LLM kullaniyor mu? (hangi model?)
   - Dis API'ler: hangi servislere baglaniyor?
   - Ana kutuphane/dependency'ler

   Kac servisin var? Tek tek gidelim ya da hepsini bir listede yaz."


ADIM 4: EKSIKLERI TAMAMLA
──────────────────────────
Toplanan verilerden su bilgileri cikar veya kullaniciya sor:
- STATS_BADGES: Toplam servis sayisi, dil dagilimi, LLM kullanan sayi, acik port sayisi
  (Bunlari otomatik hesapla, kullaniciya onaylat)
- CATEGORIES: Servisleri tip bazinda grupla (Trading, Bot, Web, vb.)
  (Otomatik grupla, kullaniciya onaylat)  
- DEPENDENCIES: Tum dis API/servis bagimliliklarini topla
  (Servis bilgilerinden cikar, kullaniciya onaylat)
- DEPLOY FLOW: Deploy sureci nasil? (git push > ssh > pull > restart? Docker? CI/CD?)
- QUICK REFERENCE: Sik kullanilan SSH/yonetim komutlari
- CORE SERVICES: Altyapi (DB, cache, tunnel, logging, monitoring)

Her adimda kullaniciya ozet goster ve onayla:
  "Topladıgım bilgiler:
   - X servis buldum (listele)
   - Y port acik
   - Z dis bagimlilik
   Dogru mu? Eklemek/cikakmak istedigin bir sey var mi?"


ADIM 5: PDF OLUSTUR
────────────────────
Tum veri toplandiktan sonra kullaniciya de ki:
  "Tum bilgileri topladim. [tema] temasinda PDF'i olusturuyorum..."

Sonra PDF'i olustur (veya HTML, Adim 0'daki secime gore).


═══════════════════════════════════════════════════════════════
LAYOUT & DESIGN KURALLARI
═══════════════════════════════════════════════════════════════

SAYFA YAPISI (A4 portrait, sayfa sayisi servis sayisina gore dinamik):

SAYFA 1 — OVERVIEW
  - Ust: Sunucu adi (buyuk, bold, monospace) + monitor ikonu (unicode: U+1F5A5 veya basit ■)
  - Altinda: "VM Service Map // region // tarih" (ince, muted renk)
  - Stats badge'leri: Yatay siralanan kutucuklar, her birinde buyuk sayi + kucuk label
    Badge renkleri: her badge icin farkli aksan rengi (green, yellow, blue, purple, vb.)
  - "// INFRASTRUCTURE" bolumu: 2 kolonlu tablo (Platform | Core Services)
  - "// NETWORK PORTS" bolumu: 2 kolonlu (LISTENING public | INTERNAL ONLY)
  - "// SERVICE CATEGORIES" bolumu: 2x2 grid, her kutu renkli dot + kategori adi + servis listesi
  - Footer: org / server-name (sol) + sayfa no (sag)

SAYFA 2+ — SERVICE DETAILS
  - Servisler type'a gore grupla. Her grup bir "// GRUP ADI" basligi altinda.
  - Her servis bir kart icinde:
    * Sol ust: Renkli dot (●) + servis adi (buyuk, bold, monospace)
    * Sag ust: Type badge (TRADING, TELEGRAM BOT, WEB APP, vb.) muted renkte
    * Ortada: key-value satirlari (desc, runtime, framework, database, port, llm, ext. apis)
      Label: muted renk, deger: primary renk. Sabit genislik label kolonu.
    * Alt: Dependency tag'leri (kucuk rounded rect badge'ler, yan yana, wrap)
  - Sayfa basi 3-4 kart sigar. Gerekirse sayfayi bol.

SON SAYFA — DEPENDENCY MAP & REFERENCE
  - "// EXTERNAL DEPENDENCY MAP": Kategori bazli liste
    * Her kategori: Renkli dot + kategori adi (bold, uppercase)
    * Altinda satirlar: dependency adi (sol) → kullanan servisler (sag, muted)
  - Ince yatay ayirici cizgi
  - "// DEPLOY FLOW": Adimlar kutucuklar icinde > isaretiyle baglanmis
    * Altinda kisa aciklama satiri (muted)
  - "// QUICK REFERENCE": Komutlar monospace, her satir basi "$ " ile
    * Notlar italic/muted, "Note:" ile baslar

GENEL TASARIM:
  - Font: Courier (monospace) — tum dokuman boyunca
  - Basliklar: "// SECTION NAME" formati, uppercase, aksanli renk, buyuk font
  - Kartlar: ince border (tema'ya gore), padding 16-20px, margin-bottom 12px
  - Renkli dot'lar: ● karakteri, kategori renginde
  - Tag badge'leri: 8-10px font, rounded rect, yan yana, 4px gap, wrap destegi
  - Footer her sayfada: sol "org / server-name", sag "sayfa / toplam"
  - Sayfa margin: 40-50px
  - Satir araligi: rahat (1.4-1.6)

TAG RENKLENDIRME:
  - Python framework (fastapi, django, flask, celery, typer): yesil tonu
  - JS framework (next, react, vue, express, svelte): mavi tonu
  - Veritabani (asyncpg, redis, sqlite, duckdb, mongoose, sqlalchemy): turuncu tonu
  - AI/LLM (openai, anthropic, langchain, transformers): mor tonu
  - HTTP/Network (httpx, aiohttp, requests, axios, urllib): gri tonu
  - Bot framework (aiogram, python-telegram-bot, slack-bolt, discord.py): yesil tonu
  - Diger: tema muted rengi

RENK DOT KURALI (servis kartlarindaki ● rengi):
  - Karti hangi CATEGORY'de ise o kategorinin rengi
  - Eger birden fazla kategorideyse, ilk kategorinin rengi

═══════════════════════════════════════════════════════════════
ONEMLI KURALLAR
═══════════════════════════════════════════════════════════════

- ASLA kullaniciya ham veri formati gonderme. Her zaman konusma diliyle sor.
- Her adimda kullanici cevap verene kadar BEKLE. Birden fazla adimi birlestirme.
- SSH erisimine ihtiyacin varsa ONCE izin iste, sonra calistir.
- Belirsiz bilgileri TAHMIN ETME, kullaniciya sor.
- Servis sayisi az ise (1-3) sayfa sayisini azalt, cok ise (15+) artir.
- PDF dosya adini: <sunucu-adi>-service-map.pdf olarak kaydet.
- Olusturma tamamlaninca dosya yolunu kullaniciya soyle ve ac.
````

---

## Tema Onizleme Ozeti

| # | Tema | Gorunum | Ideal Kullanim |
|---|------|---------|---------------|
| 1 | `midnight` | Koyu lacivert, neon aksanlar | Gelistirici sunumlari, terminal estetigi |
| 2 | `clean-light` | Beyaz, minimalist | Kurumsal dokumanlar, yonetici raporlari |
| 3 | `nord` | Soguk mavi-gri | Goz yormayan, uzun sureli okuma |
| 4 | `solarized` | Sicak koyu tonlar | Klasik gelistirici tercihi |
| 5 | `monokai` | Koyu + canli neon | VS Code/Sublime nostaljisi, dikkat cekici |
| 6 | `paper` | Krem/kagit tonu | Fiziksel baski, PDF paylasimi |
