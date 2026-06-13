# HA Kiosk - iNFOREIS 2026
## Informações da Versão

| Campo | Valor |
|-------|-------|
| **Aplicação** | HA Kiosk |
| **Versão** | 2.0 |
| **Edição** | iNFOREIS 2026 |
| **Package ID** | com.aistudio.hakiosk.vtpnxe |
| **Min. Android** | Android 7.0 (API 24) |
| **Ficheiro APK** | HAKiosk-v2.0-iNFOREIS2026.apk (~13.8 MB) |

---

## Conteúdo do Pacote

```
installer/
├── HAKiosk-v2.0-iNFOREIS2026.apk   ← APK de release assinado
├── Instalar-HAKiosk.bat             ← Instalador Windows (duplo clique)
├── Instalar-HAKiosk.ps1             ← Instalador PowerShell (recomendado)
└── LEIA-ME.md                       ← Este ficheiro
```

---

## Instalação Rápida (USB)

### Opção 1 — Script automático (recomendado)
1. Ligue o tablet ao PC via **cabo USB**
2. Ative a **Depuração USB** no tablet:
   - Definições → Sobre o Tablet → toque **7 vezes** em `Número de Compilação`
   - Definições → Opções de Programador → **Depuração USB = ON**
3. Autorize a ligação no ecrã do tablet quando aparecer o popup
4. Faça duplo clique em **`Instalar-HAKiosk.bat`**
5. Aguarde a confirmação de instalação

### Opção 2 — Instalação manual no tablet
1. Copie o ficheiro `HAKiosk-v2.0-iNFOREIS2026.apk` para o tablet (via USB ou Bluetooth)
2. No tablet, abra o **Gestor de Ficheiros**
3. Navegue até ao ficheiro APK e toque nele
4. Permita instalação de origens desconhecidas se solicitado
5. Toque em **Instalar**

---

## Novidades da v2.0 (iNFOREIS 2026)

### 🔌 Integração Home Assistant
- **Deteção automática** de servidores HA via mDNS (Bonjour/Zeroconf)
- Configuração manual com URL e Token de Acesso de Longa Duração
- Fetch automático de todas as entidades `camera.*` do seu HA

### 🖥️ Novos Modos de Economizador de Ecrã
| Modo | Descrição |
|------|-----------|
| **Relógio Digital** | Relógio gigante com proteção anti burn-in OLED |
| **Diaporama** | Slideshow de fotos com transições suaves |
| **Ecrã Preto** | AMOLED negro total (simula ecrã desligado) |
| **Câmara HA** | Stream ao vivo das suas câmaras de segurança |

### 🎛️ Outras Melhorias
- Secção "Sobre" com informação iNFOREIS 2026
- Base de dados atualizada (v5)
- Melhorias de estabilidade

---

## Credenciais do Keystore (para atualizações futuras)

> ⚠️ Guarde estas informações em local seguro!

| Campo | Valor |
|-------|-------|
| **Ficheiro** | `inforeis-release.jks` (na raiz do projeto) |
| **Alias** | `inforeis` |
| **Validade** | 10.000 dias (~27 anos) |
| **Organização** | iNFOREIS, Portugal |

---

*HA Kiosk © iNFOREIS 2026 — Painel inteligente para Home Assistant*
